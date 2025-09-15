using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using System;
using UnityEngine.InputSystem;
using UnityEngine.SceneManagement;
using DG.Tweening;

#if UNITY_PS5
using UnityEngine.PS5;
#endif

public class PanelManager : MonoBehaviour
{
    public PanelName startPanel;
    public Button backButton;
    public Panel[] panels;
    private List<string> panelsChain = new List<string>();
    [HideInInspector] public Panel currentPanel;
    public bool isPaused;


    public static Action<string> OnGoToPanel;
    public static Action<string> OnOpenPopUp;
    public static Action<string> OnClosePopUp;
    public static Action OnGoBack;
    public static Action<string> OnGoBackIfLastPanel;
    public static Action OnPause;
    public static Action<bool> OnBlockInteraction;

    private bool blockInteraction;
    private CanvasGroup canvasGroup;

    private void OnEnable()
    {
        OnGoToPanel = null;
        OnOpenPopUp = null;
        OnGoBack = null;
        OnClosePopUp = null;
        OnGoBackIfLastPanel = null;
        OnPause = null;
        OnBlockInteraction = null;

        OnGoToPanel += GoTo;
        OnOpenPopUp += OpenPopUp;
        OnGoBack += GoBack;
        OnClosePopUp += ClosePopUp;
        OnGoBackIfLastPanel += GoBackIfLastPanel;
        OnPause += Pause;
        OnBlockInteraction = BlockInteraction;

        Time.timeScale = 1f;
    }



    private void OnDisable()
    {
        OnGoToPanel = null;
        OnOpenPopUp = null;
        OnGoBack = null;
        OnClosePopUp = null;
        OnGoBackIfLastPanel = null;
        OnPause = null;
    }

    private void Awake()
    {
        backButton?.onClick.AddListener(GoBack);
        canvasGroup = GetComponent<CanvasGroup>();

        if (canvasGroup)
        {
            canvasGroup.alpha = 0f;
            canvasGroup.DOFade(1f, 1f);
        }
        //InputManager.Instance.InputUIState(true);
        //InputManager.Instance.inputActions.UI.Cancel.performed += Cancel_performed;
        //InputManager.Instance.inputActions.UI.Pause.performed += Pause_performed;
        //InputManager.Instance.inputActions.UI.Controls.performed += Controls_performed;
        //InputManager.Instance.inputActions.UI.Controls.canceled += Controls_canceled;
    }


    private void OnDestroy()
    {
        //InputManager.Instance.InputUIState(false);
        //InputManager.Instance.inputActions.UI.Cancel.performed -= Cancel_performed;
        //InputManager.Instance.inputActions.UI.Pause.performed -= Pause_performed;
        //InputManager.Instance.inputActions.UI.Controls.performed -= Controls_performed;
        //InputManager.Instance.inputActions.UI.Controls.canceled -= Controls_canceled;
    }

    private void Start()
    {
        Initialize();
        GoTo(startPanel.ToString());

        if (SceneManager.GetActiveScene().name != "Menu_Scene")
        {
            AudioManager.Instance.PlayThemeGame();
        }
        else
        {
            AudioManager.Instance.PlayThemeMenu();
        }
    }

    private void Update()
    {
#if !UNITY_EDITOR

        if (!isPaused)
        {
        if (Utility.isInBackgroundExecution || Utility.isSystemUiOverlaid)
            {
                if (SceneManager.GetActiveScene().name != "Menu_Scene")
                {
                    if (panelsChain[panelsChain.Count - 1] == "HUD")
                    {
                        PauseState(true);
                    }
                }
            }
        }
#endif

    }
    private void BlockInteraction(bool _state)
    {
        blockInteraction = _state;
        canvasGroup.interactable = !_state;
    }

    private void OpenTaskPanel()
    {
        GoTo(PanelName.Task.ToString());
    }


    private void Initialize()
    {
        for (int i = 0; i < panels.Length; i++)
        {
            panels[i].Initialize();
        }
    }

    private void Pause()
    {
        if (blockInteraction) return;

        if (SceneManager.GetActiveScene().name != "Menu_Scene")
        {
            if (panelsChain[panelsChain.Count - 1] == "HUD")
            {
                PauseState(true);
            }
            else if (panelsChain[panelsChain.Count - 1] == "Pause")
            {
                PauseState(false);
            }
        }
    }

    private void PauseState(bool _state)
    {
        if (_state)
        {
            GoTo("Pause");
            isPaused = true;
            Time.timeScale = 0f;
            //AudioManager.Instance.ChangeVehicleVolume(0f);
        }
        else
        {
            GoBack();
            Time.timeScale = 1f;
            isPaused = false;
            //AudioManager.Instance.ChangeVehicleVolume(1f);
        }

        //controlsPanel.SetActive(false);
        //InputManager.Instance.InputForkliftState(!_state);
        //InputManager.Instance.InputVehicleState(!_state);
        //InputManager.Instance.InputCameraState(!_state);
    }

    private void Cancel_performed(InputAction.CallbackContext obj)
    {
        if (blockInteraction) return;

        if (SceneManager.GetActiveScene().name == "Menu_Scene")
        {
            GoBack();
        }
    }


    public void OpenPopUp(string _popUpName)
    {
        if (blockInteraction) return;

        for (int i = 0; i < panels.Length; i++)
        {
            if (panels[i].panelName.ToString() == _popUpName)
            {
                panels[i].gameObject.SetActive(true);
            }
        }

    }

    public void ClosePopUp(string _popUpName)
    {
        if (blockInteraction) return;

        for (int i = 0; i < panels.Length; i++)
        {
            if (panels[i].panelName.ToString() == _popUpName)
            {
                panels[i].gameObject.SetActive(false);
            }
        }

    }

    public void GoTo(string _panelName)
    {
        if (blockInteraction) return;

        if (panelsChain.Count > 0 && panelsChain[panelsChain.Count - 1] == _panelName)
            return;

        for (int i = 0; i < panels.Length; i++)
        {
            if (panels[i].panelName.ToString() == _panelName)
            {
                panels[i].gameObject.SetActive(true);
                currentPanel = panels[i];
                panelsChain.Add(currentPanel.panelName.ToString());
            }
            else
            {
                panels[i].gameObject.SetActive(false);
            }
        }

    }

    public void GoBackIfLastPanel(string _panelName)
    {
        if (blockInteraction) return;

        if (panelsChain[panelsChain.Count - 1] == _panelName)
        {
            GoBack();
        }
    }

    public void GoBack()
    {
        if (blockInteraction) return;

        if (panelsChain.Count == 1) return;

        int id = panelsChain.Count - 2;
        currentPanel.gameObject.SetActive(false);

        for (int i = 0; i < panels.Length; i++)
        {
            if (panelsChain[id] == panels[i].panelName.ToString())
            {
                currentPanel = panels[i];
                panelsChain.RemoveAt(id + 1);
                currentPanel.gameObject.SetActive(true);
                AudioManager.Instance.Play("Back");
                break;
            }
        }

    }

}