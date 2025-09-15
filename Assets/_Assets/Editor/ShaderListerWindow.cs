// ShaderListerWindow.cs
// Put this file inside an Editor/ folder.

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using UnityEditor;
using UnityEditor.IMGUI.Controls;   // <-- for SearchField
using UnityEngine;

public class ShaderListerWindow : EditorWindow
{
    [Serializable]
    private class ShaderEntry
    {
        public string name;
        public string path;
        public Shader shader;              // May be null for Shader Graph or compute entries
        public UnityEngine.Object asset;   // Shader, ShaderGraph, or ComputeShader asset
        public int materialUsageCount;
    }

    private readonly List<ShaderEntry> _entries = new List<ShaderEntry>();
    private Vector2 _scroll;
    private string _search = "";
    private enum SortBy { Name, Path, Usage }
    private SortBy _sortBy = SortBy.Name;
    private bool _sortAsc = true;

    // Options
    private bool _includeShaderGraph = true;      // .shadergraph
    private bool _includeComputeShaders = false;  // .compute
    private bool _countMaterialUsage = true;      // scan materials and count references

    // Search field (works across Unity versions)
    private SearchField _searchField;

    [MenuItem("Tools/Shader Lister")]
    private static void Open()
    {
        var win = GetWindow<ShaderListerWindow>("Shader Lister");
        win.minSize = new Vector2(700, 380);
        win.Refresh();
        win.Show();
    }

    private void OnEnable()
    {
        if (_searchField == null)
        {
            _searchField = new SearchField();
            _searchField.downOrUpArrowKeyPressed += Repaint; // small UX nicety
        }
    }

    private void OnGUI()
    {
        using (new EditorGUILayout.HorizontalScope(EditorStyles.toolbar))
        {
            if (GUILayout.Button("Refresh", EditorStyles.toolbarButton, GUILayout.Width(70)))
                Refresh();

            if (GUILayout.Button("Export CSV", EditorStyles.toolbarButton, GUILayout.Width(90)))
                ExportCSV();

            GUILayout.Space(8);

            _includeShaderGraph = GUILayout.Toggle(_includeShaderGraph, "Include Shader Graph", EditorStyles.toolbarButton);
            _includeComputeShaders = GUILayout.Toggle(_includeComputeShaders, "Include Compute", EditorStyles.toolbarButton);
            _countMaterialUsage = GUILayout.Toggle(_countMaterialUsage, "Count Material Usage", EditorStyles.toolbarButton);

            GUILayout.FlexibleSpace();

            GUILayout.Label("Sort:", GUILayout.Width(34));
            _sortBy = (SortBy)EditorGUILayout.EnumPopup(_sortBy, GUILayout.Width(90));
            _sortAsc = GUILayout.Toggle(_sortAsc, _sortAsc ? "▲" : "▼", EditorStyles.toolbarButton, GUILayout.Width(26));

            GUILayout.Space(6);
            _search = DrawToolbarSearchField(_search, 160f);
        }

        DrawHeader();

        var list = GetFilteredAndSorted(); // compute once per GUI frame

        _scroll = EditorGUILayout.BeginScrollView(_scroll);
        foreach (var e in list)
        {
            using (new EditorGUILayout.HorizontalScope())
            {
                // Name (click to ping)
                if (GUILayout.Button(string.IsNullOrEmpty(e.name) ? "(Unnamed)" : e.name, EditorStyles.label, GUILayout.MinWidth(200)))
                    if (e.asset) EditorGUIUtility.PingObject(e.asset);

                // Path (selectable)
                EditorGUILayout.SelectableLabel(e.path ?? "", GUILayout.Height(EditorGUIUtility.singleLineHeight));

                // Usage
                GUILayout.Label(_countMaterialUsage ? e.materialUsageCount.ToString() : "-", GUILayout.Width(60));

                // Buttons
                using (new EditorGUI.DisabledScope(!e.asset))
                {
                    if (GUILayout.Button("Ping", GUILayout.Width(48)))
                        EditorGUIUtility.PingObject(e.asset);

                    if (GUILayout.Button("Select", GUILayout.Width(58)))
                        Selection.activeObject = e.asset;

                    if (GUILayout.Button("Open", GUILayout.Width(50)))
                        AssetDatabase.OpenAsset(e.asset);
                }
            }
            GUILayout.Space(2);
        }
        EditorGUILayout.EndScrollView();

        EditorGUILayout.Space(4);
        EditorGUILayout.LabelField($"Total found: {_entries.Count}  |  Showing: {list.Count}", EditorStyles.miniLabel);
    }

    private void DrawHeader()
    {
        using (new EditorGUILayout.HorizontalScope(EditorStyles.helpBox))
        {
            GUILayout.Label("Shader Name", EditorStyles.boldLabel, GUILayout.Width(240));
            GUILayout.Label("Asset Path", EditorStyles.boldLabel);
            GUILayout.Label("Used By Materials", EditorStyles.boldLabel, GUILayout.Width(130));
            GUILayout.Space(160); // space for buttons column
        }
    }

