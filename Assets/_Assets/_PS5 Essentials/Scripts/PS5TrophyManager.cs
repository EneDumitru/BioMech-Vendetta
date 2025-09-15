using System;
using System.Collections.Generic;
using UnityEngine;

#if UNITY_PS5
using PSNSample;
using Unity.PSN.PS5.Aysnc;
using Unity.PSN.PS5.UDS;
using Unity.PSN.PS5.Trophies;
using Unity.PSN.PS5.Users;
using PS5Input = UnityEngine.PS5.PS5Input;
using UnityEngine.PS5;
#endif

public enum TrophyID
{

    BLESSED_BE_THY_NAME = 0,
    HOLY_MASSACRE = 1,
    SISTER_ACT = 2,
    TEST_OF_FAITH = 3,
    SACRED_BOOMSTICKS = 4,
    BLESSED_BULLETS = 5,
    DIVINE_AID = 6,
    EXORCISM_CRUSADE = 7,
    IMMACULATE_VICTORY = 8,
    CHOIR_OF_ANGELS = 9,
    TRIAL_BY_FIRE = 10,
    NUN_WITH_A_GUN = 11,
    ARSENAL_OF_THE_FAITHFUL = 12,
    HEAVENLY_HEALING = 13,
    PURGE_OF_THE_DAMNED = 14,
    HOLY_SISTERHOOD = 15,
    MARTYRS_ENDURANCE = 16,
    INFERNAL_DETONATOR = 17,
    ARMORY_OF_LIGHT = 18,
    DIVINE_RESTORATION = 19,
    FAITHFUL_SCANNER = 20,
    SANCTUARY_SWEEPER = 21
}

public enum TrophyEvents
{
    OnMonsterKilled,
    OnCharacterUnlocked,
    OnDamageTaken,
    OnBarrelExplode,
    OnAmmoPicked,
    OnHealthPicked,
    OnLevelCompleted,
    OnScannerUsed
}

public enum TrophyParams
{
    MonstersKilled,
    CharactersUnlocked,
    DamageTaken,
    BarrelsExploded,
    AmmoPicked,
    HealthPicked,
    LevelsCompleted,
    ScannerUsed
}

public class PS5TrophyManager
{
    
    static PS5TrophyManager()
    {
#if UNITY_PS5

        PS5LogHelper.LogTaggedMessage("Trophy managare static constructor is called!");
        eventQueue = new Queue<ServiceEventBuffer>();
        
        //PS5Input.OnUserServiceEvent += OnUserServiceEvent;
#endif

    }

    //static void OnUserServiceEvent(PS5Input.UserServiceEventType eventtype, uint userid)
    //{
    //    PS5LogHelper.LogTaggedMessage($"Service event added! type: {eventtype.ToString()}, userid: {userid.ToString()} ");
    //    eventQueue.Enqueue(new ServiceEventBuffer() { eventType = eventtype, userId = (int)userid });
    //}

    public static void CreateInstance()
    {
        PS5LogHelper.LogTaggedMessage("Trophy manager instance is created!");
        
        new PS5TrophyManager();
    }

    private static object _objectLock = new object();
    private object _variableLock = new object();
    
    public PS5TrophyManager()
    {
        lock(_objectLock)
        {
            if (m_instance != null) return;
            PS5LogHelper.LogTaggedMessage("Trophy manager instance is set!");
            m_instance = this;
        }        
    }

    private static PS5TrophyManager m_instance;
    public static PS5TrophyManager Instance
    {
        get
        {
            lock (_objectLock)
            {
                if (m_instance == null)
                {
                    m_instance = new PS5TrophyManager();
                }
                return m_instance;
            }
        }
    }


#if UNITY_PS5
    struct ServiceEventBuffer
    {
        public PS5Input.UserServiceEventType eventType;
        public int userId;
    }
    static private Queue<ServiceEventBuffer> eventQueue;

    public int userId { get; private set; }
    PS5Input.LoggedInUser loggedInUser;

    bool initialized = false;
    public bool hasSetupUser = false;
    bool pendingChange = false;

    public bool IsInitialized => TrophySystem.IsInitialized;

    int numTrophiesReturned = 0;
    TrophySystem.TrophyDetails[] currentDetails;
    TrophySystem.TrophyData[] currentData;
    private int trophyCount
    {
        get { return System.Enum.GetValues(typeof(TrophyID)).Length; }
    }
#endif


    //private void ProcessServiceEvent(ServiceEventBuffer serviceEvent) {
    //    this.userId = serviceEvent.userId;
    //    PS5LogHelper.LogTaggedMessage($"User service event, type: {serviceEvent.eventType.ToString()}, user id: {serviceEvent.userId.ToString()} ");
    //    switch (serviceEvent.eventType)
    //    {
    //        case PS5Input.UserServiceEventType.Login:
    //            {
    //                PS5LogHelper.LogTaggedMessage("Tried to initialize user via user service event");
    //                InitializeUser(null, serviceEvent.userId);
    //                break;
    //            }
    //        default:
    //            {
    //                PS5LogHelper.LogTaggedMessage("Tried to logout user via user service event");
    //                LogoutUser(serviceEvent.userId);
    //                break;
    //            }
    //    }
    //}

