using UnityEngine;
using System.Collections;
using System;
using System.Collections.Generic;

#if UNITY_PS4
using UnityEngine.PS4;
#endif

public class PS4TrophyManager : Singleton<PS4TrophyManager>
{
#if UNITY_PS4
    bool m_NpReady = false; // Is the NP plugin initialised and ready for use.

    //The active current user logged
    public PS4Input.LoggedInUser loggedInUser;
    public Sony.NP.InitResult initResult;

    // NPToolkit2 and Trophy initialization
    void Start()
    {
        //For this example we use Aync Handling of the NPToolkit2 operations
        Sony.NP.Main.OnAsyncEvent += Main_OnAsyncEvent;
        Sony.NP.InitToolkit init = new Sony.NP.InitToolkit();
        init.contentRestrictions.DefaultAgeRestriction = 0;

        Sony.NP.AgeRestriction[] ageRestrictions = new Sony.NP.AgeRestriction[0];

        init.contentRestrictions.AgeRestrictions = ageRestrictions;


        ////You can add several age restrictions by region
        //Sony.NP.AgeRestriction[] ageRestrictions = new Sony.NP.AgeRestriction[1];
        //ageRestrictions[0] = new Sony.NP.AgeRestriction(10, new Sony.NP.Core.CountryCode("us"));
        //init.contentRestrictions.AgeRestrictions = ageRestrictions;

        //// you can set affinity to other cores this way: Sony.NP.Affinity.Core2 | Sony.NP.Affinity.Core4;
        //init.threadSettings.affinity = Sony.NP.Affinity.AllCores;

        init.SetPushNotificationsFlags(Sony.NP.PushNotificationsFlags.None);

        init.threadSettings.affinity = Sony.NP.Affinity.AllCores; // Sony.NP.Affinity.Core2 | Sony.NP.Affinity.Core4;

        // Mempools
        init.memoryPools.JsonPoolSize = 6 * 1024 * 1024;
        init.memoryPools.SslPoolSize *= 4;

        init.memoryPools.MatchingSslPoolSize *= 4;
        init.memoryPools.MatchingPoolSize *= 4;

        //init.SetPushNotificationsFlags(Sony.NP.PushNotificationsFlags.NewInGameMessage |
        //                                Sony.NP.PushNotificationsFlags.NewInvitation | Sony.NP.PushNotificationsFlags.UpdateBlockedUsersList |
        //                                Sony.NP.PushNotificationsFlags.UpdateFriendPresence | Sony.NP.PushNotificationsFlags.UpdateFriendsList);

        //For this example we use the first user
        loggedInUser = PS4Input.RefreshUsersDetails(0);

        try
        {
            initResult = Sony.NP.Main.Initialize(init);
            RegisterTrophyPack();

            if (initResult.Initialized == true)
            {
                OnScreenLog.Add("NpToolkit Initialized ");
                OnScreenLog.Add("Plugin SDK Version : " + initResult.SceSDKVersion.ToString());
                OnScreenLog.Add("Plugin DLL Version : " + initResult.DllVersion.ToString());
            }
            else
            {
                OnScreenLog.Add("NpToolkit not initialized ");
            }
        }
        catch (Sony.NP.NpToolkitException e)
        {
            OnScreenLog.AddError("Exception During Initialization : " + e.ExtendedMessage);
        }
#if UNITY_EDITOR
        catch (DllNotFoundException e)
        {
            OnScreenLog.AddError("Missing DLL Expection : " + e.Message);
            OnScreenLog.AddError("The sample APP will not run in the editor.");
        }
#endif

        string[] args = System.Environment.GetCommandLineArgs();

        if (args.Length > 0)
        {
            OnScreenLog.Add("Args:");

            for (int i = 0; i < args.Length; i++)
            {
                OnScreenLog.Add("  " + args[i]);
            }
        }
        else
        {
            OnScreenLog.Add("No Args");
        }


        //try
        //{
        //    //Initialize the NPToolkit2
        //    Sony.NP.Main.Initialize(init);
        //    //Register the Trophy Pack

        //    RegisterTrophyPack();
        //}
        //catch (Sony.NP.NpToolkitException e)
        //{
        //    Debug.Log("Error initializing the NPToolkit2 : " + e.ExtendedMessage);
        //}
    }
    private void Update()
    {
        //Sony.NP.Main.Update();
    }
    public void RegisterTrophyPack()
    {
        try
        {
            Sony.NP.Trophies.RegisterTrophyPackRequest request = new Sony.NP.Trophies.RegisterTrophyPackRequest();

            request.UserId = loggedInUser.userId;

            Sony.NP.Core.EmptyResponse response = new Sony.NP.Core.EmptyResponse();

            // Make the async call which returns the Request Id 
            int requestId = Sony.NP.Trophies.RegisterTrophyPack(request, response);
            Debug.Log("RegisterTrophyPack Async : Request Id = " + requestId);
        }
        catch (Sony.NP.NpToolkitException e)
        {
            Debug.Log("Exception : " + e.ExtendedMessage);
        }
    }