    private List<ShaderEntry> GetFilteredAndSorted()
    {
        IEnumerable<ShaderEntry> q = _entries;

        if (!string.IsNullOrEmpty(_search))
        {
            var s = _search.Trim().ToLowerInvariant();
            q = q.Where(e =>
                (!string.IsNullOrEmpty(e.name) && e.name.ToLowerInvariant().Contains(s)) ||
                (!string.IsNullOrEmpty(e.path) && e.path.ToLowerInvariant().Contains(s)));
        }

        switch (_sortBy)
        {
            case SortBy.Name:
                q = _sortAsc ? q.OrderBy(e => e.name) : q.OrderByDescending(e => e.name);
                break;
            case SortBy.Path:
                q = _sortAsc ? q.OrderBy(e => e.path) : q.OrderByDescending(e => e.path);
                break;
            case SortBy.Usage:
                q = _sortAsc ? q.OrderBy(e => e.materialUsageCount) : q.OrderByDescending(e => e.materialUsageCount);
                break;
        }

        return q.ToList();
    }

    private void Refresh()
    {
        _entries.Clear();

        try
        {
            EditorUtility.DisplayProgressBar("Scanning", "Finding shader assets…", 0.1f);

            // Build queries
            var queries = new List<string> { "t:Shader" };
            if (_includeShaderGraph)
            {
                // Recognized in SRP projects; if not present, FindAssets just returns none.
                queries.Add("t:ShaderGraph");
                queries.Add("t:VFXShaderGraph");
            }
            if (_includeComputeShaders)
            {
                queries.Add("t:ComputeShader");
            }

            // Unique GUIDs
            var guids = new HashSet<string>();
            foreach (var q in queries)
                foreach (var g in AssetDatabase.FindAssets(q))
                    guids.Add(g);

            int i = 0;
            int total = guids.Count;

            foreach (var guid in guids)
            {
                i++;
                string path = AssetDatabase.GUIDToAssetPath(guid);
                var obj = AssetDatabase.LoadAssetAtPath<UnityEngine.Object>(path);
                var shader = obj as Shader;

                _entries.Add(new ShaderEntry
                {
                    name = shader != null ? shader.name : Path.GetFileNameWithoutExtension(path),
                    path = path,
                    shader = shader,
                    asset = obj,
                    materialUsageCount = 0
                });

                if (i % 50 == 0)
                    EditorUtility.DisplayProgressBar("Scanning", $"Processing assets… ({i}/{total})", Mathf.Lerp(0.1f, 0.6f, i / (float)Mathf.Max(1, total)));
            }

            if (_countMaterialUsage)
            {
                var matGuids = AssetDatabase.FindAssets("t:Material");
                int mTotal = matGuids.Length;
                for (int m = 0; m < mTotal; m++)
                {
                    if (m % 50 == 0)
                        EditorUtility.DisplayProgressBar("Scanning", $"Scanning materials… ({m}/{mTotal})", Mathf.Lerp(0.6f, 0.95f, m / (float)Mathf.Max(1, mTotal)));

                    string mPath = AssetDatabase.GUIDToAssetPath(matGuids[m]);
                    var mat = AssetDatabase.LoadAssetAtPath<Material>(mPath);
                    if (!mat) continue;

                    var sh = mat.shader;
                    if (!sh) continue;

                    // Prefer reference equality (same asset), then name match for built-in shaders
                    var entry = _entries.FirstOrDefault(e => e.shader == sh) ??
                                _entries.FirstOrDefault(e => e.name == sh.name);

                    if (entry != null)
                        entry.materialUsageCount++;
                }
            }
        }
        finally
        {
            EditorUtility.ClearProgressBar();
            Repaint();
        }
    }

    private void ExportCSV()
    {
        var filtered = GetFilteredAndSorted();
        if (filtered.Count == 0)
        {
            EditorUtility.DisplayDialog("Export CSV", "No shaders to export.", "OK");
            return;
        }

        string path = EditorUtility.SaveFilePanel("Export Shaders CSV", "", "Shaders.csv", "csv");
        if (string.IsNullOrEmpty(path)) return;

        try
        {
            using (var sw = new StreamWriter(path))
            {
                sw.WriteLine("Name,Path,MaterialUsageCount");
                foreach (var e in filtered)
                {
                    string name = EscapeCSV(e.name);
                    string apath = EscapeCSV(e.path);
                    string usage = _countMaterialUsage ? e.materialUsageCount.ToString() : "";
                    sw.WriteLine($"{name},{apath},{usage}");
                }
            }
            EditorUtility.RevealInFinder(path);
        }
        catch (Exception ex)
        {
            Debug.LogError("Failed to export CSV: " + ex.Message);
            EditorUtility.DisplayDialog("Export CSV", "Failed to export. See console for details.", "OK");
        }
    }

    private static string EscapeCSV(string s)
    {
        if (string.IsNullOrEmpty(s)) return "";
        if (s.Contains(",") || s.Contains("\""))
            return "\"" + s.Replace("\"", "\"\"") + "\"";
        return s;
    }

    // ------- Utility: robust toolbar search field using SearchField -------
    private string DrawToolbarSearchField(string value, float minWidth = 140f)
    {
        if (_searchField == null)
        {
            _searchField = new SearchField();
            _searchField.downOrUpArrowKeyPressed += Repaint;
        }

        Rect r = GUILayoutUtility.GetRect(0, 20, GUILayout.MinWidth(minWidth));
        return _searchField.OnToolbarGUI(r, value);
    }
}
