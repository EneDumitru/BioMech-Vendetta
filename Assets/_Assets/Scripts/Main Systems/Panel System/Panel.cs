using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum PanelType
{
    Panel, PopUp, StayActive
}

public enum PanelName
{
    Start, LocationSelect, LevelSelect, Settings, Shop, Task, GameOver, HUD,
    Pause, About, Customize, Weapons, PlayerSelect, CharacterSelect, Controls, Skills,
    LevelComplete, LevelFailed
}


public abstract class Panel : MonoBehaviour
{
    [Header("Main")]
    public PanelName panelName;
    public Button backButton;



    //private void Awake()
    //{
    //    backButton?.onClick.AddListener(() => GoBack());
    //}

    public void GoBack()
    {
        PanelManager.OnGoBack?.Invoke();
    }

    public virtual void Initialize()
    {

    }

    public virtual void UpdatePanel()
    {

    }
}
