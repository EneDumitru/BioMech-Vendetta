
using UnityEngine;
using System;
using System.Collections;

#if UNITY_PS5
using UnityEngine.PS5;
using PlatformInput = UnityEngine.PS5.PS5Input;
#endif

/*
 * This GamePad class is adapted from the PSN package sample to register the state of each gamepad connected to the PS5.
 * 
 * For the full sample script, download to the PSN package sample project from the Package Manager window.
 */

public class GamePad : MonoBehaviour
{
    public static GamePad activeGamePad = null;
    public int playerId = -1;
    private bool hasSetupGamepad = false;

    public bool IsConnected
    {
#if UNITY_PS5
        get { return PlatformInput.PadIsConnected(playerId); }
#else
        get { return false; }
#endif
    }

#if UNITY_PS4 || UNITY_PS5
    public PlatformInput.LoggedInUser m_loggedInUser;
#endif

    void Update()
    {

#if UNITY_PS5
        if (PlatformInput.PadIsConnected(playerId))
        {
            if (!hasSetupGamepad)
            {
                m_loggedInUser = PlatformInput.RefreshUsersDetails(playerId);
                hasSetupGamepad = true;
            }

            if (activeGamePad == null)
            {
                activeGamePad = this;
            }
        }
        else if (hasSetupGamepad)
        {
            hasSetupGamepad = false;
        }
#endif
    }
}


