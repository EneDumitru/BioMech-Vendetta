using UnityEngine;
using System;

#if UNITY_PS5 
using Unity.PSN.PS5;

#endif
public class MyNPToolkitCustomWrapper : Singleton<MyNPToolkitCustomWrapper>
{
#if UNITY_PS5

    //PS5TrophyManager m_Trophies;
    //PS5UDSManager m_Uds;
    //SonyNpUDS m_UDS;
    bool initialized = false;
    public bool isInitialized => initialized;

    // I like to sue the full namespaces to I know what code
    // really belongs to the PSN namespace. But that's personal preference
    private Unity.PSN.PS5.Initialization.InitResult m_InitResult;

    protected override void Awake()
    {
        base.Awake();
        DontDestroyOnLoad(gameObject);

        Debug.LogError("Initialize Trophies");
        PS5TrophyManager.CreateInstance();
        PS5UDSManager.CreateInstance();
    }

    private void Start()
    {
        Initialize();
    }


    public void Initialize()
    {
        initialized = false;
        InitializeNPToolkit((x) =>
        {
            if (x)
            {
                PS5UDSManager.Instance.StartUDS((y) =>
                {
                    if (y)
                    {
                        PS5TrophyManager.Instance.InitializeTrophySystem((z) =>
                        {
                            if (z)
                            {
                                initialized = z;
                                PS5LogHelper.LogTaggedMessage("UDS, NPToolkit and Trophy System is initialized");
                            }
                            else
                            {
                                PS5LogHelper.LogTaggedMessage("Trophy System failed to initialize");
                            }
                        });
                    }
                    else
                    {
                        PS5LogHelper.LogTaggedMessage("UDS and Trophy System failed to initialize");
                    }
                });
            }
            else
            {
                PS5LogHelper.LogTaggedMessage("UDS, NPToolkit and Trophy System failed to initialize");
            }
        });
}

private void InitializeNPToolkit(Action<bool> callback)
    {

        try
        {
            m_InitResult = Unity.PSN.PS5.Main.Initialize();
            if (m_InitResult.Initialized)
            {
                initialized = true;
                Debug.Log("PSN Initialized ");
                Debug.Log("Plugin SDK Version : " + m_InitResult.SceSDKVersion.ToString());
                callback.Invoke(true);
            }
            else
            {
                callback.Invoke(false);
                Debug.Log("PSN not initialized ");
            }
        }
        catch (Unity.PSN.PS5.PSNException e)
        {
            Debug.LogError("Exception During Initialization : " + e.ExtendedMessage);
            callback.Invoke(false);
        }
#if UNITY_EDITOR
        catch (System.DllNotFoundException e)
        {
            Debug.LogError("Missing DLL Expection : " + e.Message);
            Debug.LogError("NP Toolkit will not run in the editor.");
            callback.Invoke(false);
        }
#endif

        // Initialise the User and GamePad classes to get the PS5's active user
        GamePad[] gamePads = GetComponents<GamePad>();
        User.Initialize(gamePads);


    }

    private int test = 0;
    private void Update()
    {

        /*if (GamePad.activeGamePad != null && GamePad.activeGamePad.IsDpadRightPressed)
        {
            Debug.LogError("Unlock First Trophy");
            test++;
            PS5TrophyManager.Instance.UnlockProgressTrophy(1,test);
        }*/
        try
        {
            Main.Update();
        }
        catch (Exception e)
        {
            Debug.LogErrorFormat("Failed to update main, Error: {0}", e);
        }

        try
        {
            PS5TrophyManager.Instance.Update();
        }
        catch (Exception e)
        {
            Debug.LogErrorFormat("Failed to update Trophy Manager, Error: {0}", e);
        }

}
#endif

}