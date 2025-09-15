// ShaderVariantBuildReporter.cs
// Counts real shader variants during a build and writes a JSON report to Library/ShaderVariantReport.json

#if UNITY_EDITOR
using System;
using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEditor.Build;
using UnityEditor.Build.Reporting;
using UnityEditor.Rendering;
using UnityEngine;
using UnityEngine.Rendering;

namespace ShaderVariantReporting
{
    // Accumulates variants per shader during the build
    class ShaderVariantCounter : IPreprocessShaders
    {
        internal static readonly Dictionary<string, long> Counts = new Dictionary<string, long>(1024);
        public int callbackOrder => int.MaxValue;

        public void OnProcessShader(Shader shader, ShaderSnippetData snippet, IList<ShaderCompilerData> data)
        {
            if (shader == null || data == null) return;
            // This now counts the variants AFTER Sigtrap (and others) have stripped
            var count = data.Count;
            if (count <= 0) return;

            if (Counts.TryGetValue(shader.name, out var existing))
                Counts[shader.name] = existing + count;
            else
                Counts[shader.name] = count;
        }
    }

    // Handles clearing before build and writing the JSON after build
    class ShaderVariantBuildReportHooks : IPreprocessBuildWithReport, IPostprocessBuildWithReport
    {
        public int callbackOrder => int.MinValue;

        public static string ReportPath =>
            Path.GetFullPath(Path.Combine(Application.dataPath, "../Library/ShaderVariantReport.json"));

        public void OnPreprocessBuild(BuildReport report)
        {
            ShaderVariantCounter.Counts.Clear();
            // Optional marker so tools know a build started
            try { File.WriteAllText(ReportPath, "{\"status\":\"building\"}"); } catch { /* ignore */ }
        }

        public void OnPostprocessBuild(BuildReport report)
        {
            try
            {
                var wrapper = new ShaderVariantReport
                {
                    project = Application.productName,
                    platform = report.summary.platform.ToString(),
                    timeUtc = DateTime.UtcNow.ToString("o"),
                    unity = Application.unityVersion,
                    totals = new List<ShaderVariantItem>(ShaderVariantCounter.Counts.Count)
                };

                long grand = 0;
                foreach (var kv in ShaderVariantCounter.Counts)
                {
                    wrapper.totals.Add(new ShaderVariantItem { shader = kv.Key, variants = kv.Value });
                    grand += kv.Value;
                }
                wrapper.grandTotal = grand;

                var json = JsonUtility.ToJson(wrapper, true);
                File.WriteAllText(ReportPath, json);
                Debug.Log($"[ShaderVariantBuildReport] Wrote: {ReportPath}  (Total variants: {grand:n0})");
            }
            catch (Exception ex)
            {
                Debug.LogError("[ShaderVariantBuildReport] Failed to write report: " + ex.Message);
            }
            finally
            {
                ShaderVariantCounter.Counts.Clear();
            }
        }

        [Serializable]
        public class ShaderVariantReport
        {
            public string project;
            public string platform;
            public string timeUtc;
            public string unity;
            public long grandTotal;
            public List<ShaderVariantItem> totals;
        }

        [Serializable]
        public class ShaderVariantItem
        {
            public string shader;
            public long variants;
        }
    }
}
#endif
