/*
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using System;

/*
 * The MenuHandler class handles the UI and input for the the MainMenu scene.
 #1#

public class MenuHandler : MonoBehaviour
{

    [System.Serializable]
    struct ButtonAndLevel
    {
        public Button button;
        public string levelName;
        public string dependsOnLevel;
    }

    [SerializeField]
    private ButtonAndLevel [] m_levelButtons;

    void Start()
    {
        for (int i=0; i<m_levelButtons.Length; ++i)
        {
            ButtonAndLevel b = m_levelButtons[i];

            // This level might require another one to be completed first
            string dependsOnLevel = b.dependsOnLevel;
            if (!string.IsNullOrEmpty(dependsOnLevel))
            {
                b.button.interactable = NpManager.Instance.levelsCompleted[dependsOnLevel];
            }
           
            b.button.onClick.AddListener (() => LoadLevel(b.levelName));
        }

        EventSystem.current.SetSelectedGameObject(m_levelButtons[0].button.gameObject);
    }


    void LoadLevel(string level)
    {
        Debug.Log ($"Loading level \"{level}\".");
        SceneManager.LoadScene(level);
    }
}
*/
