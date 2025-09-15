using System.Collections;
using UnityEngine;
using UnityEngine.SceneManagement;

#if UNITY_PS5
using Unity.PSN.PS5.Aysnc;
using Unity.PSN.PS5.UDS;
using Unity.PSN.PS5.GameIntent;
#endif
/*
 * The UDSManager class defines functions needed to initialise UDS and send UDS events for Activities.
 * These functions are then called from the NpManager MonoBehaviour class.
 * 
 * For more information about the different UDS system events used, please read the PS5 SDK UDS Event Appendix documentation:
 * https://p.siedev.net/resources/documents/SDK/latest/UniversalDataSystem-Overview/0010.html
 * 
 * All UniversalDataSystem.PostEventRequest operations call sceNpUniversalDataSystemPostEvent().
 * 
 * Where yield WaitUntil() is called in coroutine functions, the coroutine is suspended until the operation is complete.
 * 
 * NOTE: 1 second delays are added into Event calls to work around a bug in the PSN server system.
 * For more information, read this technote: https://p.siedev.net/technotes/view/336/1
 */

public class UDSManager
{
#if UNITY_PS5
    public bool isActivitiesSetUp = false;
    public string[] myActivities = { NpManager.activityName };

    public bool intentToResolve = true;
    public string sceneToLoad = "MainScene";

    /**
     * SetUpActivities() is a coroutine that executes necessary UDS and Activities set up in order.
     * It:
     * - starts the UDS system 
     * - terminates all leftover Activities from the last application launch
     * - makes the desired Activites available to launch 
     * - starts the sample progress activity.
     * 
     * If any errors are returned in the sub-coroutines, an Exception will be thrown.
     * 
     * If all sub-coroutines complete successfully, isActivitiesSetUp is set to true.
     */
    public IEnumerator SetUpActivities()
    {
        yield return new WaitUntil(() => PS5TrophyManager.Instance.trophiesSet);

        Debug.LogError("First Step");
        var startUDSOperation = StartUDS();
        yield return startUDSOperation;
        Debug.LogError("Second Step");
        var terminateOperation = TerminateAllActivities();
        yield return terminateOperation;
        Debug.LogError("Third Step");
        var availOperation = MakeAllActivitiesAvailable();
        yield return availOperation;
        Debug.LogError("Fourth Step");
        var startOperation1 = ActivityStart( NpManager.activityName);
        yield return startOperation1;

        Debug.LogError("Activity set up complete");
        isActivitiesSetUp = true;
    }

    /**
     * StartUDS() is a coroutine that schedules an AsyncRequest with UniversalDataSystem.StartSystemRequest.
     * It then suspends execution until the operation is complete.
     * 
     * UniversalDataSystem.StartSystemRequest calls the native PS5 function sceNpUniversalDataSystemInitialize().
     * 
     * If UniversalDataSystem.StartSystemRequest fails, an exception is thrown.
     */
    public IEnumerator StartUDS()
    {
        
        PS5UDSManager.Instance.SetRequest();
        yield return new WaitForSecondsRealtime(3f);
        
        yield return null;
        
        /*UniversalDataSystem.StartSystemRequest request = new UniversalDataSystem.StartSystemRequest();

        // poolSize is the size in bytes of the memory pool to be used by the NpUniversalDataSystem library
        request.PoolSize = 256 * 1024;

        var startOp = new AsyncRequest<UniversalDataSystem.StartSystemRequest>(request);

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        UniversalDataSystem.Schedule(startOp);

        yield return new WaitUntil(() => startOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(startOp))
        {
            throw new System.Exception("UDS did not start successfully!");
        }*/
    }

    /**
     * TerminateAllActivities() is a coroutine that creates a UDSEvent class to call activityTerminate.
     * activityTerminate is a UDS system event that resets the progress of all currently running Activities,
     * so they return to their initial state.
     * 
     * activityTerminate has no additional required fields.
     * 
     * If UniversalDataSystem.PostEventRequest fails, an exception is thrown.
     */
    public IEnumerator TerminateAllActivities()
    {
        UniversalDataSystem.UDSEvent activityTerminateEvent = new UniversalDataSystem.UDSEvent();
        activityTerminateEvent.Create("activityTerminate");

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        AsyncRequest<UniversalDataSystem.PostEventRequest> runningOp = PostCustomUDSEvent(activityTerminateEvent);

        yield return new WaitUntil(() => runningOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(runningOp))
        {
            throw new System.Exception("Error terminating Activities");
        }
    }