    public void Update()
    {
#if UNITY_PS5

        if (!initialized) return;
        if (!hasSetupUser) return;

        //while (eventQueue.Count > 0)
        //{
        //    ProcessServiceEvent(eventQueue.Dequeue());
        //}

        if (PS5Input.PadIsConnected(0))
        {
            lock (_variableLock)
            {
                loggedInUser = PS5Input.RefreshUsersDetails(0);
                CheckUserAndTrophies();
            }
        }
#endif
    }

    public bool trophiesSet;
    public void CheckUserAndTrophies()
    {
#if UNITY_PS5

        if (loggedInUser.userId == 0 || trophiesSet) return;

        Debug.LogError("CheckUserAndTrophies");
        Debug.LogError("loggedInUser.userId: " + loggedInUser.userId);

        SetTrophyInfo();
        trophiesSet = true;
#endif

    }

    public void SetTrophyInfo()
    {
#if UNITY_PS5

        Debug.LogError("Try SetTrophyInfo!");

        currentDetails = new TrophySystem.TrophyDetails[trophyCount];
        currentData = new TrophySystem.TrophyData[trophyCount];
        for (int i = 0; i < trophyCount; i++)
        {
            GetTrophyInfo(i);
        }
#endif

    }

    private void GetTrophyInfo(int trophyId)
    {
#if UNITY_PS5

        Debug.LogError("Getting info for trophy " + trophyId);

        TrophySystem.GetTrophyInfoRequest request = new TrophySystem.GetTrophyInfoRequest();

        request.UserId = loggedInUser.userId;
        request.TrophyId = trophyId;
        request.TrophyDetails = new TrophySystem.TrophyDetails();
        request.TrophyData = new TrophySystem.TrophyData();

        Debug.LogError("User ID: " + request.UserId);
        Debug.LogError("TrophyId: " + request.TrophyId);

        var getTrophyOp = new AsyncRequest<TrophySystem.GetTrophyInfoRequest>(request).ContinueWith((antecedent) =>
        {
            if (NpManager.CheckAsyncRequestOK(antecedent))
            {
                OutputTrophyDetails(antecedent.Request.TrophyDetails);
                OutputTrophyData(antecedent.Request.TrophyData);

                int id = antecedent.Request.TrophyId;

                if (currentDetails[id] == null)
                {
                    numTrophiesReturned++;
                }

                currentDetails[id] = antecedent.Request.TrophyDetails;
                currentData[id] = antecedent.Request.TrophyData;
            }
        });

        UniversalDataSystem.Schedule(getTrophyOp);
#endif

    }

#if UNITY_PS5

    private void OutputTrophyDetails(TrophySystem.TrophyDetails trophyDetails)
    {


        OnScreenLog.Add("TrophyDetails");

        Debug.Log("   TrophyId : " + trophyDetails.TrophyId);
        Debug.Log("   TrophyGrade : " + trophyDetails.TrophyGrade);
        Debug.Log("   GroupId : " + trophyDetails.GroupId);
        Debug.Log("   Hidden : " + trophyDetails.Hidden);
        Debug.Log("   HasReward : " + trophyDetails.HasReward);
        Debug.Log("   Title : " + trophyDetails.Title);
        Debug.Log("   Description : " + trophyDetails.Description);
        Debug.Log("   Reward : " + trophyDetails.Reward);
        Debug.Log("   IsProgress : " + trophyDetails.IsProgress);

        if (trophyDetails.IsProgress)
        {
            Debug.Log("   TargetValue : " + trophyDetails.TargetValue);
        }


}

public bool TrophyAndUserInitialized()
    {
        return hasSetupUser && initialized;

    }

    private void OutputTrophyData(TrophySystem.TrophyData trophyData)
    {
        Debug.Log("TrophyData");

        Debug.Log("   TrophyId : " + trophyData.TrophyId);
        Debug.Log("   Unlocked : " + trophyData.Unlocked);
        Debug.Log("   TimeStamp : " + trophyData.TimeStamp);
        Debug.Log("   IsProgress : " + trophyData.IsProgress);

        if (trophyData.IsProgress)
        {
            Debug.Log("   ProgressValue : " + trophyData.ProgressValue);
        }

    }
#endif


