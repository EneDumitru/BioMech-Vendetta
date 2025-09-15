// ShaderVariantReportWindow.cs
// Editor window to view & export shader variant counts collected during the last build.

#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using UnityEditor;
using UnityEditor.IMGUI.Controls; // SearchField
using UnityEngine;
using static ShaderVariantReporting.ShaderVariantBuildReportHooks;

public class ShaderVariantReportWindow : EditorWindow
{
    [MenuItem("Tools/Shader Variants/Variant Report Window")]
    public static void Open()
    {
        var w = GetWindow<ShaderVariantReportWindow>("Shader Variant Report");
        w.minSize = new Vector2(720, 420);
        w.LoadReport(); // try load on open
        w.Show();
    }

    // Data read from JSON report
    private ShaderVariantReport _report;
    private readonly List<ShaderRow> _rows = new List<ShaderRow>();

    // UI
    private Vector2 _scroll;
    private SearchField _searchField;
    private string _search = "";
    private enum SortBy { Shader, Variants }
    private SortBy _sortBy = SortBy.Variants;
    private bool _asc = false;

    private string ReportPath =>
        Path.GetFullPath(Path.Combine(Application.dataPath, "../Library/ShaderVariantReport.json"));

    private class ShaderRow
    {
        public string name;
        public long variants;
    }

    private void OnEnable()
    {
        if (_searchField == null)
        {
            _searchField = new SearchField();
            _searchField.downOrUpArrowKeyPressed += Repaint;
        }
    }

    private void OnGUI()
    {
        DrawToolbar();
        DrawHeader();
        DrawTable();

        GUILayout.FlexibleSpace();
        DrawFooter();
    }

    private void DrawToolbar()
    {
        using (new EditorGUILayout.HorizontalScope(EditorStyles.toolbar))
        {
            if (GUILayout.Button("Load Report", EditorStyles.toolbarButton, GUILayout.Width(100)))
                LoadReport();

            if (GUILayout.Button("Open JSON", EditorStyles.toolbarButton, GUILayout.Width(90)))
            {
                if (File.Exists(ReportPath)) EditorUtility.RevealInFinder(ReportPath);
                else EditorUtility.DisplayDialog("Open JSON", "Report file not found. Build a player first.", "OK");
            }

            GUILayout.Space(8);

            if (GUILayout.Button("Export CSV", EditorStyles.toolbarButton, GUILayout.Width(90)))
                ExportCSV();
            if (GUILayout.Button("Export JSON", EditorStyles.toolbarButton, GUILayout.Width(96)))
                ExportJSON();

            GUILayout.FlexibleSpace();

            GUILayout.Label("Sort:", GUILayout.Width(34));
            _sortBy = (SortBy)EditorGUILayout.EnumPopup(_sortBy, GUILayout.Width(90));
            _asc = GUILayout.Toggle(_asc, _asc ? "▲" : "▼", EditorStyles.toolbarButton, GUILayout.Width(26));

            GUILayout.Space(6);
            Rect r = GUILayoutUtility.GetRect(0, 20, GUILayout.MinWidth(200));
            _search = _searchField.OnToolbarGUI(r, _search);
        }
    }

    private void DrawHeader()
    {
        using (new EditorGUILayout.VerticalScope(EditorStyles.helpBox))
        {
            if (_report == null)
            {
                EditorGUILayout.LabelField("No report loaded.", EditorStyles.boldLabel);
                EditorGUILayout.LabelField("Run a player build to generate Library/ShaderVariantReport.json, then click \"Load Report\".");
                return;
            }

            EditorGUILayout.LabelField($"{_report.project} · {_report.platform} · Unity {_report.unity}",
                EditorStyles.boldLabel);
            EditorGUILayout.LabelField($"Build time (UTC): {_report.timeUtc}");
            EditorGUILayout.LabelField($"Total variants: {_report.grandTotal:n0}");
        }
    }

    private void DrawTable()
    {
        if (_report == null) return;

        // Header row
        using (new EditorGUILayout.HorizontalScope(EditorStyles.helpBox))
        {
            GUILayout.Label("Shader", EditorStyles.boldLabel, GUILayout.Width(420));
            GUILayout.Label("Variants", EditorStyles.boldLabel, GUILayout.Width(120));
            GUILayout.FlexibleSpace();
        }

        var list = FilterAndSort(_rows);

        _scroll = EditorGUILayout.BeginScrollView(_scroll);
        foreach (var row in list)
        {
            using (new EditorGUILayout.HorizontalScope())
            {
                // Shader (click to ping in Project if exists)
                if (GUILayout.Button(row.name, EditorStyles.label, GUILayout.Width(420)))
                {
                    // Try find the shader asset by name
                    var shader = Shader.Find(row.name);
                    if (shader != null) EditorGUIUtility.PingObject(shader);
                }

                GUILayout.Label(row.variants.ToString("n0"), GUILayout.Width(120));
                GUILayout.FlexibleSpace();
            }
        }
        EditorGUILayout.EndScrollView();

        EditorGUILayout.Space(2);
        EditorGUILayout.LabelField($"Shaders: {list.Count:n0}", EditorStyles.miniLabel);
    }

