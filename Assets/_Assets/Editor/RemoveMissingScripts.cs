using UnityEngine;
using UnityEditor;

public class RemoveMissingScripts : EditorWindow
{
    private int destroyedObjectCount = 0;

    [MenuItem("Custom/Remove Missing Scripts")]
    public static void ShowWindow()
    {
        EditorWindow.GetWindow(typeof(RemoveMissingScripts));
    }

    private void OnGUI()
    {
        GUILayout.Label("Remove Missing Scripts", EditorStyles.boldLabel);

        if (GUILayout.Button("Remove Missing Scripts"))
        {
            RemoveMissing();
        }

        GUILayout.Label("Destroyed Object Count: " + destroyedObjectCount);
    }

    private void RemoveMissing()
    {
        GameObject[] selectedObjects = Selection.gameObjects;
        destroyedObjectCount = 0;

        foreach (GameObject obj in selectedObjects)
        {
            PrefabInstanceStatus prefabStatus = PrefabUtility.GetPrefabInstanceStatus(obj);

            if (prefabStatus != PrefabInstanceStatus.NotAPrefab && prefabStatus != PrefabInstanceStatus.MissingAsset)
            {
                Debug.LogWarning("Skipping removal for object inside a prefab instance: " + obj.name);
                continue;
            }

            Undo.RegisterFullObjectHierarchyUndo(obj, "Remove Missing Scripts");

            Component[] components = obj.GetComponents<Component>();

            for (int i = components.Length - 1; i >= 0; i--)
            {
                if (components[i] == null)
                {
                    Object.DestroyImmediate(obj, true);
                    destroyedObjectCount++;
                    break;
                }
            }
        }

        Debug.Log("Removed missing scripts from selected GameObjects. Total objects destroyed: " + destroyedObjectCount);
    }
}