    // NOTE : This is called on the "Sony NP" thread and is independent of the Behaviour update.
    // This thread is created by the SonyNP.dll when NpToolkit2 is initialised.
    private void Main_OnAsyncEvent(Sony.NP.NpCallbackEvent callbackEvent)
    {
        //Print some useful info on the current event: 
        Debug.Log("Event: Service = (" + callbackEvent.Service + ") : API Called = (" + callbackEvent.ApiCalled + ") : Request Id = (" + callbackEvent.NpRequestId + ") : Calling User Id = (" + callbackEvent.UserId + ")");
        HandleAsyncEvent(callbackEvent);
    }

    //Here we manage the response of the previous request
    private void HandleAsyncEvent(Sony.NP.NpCallbackEvent callbackEvent)
    {
        try
        {
            if (callbackEvent.Response != null)
            {
                //We got an error response 
                if (callbackEvent.Response.ReturnCodeValue < 0)
                {
                    Debug.LogError("Response : " + callbackEvent.Response.ConvertReturnCodeToString(callbackEvent.ApiCalled));
                }
                else
                {
                    //The callback of the event is a trophyUnlock event
                    if (callbackEvent.ApiCalled == Sony.NP.FunctionTypes.TrophyUnlock)
                    {
                        Debug.Log("Trophy Unlock : " + callbackEvent.Response.ConvertReturnCodeToString(callbackEvent.ApiCalled));
                    }
                }
            }
        }
        catch (Sony.NP.NpToolkitException e)
        {
            Debug.Log("Main_OnAsyncEvent Exception = " + e.ExtendedMessage);
        }
    }

#endif


    public void UnlockTrophy(int nextTrophyId)
    {
#if UNITY_PS4
        if (SaveManager.Instance.saveData.t_trophyData.ContainsKey(nextTrophyId) && SaveManager.Instance.saveData.t_trophyData[nextTrophyId]) return;

        try
        {
            Sony.NP.Trophies.UnlockTrophyRequest request = new Sony.NP.Trophies.UnlockTrophyRequest();
            request.TrophyId = nextTrophyId;

            request.UserId = loggedInUser.userId;

            Sony.NP.Core.EmptyResponse response = new Sony.NP.Core.EmptyResponse();

            // Make the async call which returns the Request Id 
            int requestId = Sony.NP.Trophies.UnlockTrophy(request, response);
            Debug.Log("GetUnlockedTrophies Async : Request Id = " + requestId);
            SaveManager.Instance.saveData.t_trophyData.Add(nextTrophyId, true);
        }
        catch (Sony.NP.NpToolkitException e)
        {
            Debug.Log("Exception : " + e.ExtendedMessage);
        }
#endif
    }

}
