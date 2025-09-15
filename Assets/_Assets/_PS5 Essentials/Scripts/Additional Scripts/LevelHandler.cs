/*
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;

/*
 *  The LevelHandler class manages the UI and input for the 'Level-' scenes.
 #1#

public class LevelHandler : MonoBehaviour
{
    public string[] levelActivities;
    public string levelName;
    public GameObject activityCompleteUI;
    public GameObject activityIncompleteUI;

    bool isSceneCompleted = false;

    void Start()
    {
#if UNITY_PS5
        // Check if the Activities in the scene are complete
        // This is recorded in the Dictionary levelsCompleted in NpManager
        isSceneCompleted = NpManager.Instance.levelsCompleted[levelName];


        if (!isSceneCompleted || levelName == "SecretLevel")
        {
            // If the scene hasn't been completed, start all Activities for the scene
            // The 'Secret Level' has an Open-Ended Activity so is always available to complete
            foreach (string activityID in levelActivities)
            {
                NpManager.Instance.StartLevel(activityID);
            }
        }
        else
        {
            activityIncompleteUI.SetActive(false);
            activityCompleteUI.SetActive(true);
        }
#endif
    }

    void Update()
    {
#if UNITY_EDITOR
        Debug.Log("This doesn't work in the Editor!");
#endif
        bool crossKey = false;
        bool squareKey = false;
        bool circleKey = false;

        if (Gamepad.current != null)
        {
            crossKey = Gamepad.current.buttonSouth.wasPressedThisFrame;
            squareKey = Gamepad.current.buttonWest.wasPressedThisFrame;
            circleKey = Gamepad.current.buttonEast.wasPressedThisFrame;
        }

        if (!isSceneCompleted && (crossKey || squareKey || circleKey))
        {
            // If this is a level required as a Task for the Progress Activity, you can end the level in multiple states.
            if (levelName != "SecretLevel")
            {
#if UNITY_PS5
                NpManager.ActivityEndState endState = NpManager.ActivityEndState.Unknown;

                if (crossKey)
                {
                    endState = NpManager.ActivityEndState.Completed;
                    NpManager.Instance.levelsCompleted[levelName] = true;
                }
                else if (squareKey)
                {
                    endState = NpManager.ActivityEndState.Failed;
                }
                else if (circleKey)
                {
                    endState = NpManager.ActivityEndState.Abandoned;
                }

                // End all Activities for this level with the selected end state.
                foreach (string activityID in levelActivities)
                {
                    NpManager.Instance.EndLevel(activityID, endState);
                }
#endif
                SceneManager.LoadScene("MainScene");
            }
            // The "Open the Secret Level" Activity is Open-Ended and not designed to be failed, so it ends with state 'completed'.
            else
            {
                if (crossKey)
                {
#if UNITY_PS5
                    NpManager.Instance.EndLevel(levelActivities[0], NpManager.ActivityEndState.Completed);
                    NpManager.Instance.levelsCompleted[levelName] = true;
#endif
                    SceneManager.LoadScene("MainScene");
                }
            }
        }
        // If the level was already completed, no Activities are triggered and we exit the scene.
        else
        {
            if (crossKey)
            {
                SceneManager.LoadScene("MainScene");
            }
        }
        
    }
}
*/

