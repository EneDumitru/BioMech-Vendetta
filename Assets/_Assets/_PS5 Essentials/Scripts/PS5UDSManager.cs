using System;
using UnityEngine;

#if UNITY_PS5
using PSNSample;
using Unity.PSN.PS5.Aysnc;
using Unity.PSN.PS5.UDS;
#endif

public class PS5UDSManager
{
    public static void CreateInstance()
    {
        new PS5UDSManager();
    }

    private static object _objectLock = new object();

    public PS5UDSManager()
    {
        if (m_instance != null) return;
        m_instance = this;
    }

    private static PS5UDSManager m_instance;
    public static PS5UDSManager Instance
    {
        get
        {
            lock (_objectLock)
            {
                if (m_instance == null)
                {
                    m_instance = new PS5UDSManager();
                }
                return m_instance;
            }
        }
    }

#if UNITY_PS5

    //Is the Universal Data System enabled?
    public bool UDSInitalised => UniversalDataSystem.IsInitialized;

    /// <summary>
    /// Start the Universal Data System
    /// Is Async, use the callback to get when the request is done
    /// </summary>
    /// <param name="callback">Callback on request completion, bool: if the request was successful</param>
    private UniversalDataSystem.StartSystemRequest request;
    bool setRequest = false;

    public void SetRequest()
    {
        if (setRequest == false)
        {

            request = new UniversalDataSystem.StartSystemRequest
            {
                PoolSize = 256 * 1024
            };

            setRequest = true;
        }
    }

    public UniversalDataSystem.StartSystemRequest GetRequest()
    {
        if (setRequest == true)
        {
            return request;
        }
        else
        {
            SetRequest();
            return request;
        }
    }

    bool setop = false;
    AsyncRequest<UniversalDataSystem.StartSystemRequest> requestOp;
    public void SetOp()
    {
        if (setop == false)
        {
            StartUDS();
            setop = true;
        }
    }

    public AsyncRequest<UniversalDataSystem.StartSystemRequest> GetOp()
    {

        if (setop == false)
        {
            SetOp();
            return requestOp;
        }
        else
            return requestOp;
    }

    public void StartUDS(Action<bool> callback = null)
    {
        var requestOp = new AsyncRequest<UniversalDataSystem.StartSystemRequest>(GetRequest());

        UniversalDataSystem.Schedule(requestOp);

        setop = true;

        if (SonyNpMain.CheckAysncRequestOK(requestOp))
        {
            Debug.LogError("UDS is enabled");
            PS5LogHelper.LogTaggedMessage("UDS is enabled");
            callback?.Invoke(true);
        }
        else
        {
            Debug.LogError(request.Result.ErrorMessage());
            callback?.Invoke(false);
        }

        UniversalDataSystem.Schedule(requestOp);
    }

    public void StopUDS()
    {
        UniversalDataSystem.StopSystemRequest request = new UniversalDataSystem.StopSystemRequest();

        var requestOp = new AsyncRequest<UniversalDataSystem.StopSystemRequest>(request).ContinueWith((antecedent) =>
        {
            if (SonyNpMain.CheckAysncRequestOK(antecedent))
            {
                //System is stopped
            }
        });

        UniversalDataSystem.Schedule(requestOp);
    }
#endif


}
