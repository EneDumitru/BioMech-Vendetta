using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;

#if UNITY_PS5
using UnityEngine.PS5;
using Unity.PSN.PS5;
using Unity.PSN.PS5.Aysnc;
using Unity.PSN.PS5.Initialization;
using Unity.PSN.PS5.Users;
using Unity.PSN.PS5.GameIntent;
#endif


/**
 * The NpManager class handles the general PSN.PS5.Main set up, and interfaces with the functions contained in UDSManager and the rest of the application.
 * The game object this is attached to will persist between scenes.
 */

public class NpManager : MonoBehaviour
{
    // Enumeration for the different states an Activity can be ended in
    public enum ActivityEndState
    {
        Unknown,
        Completed,
        Failed,
        Abandoned
    }

    // Stored record of which scenes have had Activities completed
    // Used for unlocking levels and for calculating if the progression Activity is complete
    public Dictionary<string, bool> levelsCompleted = new Dictionary<string, bool>();


    public static NpManager Instance;

    UDSManager m_uds;
    bool m_callActivitySetup = true;
    bool m_progressActivityComplete = false;
    bool isAllMissionCompleted = true;


    public static string activityName = "COMPLETE_LEVELS";

    void Awake()
    {
        for (int i = 0; i < 30; i++)
        {
            int id = i + 1;
            string key = "Complete_Level_" + id;
            levelsCompleted.Add(key, false);
        }

        // Set up for DontDestroyOnLoad() to be persistent between scenes
        if (Instance == null)
        {
            DontDestroyOnLoad(this.gameObject);
            Instance = this;
        }
        else
        {
            if (Instance != this)
            {
                Destroy(this.gameObject);
            }
        }

#if UNITY_PS5
        m_uds = new UDSManager();
        // Set up callback notification for GameIntent
        // The GameIntentSystem callback should be declared in Awake(), so you can catch the Game Intent before any initial loading
        GameIntentSystem.OnGameIntentNotification += m_uds.OnGameIntentNotification;
#endif
    }

    void Update()
    {
#if UNITY_PS5

        // Check user registration for a change in the PS5's active user (logging in, logging out etc)
        try
        {
            User.CheckRegistration();
        }
        catch (NullReferenceException e)
        {
            Debug.LogError(e.Message);
            Debug.LogError(e.StackTrace);
        }

        // Update PSN.PS5.Main
        // This must be called somewhere in your project, or PSN functions will fail to execute properly.
        try
        {
            Main.Update();
        }
        catch (Exception e)
        {
            Debug.LogError("Main.Update Exception : " + e.Message);
            Debug.LogError(e.StackTrace);
        }

        // If there is an listed active user and UDS has not been set up yet, start the process to set up Activities
        if (MyNPToolkitCustomWrapper.Instance.isInitialized
            && UnityEngine.PS5.Utility.initialUserId != null && m_callActivitySetup)
        {
            Debug.Log("Waiting to set up Activities...");
            StartCoroutine(m_uds.SetUpActivities());
            m_callActivitySetup = false;
        }

        //// Catch any callbacks from GameIntent and load the correct scene
        //if (m_uds.isActivitiesSetUp && m_uds.intentToResolve)
        //{
        //    m_uds.intentToResolve = false;
        //    SceneManager.LoadScene(m_uds.sceneToLoad);
        //}

        // Check if the overall progress activity has been completed
        if (!m_progressActivityComplete)
        {
            CheckProgressActivityCompletion();
        }
#endif

    }
    /*
     * CheckAsyncRequestOK() is used to inspect the results of completed AsyncRequests for failure/success.
     * Most PS5 network calls in the PSN package require use of AsyncRequest, including UDS functions.
     */

#if UNITY_PS5

    public static bool CheckAsyncRequestOK<R>(AsyncRequest<R> asyncRequest) where R : Request
    {
        if (asyncRequest == null)
        {
            UnityEngine.Debug.LogError("AsyncRequest is null");
            return false;
        }

        Request req = asyncRequest.Request;

        if (req == null)
        {
            UnityEngine.Debug.LogError("Request is null");
            return false;
        }

        if (req.Result.apiResult == APIResultTypes.Success)
        {
            return true;
        }

        string output = req.Result.ErrorMessage();

        if (req.Result.apiResult == APIResultTypes.Error)
        {
            Debug.LogError(output);
        }
        else
        {
            Debug.LogWarning(output);
        }
        return false;

    }
#endif


    /**
     * CheckProgressActivityCompletion() checks if the levels related to the progress Activity "Complete All Levels" are complete.
     * This is tracked through the Dictionary levelsCompleted.
     */
    void CheckProgressActivityCompletion()
    {
        isAllMissionCompleted = true;
        
        // SOLO GAME
        foreach (var item in levelsCompleted)
        {
            if (!item.Value)
            {
                isAllMissionCompleted = false;
            }
        }
        if (isAllMissionCompleted)
        {
            EndLevel(activityName, ActivityEndState.Completed);
            m_progressActivityComplete = true;
        }
    }

    /*
     * StartLevel() checks if UDS functions can be called, and subsequently starts the UDSManager coroutine for the 'activityStart' event.
     */
    public void StartLevel(string activityID)
    {
#if UNITY_PS5

        if (!User.IsActiveUserRegistered)
        {
            Debug.LogError("There is no user registered for PSN! Can't start activity with UDS.");
            return;
        }

        if (!m_uds.isActivitiesSetUp)
        {
            Debug.LogError("Activities haven't been set up yet! Can't start activity with UDS.");
            return;
        }

        StartCoroutine(m_uds.ActivityStart(activityID));
#endif

    }

    /*
     * EndLevel() checks if UDS functions can be called, and subsequently starts the UDSManager coroutine for the 'activityEnd' event.
     * It also converts the ActivityEndState enum value into the string name.
     */
    public void EndLevel(string activityID, ActivityEndState state)
    {
#if UNITY_PS5

        if (!User.IsActiveUserRegistered)
        {
            Debug.LogError("There is no user registered for PSN! Can't end activity with UDS.");
            return;
        }

        if (!m_uds.isActivitiesSetUp)
        {
            Debug.LogError("Activities haven't been set up yet! Can't end activity with UDS.");
            return;
        }

        string stateString;

        switch (state)
        {
            case (ActivityEndState.Completed):
                stateString = "completed";
                break;
            case (ActivityEndState.Failed):
                stateString = "failed";
                break;
            case (ActivityEndState.Abandoned):
                stateString = "abandoned";
                break;
            default:
                throw new Exception("Enum with no existing value...");
        }

        StartCoroutine(m_uds.ActivityEnd(activityID, stateString));
#endif

    }

}
