using System.Collections.Generic;
using System.IO;
using UnityEditor;
using UnityEngine;

public class SaveManagerEditor : EditorWindow
{
    private string filePath = ""; // Path to the save file

    [MenuItem("Window/Save File Deletion Window")]
    public static void ShowWindow()
    {
        GetWindow<SaveManagerEditor>("Save File Deletion");
    }

    private void OnGUI()
    {
        GUILayout.Label("Save File Deletion", EditorStyles.boldLabel);

        //filePath = EditorGUILayout.TextField("File Path", filePath);
        filePath = Application.persistentDataPath + "\\save.json";

        if (GUILayout.Button("Delete Save File"))
        {
            DeleteSaveFile();
        }

        if (GUILayout.Button("Delete Player Prefs"))
        {
            PlayerPrefs.DeleteAll();
        }

        if (GUILayout.Button("Delete Everything"))
        {
            DeleteSaveFile();
            PlayerPrefs.DeleteAll();
        }
    }

    private void DeleteSaveFile()
    {
        if (File.Exists(filePath))
        {
            File.Delete(filePath);
            Debug.Log("Save file deleted at path: " + filePath);
        }
        else
        {
            Debug.LogWarning("Save file does not exist at path: " + filePath);
        }
    }


}