    /// <summary>
    /// Unlock a Trophy
    /// </summary>
    /// <param name="trophyID">ID of the trophy to unlock</param>
    public void UnlockTrophy(TrophyID trophy)
    {
#if UNITY_EDITOR
        return;
#endif

#if UNITY_PS5

        int trophyID = (int) trophy;

        PS5LogHelper.LogTaggedMessage($"Trying to unlock trophy, user setup: {hasSetupUser}, initialize: {initialized}, trophy id: {trophyID}, user id: {userId}");

        if (!hasSetupUser) return;
        if (!initialized) return;

        //Safety check for no UDS
        if (PS5UDSManager.Instance.UDSInitalised == false)
        {
            PS5LogHelper.LogTaggedMessage("Tried to unlock a trophy without UDS initalisation");
            Debug.LogError("Tried to unlock a trophy without UDS initalisation");
            return;
        }

        //Build a request with the UDS to unlock a trophy
        UniversalDataSystem.UnlockTrophyRequest request = new UniversalDataSystem.UnlockTrophyRequest();
        request.TrophyId = trophyID;
        request.UserId = loggedInUser.userId;
        PS5LogHelper.LogTaggedMessage($"Trying to unlock trophy, Actual user id: {loggedInUser.userId}");

        //'Send' the request to unlock the trophy
        var getTrophyOp = new AsyncRequest<UniversalDataSystem.UnlockTrophyRequest>(request).ContinueWith((antecedent) =>
        {
            Debug.Log($"Trohpy unlock request finished!");
            PS5LogHelper.LogTaggedMessage($"Trohpy unlock request finished!");
            //request completed, check if it was okay
            if (NpManager.CheckAsyncRequestOK(antecedent))
            {
                Debug.Log($"Trophy {trophyID} unlocked!");
                PS5LogHelper.LogTaggedMessage($"Trophy {trophyID} unlocked!");          
            }
            else
        {
            Debug.LogError($"Trophy unlock Failed {antecedent.Request.Result.ErrorMessage()}");
                PS5LogHelper.LogTaggedMessage($"Trophy unlock Failed {antecedent.Request.Result.ErrorMessage()}");
            }
        });

        UniversalDataSystem.Schedule(getTrophyOp);
#endif

    }

    public void IncreaseProgressStat(TrophyEvents trophyEvent, TrophyParams trophyParam, TrophyID trophyID, int value = 1)
    {

#if UNITY_EDITOR
        return;
#endif

#if UNITY_PS5

        Debug.LogError("Increase progress stat!");
        string eventName = trophyEvent.ToString();
        string eventParam = trophyParam.ToString();
        int id = (int)trophyID;


        Debug.LogError("Increase TrophyID" + id + " " + loggedInUser.userId);

        if (currentData[id] != null && currentData[id].IsProgress == true)
        {
            long currentProgress = currentData[id].ProgressValue;

            currentProgress += value;
            Debug.LogError("Current Progress " + currentProgress);
            UniversalDataSystem.UDSEvent myEvent = new UniversalDataSystem.UDSEvent();

            myEvent.Create(eventName);
            myEvent.Properties.Set(eventParam, (int)currentProgress);

            UniversalDataSystem.PostEventRequest request = new UniversalDataSystem.PostEventRequest();

            request.UserId = loggedInUser.userId;
            request.CalculateEstimatedSize = false;
            request.EventData = myEvent;

            var requestOp = new AsyncRequest<UniversalDataSystem.PostEventRequest>(request).ContinueWith((antecedent) =>
            {
                if (NpManager.CheckAsyncRequestOK(antecedent))
                {
                    Debug.Log("UpdateKillCount Event sent");
                    GetTrophyInfo(id);
                }
                else
                {
                    Debug.LogError("Event send error");
                }
            });

            UniversalDataSystem.Schedule(requestOp);
        }

#endif

    }

    public void UpdateProgressStat(TrophyEvents trophyEvent, TrophyParams eventParam, TrophyID trophyID, int amount)
    {
#if UNITY_EDITOR
        return;

#endif

#if UNITY_PS5

        Debug.LogError("Update progress stat!");

        string eventName = trophyEvent.ToString();
        string param = eventParam.ToString();
        int id = (int)trophyID;


        if (currentData[id] != null && currentData[id].IsProgress == true)
        {
            long currentProgress = currentData[id].ProgressValue;

            currentProgress = amount;
            Debug.LogError("Current Progress " + currentProgress);
            UniversalDataSystem.UDSEvent myEvent = new UniversalDataSystem.UDSEvent();

            myEvent.Create(eventName);
            myEvent.Properties.Set(param, (int)currentProgress);

            UniversalDataSystem.PostEventRequest request = new UniversalDataSystem.PostEventRequest();

            request.UserId = loggedInUser.userId;
            request.CalculateEstimatedSize = false;
            request.EventData = myEvent;

            var requestOp = new AsyncRequest<UniversalDataSystem.PostEventRequest>(request).ContinueWith((antecedent) =>
            {
                if (NpManager.CheckAsyncRequestOK(antecedent))
                {
                    Debug.Log("UpdateKillCount Event sent");
                    GetTrophyInfo(id);
                }
                else
                {
                    Debug.LogError("Event send error");
                }
            });

            UniversalDataSystem.Schedule(requestOp);
        }
#endif

    }

