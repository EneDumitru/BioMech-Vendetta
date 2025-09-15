using UnityEngine;
using TMPro;
using System.Collections.Generic;
using DG.Tweening;
using Michsky.LSS;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class GameOverPanel : Panel
{
    [SerializeField] Button tryagain;
    [SerializeField] Button backToMenu;
    private BaseAnimation baseAnimation;

    private void Start()
    {
        baseAnimation = GetComponent<BaseAnimation>();
        baseAnimation.PlayAnimation();

        //GameManager.Instance.SaveReward();
        tryagain.onClick.AddListener(TryAgain);
        backToMenu.onClick.AddListener(GoToMenu);
    }

    private void OnEnable()
    {
        InputManager.Instance.playerInput.SwitchCurrentActionMap("UI");
    }

    private void OnDisable()
    {
        //InputManager.Instance.playerInput1.SwitchCurrentActionMap("Controller");
    }

    private void GoToMenu()
    {
        // Implementation for going to menu
        Time.timeScale = 1f;
        LoadingScreen.LoadScene("Menu_Scene");
    }

    private void TryAgain()
    {
        // Implementation for trying again
        Time.timeScale = 1f;
        LoadingScreen.LoadScene(SceneManager.GetActiveScene().name);
    }
}