    /**
     * MakeAllActivitiesAvailable() is a coroutine that creates a UDSEvent class to call activityAvailabilityChange.
     * activityAvailabilityChange is a UDS system event that takes an array of activityIDs to make available or unavailable to the user.
     * 
     * activityAvailabilityChange requires either or both these fields: 'availableActivites' and 'unavailableActivities'.
     * Here, two sample Activities are made available to the user using the availableActivities field.
     * 
     * activityAvailabilityChange also requires the 'mode' field.
     * Setting mode as 'full' resets all unspecified Activities to their original state. 
     * Setting mode as 'delta' leaves all unspecified Activities unaffected.
     * 
     * If UniversalDataSystem.PostEventRequest fails, an exception is thrown.
     */
    public IEnumerator MakeAllActivitiesAvailable()
    {
        UniversalDataSystem.UDSEvent changeAvailabilityEvent = new UniversalDataSystem.UDSEvent();
        changeAvailabilityEvent.Create("activityAvailabilityChange");

        // Set the required properties for the activityAvailabilityChange event
        // To set an array as a property of the UDSEvent class, you need to use an EventPropertyArray
        UniversalDataSystem.EventPropertyArray availableActivities = new UniversalDataSystem.EventPropertyArray(UniversalDataSystem.PropertyType.String);

        availableActivities.CopyValues(myActivities);

        changeAvailabilityEvent.Properties.Set("availableActivities", availableActivities);
        changeAvailabilityEvent.Properties.Set("mode", "full");

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        AsyncRequest<UniversalDataSystem.PostEventRequest> runningOp = PostCustomUDSEvent(changeAvailabilityEvent);

        yield return new WaitUntil(() => runningOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(runningOp))
        {
            throw new System.Exception("Error changing availability of Activities");
        }
    }

    /**
     * MakeActivitiesUnavailable() is a coroutine that creates a UDSEvent class to call activityAvailabilityChange.
     * activityAvailabilityChange is a UDS system event that takes an array of activityIDs to make available or unavailable to the user.
     * 
     * activityAvailabilityChange requires either or both these fields: 'availableActivites' and 'unavailableActivities'.
     * You can specify the Activities to be made unavailable with the function parameter activityIDs.
     * 
     * activityAvailabilityChange also requires the 'mode' field. 
     * Setting mode as 'full' resets all unspecified Activities to their original state. 
     * Setting mode as 'delta' leaves all unspecified Activities unaffected.
     * 
     * If UniversalDataSystem.PostEventRequest fails, an exception is thrown.
     */
    public IEnumerator MakeActivitiesUnavailable(string[] activityIDs)
    {
        UniversalDataSystem.UDSEvent changeAvailEvent = new UniversalDataSystem.UDSEvent();
        changeAvailEvent.Create("activityAvailabilityChange");

        // Set the required properties for the activityAvailabilityChange event
        // To set an array as a property of the UDSEvent class, you need to use an EventPropertyArray
        UniversalDataSystem.EventPropertyArray unavailableActivities = new UniversalDataSystem.EventPropertyArray(UniversalDataSystem.PropertyType.String);
        unavailableActivities.CopyValues(activityIDs);

        changeAvailEvent.Properties.Set("unavailableActivities", unavailableActivities);
        changeAvailEvent.Properties.Set("mode", "delta");

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        AsyncRequest<UniversalDataSystem.PostEventRequest> runningOp = PostCustomUDSEvent(changeAvailEvent);

        yield return new WaitUntil(() => runningOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(runningOp))
        {
            throw new System.Exception("Error changing availability of Activities");
        }
    }

    /**
     * ActivityStart() is a coroutine that creates a UDSEvent class to call activityStart.
     * actvityStart is a UDS system event that indicates to the system that the user has begun an Activity.
     * 
     * activityStart requires the field 'activityID', which specifies the Activity to start.
     * 
     * More optional fields are specified in the UDS event appendix, linked at the top of this file.
     * 
     * If UniversalDataSystem.PostEventRequest fails, an exception is thrown.
     */
    public IEnumerator ActivityStart(string activityID)
    {
        Debug.LogError("Start Activity: " + activityID);
        UniversalDataSystem.UDSEvent activityStartEvent = new UniversalDataSystem.UDSEvent();

        activityStartEvent.Create("activityStart");

        activityStartEvent.Properties.Set("activityId", activityID);

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        AsyncRequest<UniversalDataSystem.PostEventRequest> runningOp = PostCustomUDSEvent(activityStartEvent);

        yield return new WaitUntil(() => runningOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(runningOp))
        {
            throw new System.Exception("Error starting Activity with ID " + activityID);
        }
        else
            Debug.LogError("Successful Start Activity: " + activityID);

    }