    public void ResetProgressStat(string statID, string param, int id)
    {
#if UNITY_PS5

        Debug.LogError("Reset TrophyID" + id + " " + loggedInUser.userId);

        if (currentData[id] != null && currentData[id].IsProgress == true)
        {
            long currentProgress = currentData[id].ProgressValue;

            currentProgress = 0;
            Debug.LogError("Current Progress " + currentProgress);
            UniversalDataSystem.UDSEvent myEvent = new UniversalDataSystem.UDSEvent();

            myEvent.Create(statID);
            myEvent.Properties.Set(param, (int)currentProgress);

            UniversalDataSystem.PostEventRequest request = new UniversalDataSystem.PostEventRequest();

            request.UserId = loggedInUser.userId;
            request.CalculateEstimatedSize = false;
            request.EventData = myEvent;

            var requestOp = new AsyncRequest<UniversalDataSystem.PostEventRequest>(request).ContinueWith((antecedent) =>
            {
                if (NpManager.CheckAsyncRequestOK(antecedent))
                {
                    Debug.Log("UpdateKillCount Event sent");
                    GetTrophyInfo(id);
                }
                else
                {
                    Debug.LogError("Event send error");
                }
            });

            UniversalDataSystem.Schedule(requestOp);
        }
#endif

    }


    public void UnlockProgressTrophy(int id, long value)
    {
#if UNITY_PS5

        PS5LogHelper.LogTaggedMessage($"Trying to unlock trophy, user setup: {hasSetupUser}, initialize: {initialized}, trophy id: {id}, user id: {userId}");
        
        if (PS5UDSManager.Instance.UDSInitalised == false)
        {
            PS5LogHelper.LogTaggedMessage("Tried to unlock a trophy without UDS initalisation");
            Debug.LogError("Tried to unlock a trophy without UDS initalisation");
            return;
        }

        Debug.LogError("Tried to create a request: " + id + " val: " + value);

        UniversalDataSystem.UpdateTrophyProgressRequest request = new UniversalDataSystem.UpdateTrophyProgressRequest();


        request.TrophyId = id;
        request.UserId = loggedInUser.userId;
        request.Progress = value;

        PS5LogHelper.LogTaggedMessage($"Trying to unlock trophy, Actual user id: {loggedInUser.userId}");
        
        var getTrophyOp = new AsyncRequest<UniversalDataSystem.UpdateTrophyProgressRequest>(request).ContinueWith((antecedent) =>
        {
            if (NpManager.CheckAsyncRequestOK(antecedent))
            {
                PS5LogHelper.LogTaggedMessage("Progress Trophy Update Request finished = " + antecedent.Request.TrophyId + " : Progress = " + antecedent.Request.Progress);
                GetTrophyInfo(id);
            }
        });

        UniversalDataSystem.Schedule(getTrophyOp);

        PS5LogHelper.LogTaggedMessage("Progress Trophy Updating");
#endif

    }


    public void InitializeTrophySystem(Action<bool> callback)
    {

#if UNITY_PS5
        TrophySystem.StartSystemRequest request = new TrophySystem.StartSystemRequest();

        var requestOp = new AsyncRequest<TrophySystem.StartSystemRequest>(request).ContinueWith((antecedent) =>
        {
            if (NpManager.CheckAsyncRequestOK(antecedent))
            {
                OnScreenLog.Add("System Started");
                PS5LogHelper.LogTaggedMessage("Trophy System initialized");

                initialized = true;
                callback.Invoke(true);
            } else
            {
                callback.Invoke(false);
            }
        });

        TrophySystem.Schedule(requestOp);
#endif

    }


    private void LogoutUser(int userid = -1)
    {
#if UNITY_PS5

        if (pendingChange) return;

        if (userid == -1)
        {
            userid = this.userId;
        }

        PS5LogHelper.LogTaggedMessage($"Trying to logout user {userid}");

        pendingChange = true;
        UserSystem.RemoveUserRequest request = new UserSystem.RemoveUserRequest() { UserId = userid };

        var requestOp = new AsyncRequest<UserSystem.RemoveUserRequest>(request).ContinueWith((antecedent) =>
        {
            if (antecedent != null && antecedent.Request != null)
            {
                if (NpManager.CheckAsyncRequestOK(antecedent))
                {
                    OnScreenLog.Add("User Removed");
                    PS5LogHelper.LogTaggedMessage("User removed");

                    hasSetupUser = false;
                }
            }
            pendingChange = false;
        });

        UserSystem.Schedule(requestOp);
#endif

    }

}