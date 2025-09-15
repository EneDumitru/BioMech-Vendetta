using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using Michsky.LSS;
using UnityEngine.SceneManagement;
using TMPro;
using HalvaStudio.Save;

public class PausePanel : Panel
{
    [Header("Buttons")]
    public Button continueBtn;
    public Button restartBtn;
    public Button settingsBtn;
    public Button goToMenuBtn;
    private bool isLoading;
    [SerializeField] private TMP_Text totalMoney;
    private void Start()
    {
        continueBtn.onClick.AddListener(Continue);
        restartBtn.onClick.AddListener(Restart);
        settingsBtn.onClick.AddListener(Settings);
        goToMenuBtn.onClick.AddListener(GoToMenu);
        totalMoney.text = SaveManager.Instance.saveData.money.ToString();
    }

    private void OnEnable()
    {
        Time.timeScale = 0f;
        InputManager.Instance.playerInput.SwitchCurrentActionMap("UI");
    }



    private void Continue()
    {
        if (isLoading) return;

        PanelManager.OnPause?.Invoke();
    }

    private void Restart()
    {
        if (isLoading) return;

        Time.timeScale = 1f;
        LoadingScreen.LoadScene(SceneManager.GetActiveScene().name);
        isLoading = true;
    }

    private void Settings()
    {
        if (isLoading) return;

        PanelManager.OnGoToPanel?.Invoke(PanelName.Settings.ToString());
    }

    private void GoToMenu()
    {
        if (isLoading) return;

        Time.timeScale = 1f;
        LoadingScreen.LoadScene("Menu_Scene");
        isLoading = true;
    }
}
