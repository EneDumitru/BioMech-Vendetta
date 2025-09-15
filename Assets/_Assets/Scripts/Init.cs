using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using _Assets._PlatformSpeciffics.Switch;
using Michsky.LSS;
using System;

public class Init : MonoBehaviour
{
    private void Awake()
    {
        Debug.Log("INIT SCENE AWAKE!");
#if UNITY_SWITCH
        NintendoSave.Initialize();
#endif
    }

    private void Start()
    {
        //LoadingScreen.LoadScene("Menu_Scene");
        UnityEngine.SceneManagement.SceneManager.LoadScene(1);
    }
}