    /**
     * ActivityEnd() is a coroutine that creates a UDSEvent class to call activityEnd.
     * activityEnd is a UDS system event that indicates to the system that the user has ended an Activity.
     * 
     * activityEnd requires the field 'activityID', which specifies the Activity to end.
     * The optional field 'outcome' is used here - this specifies whether the user completed, failed or abandoned the Activity.
     * 
     * More optional fields are specified in the UDS event appendix, linked at the top of this file.
     * 
     * If UniversalDataSystem.PostEventRequest fails, an exception is thrown.
     * 
     */
    public IEnumerator ActivityEnd(string activityID, string endState)
    {
        UniversalDataSystem.UDSEvent activityEndEvent = new UniversalDataSystem.UDSEvent();

        activityEndEvent.Create("activityEnd");

        activityEndEvent.Properties.Set("activityId", activityID);
        activityEndEvent.Properties.Set("outcome", endState);

        // This delay is to work around a PSN server bug.
        // For more information, read the technote linked at the top of this file.
        yield return new WaitForSeconds(1.2f);

        AsyncRequest<UniversalDataSystem.PostEventRequest> runningOp = PostCustomUDSEvent(activityEndEvent);

        yield return new WaitUntil(() => runningOp.IsSequenceCompleted);

        if (!NpManager.CheckAsyncRequestOK(runningOp))
        {
            throw new System.Exception("Error ending Activity with ID " + activityID);
        }
    }

    /**
     * PostCustomUDSEvent() is a function that takes a UDSEvent class and returns an AsyncRequest operation.
     * A UniversalDataSystem.PostEventRequest class is created with the UDSEvent class data, and the user ID of the 
     * active user on the PS5.
     * 
     * After that, an AsyncRequest class is created and scheduled with the UniversalDataSystem.PostEventRequest data.
     */
    AsyncRequest<UniversalDataSystem.PostEventRequest> PostCustomUDSEvent(UniversalDataSystem.UDSEvent eventToPost)
    {
        UniversalDataSystem.PostEventRequest postEvent = new UniversalDataSystem.PostEventRequest
        {
            UserId = GamePad.activeGamePad.m_loggedInUser.userId,
            EventData = eventToPost
        };

        var asyncOp = new AsyncRequest<UniversalDataSystem.PostEventRequest>(postEvent);

        UniversalDataSystem.Schedule(asyncOp);
        return asyncOp;
    }

    /**
     * OnGameIntentNotification() is a callback function which handles the GameIntentSystem.OnGameIntentNotification.
     * This notification is triggered when a user presses 'Start Activity' or 'Resume Activity' from the PS5 system software.
     * 
     * This function gets the activity ID from the notification, and then acts based on the activity that was interacted with.
     * 
     * If it is the activity "progress-complete-levels", the menu screen is opened.
     * If it is the activity "open-secret-level", the 'secret level' is opened.
     */
    public void OnGameIntentNotification(GameIntentSystem.GameIntent gameIntent)
    {
        // IntentTypes can be 'LaunchActivity', 'JoinSession', or 'LaunchMultiplayerActivity'
        // Only LaunchActivity is displayed in this sample.
        GameIntentSystem.GameIntent.IntentTypes gameIntentType = gameIntent.IntentType;

        if (gameIntentType == GameIntentSystem.GameIntent.IntentTypes.LaunchActivity)
        {
            GameIntentSystem.LaunchActivity activity = gameIntent as GameIntentSystem.LaunchActivity;
            string activityID = activity.ActivityId;

            if (activityID == "progress-complete-levels")
            {
                Debug.Log("Going to the main menu so you can progress through more levels.");

                intentToResolve = true;
                sceneToLoad = "MainScene";
            }
            else if (activityID == "open-secret-level")
            {
                Debug.Log("Opening the secret level!");

                intentToResolve = true;
                sceneToLoad = "SecretLevel";
            }
            else if (activityID == "play-first-level")
            {
                Debug.Log("Opening the first level!");

                intentToResolve = true;
                sceneToLoad = "Level1";
            }
            else
            {
                Debug.LogError("I have no configuration for this Activity.");
            }
        }
        else
        {
            Debug.LogError("I don't have configuration for this Activity type.");
        }

    }
#endif
}