    private void DrawFooter()
    {
        using (new EditorGUILayout.HorizontalScope())
        {
            GUILayout.FlexibleSpace();
            GUILayout.Label(File.Exists(ReportPath) ? $"Report: {ReportPath}" : "Report not found", EditorStyles.miniLabel);
        }
    }

    // ---------- Data ops ----------
    private void LoadReport()
    {
        _report = null;
        _rows.Clear();

        try
        {
            if (!File.Exists(ReportPath))
            {
                Debug.LogWarning($"Shader Variant Report not found. Build a player first.\nExpected: {ReportPath}");
                return;
            }

            string json = File.ReadAllText(ReportPath);
            var rep = JsonUtility.FromJson<ShaderVariantReport>(json);
            if (rep == null || rep.totals == null)
            {
                Debug.LogError("Failed to parse shader variant report JSON.");
                return;
            }

            _report = rep;

            foreach (var t in rep.totals)
                _rows.Add(new ShaderRow { name = t.shader, variants = t.variants });

            Repaint();
        }
        catch (Exception ex)
        {
            Debug.LogError("LoadReport error: " + ex.Message);
        }
    }

    private List<ShaderRow> FilterAndSort(List<ShaderRow> source)
    {
        IEnumerable<ShaderRow> q = source;

        if (!string.IsNullOrWhiteSpace(_search))
        {
            var s = _search.Trim().ToLowerInvariant();
            q = q.Where(r => r.name != null && r.name.ToLowerInvariant().Contains(s));
        }

        switch (_sortBy)
        {
            case SortBy.Shader:
                q = _asc ? q.OrderBy(r => r.name) : q.OrderByDescending(r => r.name);
                break;
            case SortBy.Variants:
                q = _asc ? q.OrderBy(r => r.variants) : q.OrderByDescending(r => r.variants);
                break;
        }

        return q.ToList();
    }

    private void ExportCSV()
    {
        if (_report == null) { EditorUtility.DisplayDialog("Export CSV", "No report loaded.", "OK"); return; }

        string path = EditorUtility.SaveFilePanel("Export Shader Variant Report (CSV)", "", "ShaderVariantReport.csv", "csv");
        if (string.IsNullOrEmpty(path)) return;

        try
        {
            var list = FilterAndSort(_rows);
            var sb = new StringBuilder(4096);
            sb.AppendLine("Shader,Variants");
            foreach (var r in list)
            {
                var name = EscapeCSV(r.name);
                sb.Append(name).Append(',').Append(r.variants).AppendLine();
            }
            File.WriteAllText(path, sb.ToString());
            EditorUtility.RevealInFinder(path);
        }
        catch (Exception ex)
        {
            Debug.LogError("ExportCSV error: " + ex.Message);
            EditorUtility.DisplayDialog("Export CSV", "Failed to export. See Console for details.", "OK");
        }
    }

    private void ExportJSON()
    {
        if (_report == null) { EditorUtility.DisplayDialog("Export JSON", "No report loaded.", "OK"); return; }

        string path = EditorUtility.SaveFilePanel("Export Shader Variant Report (JSON)", "", "ShaderVariantReport.json", "json");
        if (string.IsNullOrEmpty(path)) return;

        try
        {
            var json = JsonUtility.ToJson(_report, true);
            File.WriteAllText(path, json);
            EditorUtility.RevealInFinder(path);
        }
        catch (Exception ex)
        {
            Debug.LogError("ExportJSON error: " + ex.Message);
            EditorUtility.DisplayDialog("Export JSON", "Failed to export. See Console for details.", "OK");
        }
    }

    private static string EscapeCSV(string s)
    {
        if (string.IsNullOrEmpty(s)) return "";
        bool needsQuotes = s.Contains(",") || s.Contains("\"") || s.Contains("\n") || s.Contains("\r");
        if (needsQuotes) return "\"" + s.Replace("\"", "\"\"") + "\"";
        return s;
    }
}
#endif
