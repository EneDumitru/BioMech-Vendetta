using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using DG.Tweening;
using Michsky.LSS;
using UnityEngine.SceneManagement;
using System;
using System.Linq;

public class LevelCompletePanel : Panel
{
    [Header("Main")]
    public Image bgFade;
    public BaseAnimation rewardAnimation;
    public BaseAnimation levelUpAnimation;
    public BaseAnimation completeAnimation;

    [SerializeField] Button backToMenu;
    [SerializeField] Button tryagain;
    private bool isLevelUp;

    public static Action OnLevelComplete;
    private void OnEnable()
    {
        ExperienceSystem.Instance.OnLevelUp += LevelUpInfo ;
        InputManager.Instance.playerInput.SwitchCurrentActionMap("UI");
    }
    private void OnDisable()
    {
        ExperienceSystem.Instance.OnLevelUp -= LevelUpInfo ;
        //InputManager.Instance.playerInput1.SwitchCurrentActionMap("Controller");
    }

    private void Awake()
    {
        bgFade.color = Vector4.zero;
        OnLevelComplete?.Invoke();
    }

    private void Start()
    {
        StartAnimation();
        tryagain.onClick.AddListener(NextLevel);
        backToMenu.onClick.AddListener(GoToMenu);
    }

    private void StartAnimation()
    {
        StopAllCoroutines();
        StartCoroutine(AnimationCoroutine());
    }

    IEnumerator AnimationCoroutine()
    {
        bgFade.DOFade(0.9f, 0.3f).OnComplete(() => rewardAnimation.PlayAnimation());
        yield return new WaitUntil(() => rewardAnimation.isFinished);
        rewardAnimation.CloseAnimation();

        if (isLevelUp)
        {
            isLevelUp = false;
            levelUpAnimation.PlayAnimation();
            yield return new WaitUntil(() => levelUpAnimation.isFinished);
            levelUpAnimation.CloseAnimation();
        }
        Debug.Log(isLevelUp);

        completeAnimation.PlayAnimation();
    }

    private void LevelUpInfo()
    {
        isLevelUp = true;
    }
    private void GoToMenu()
    {
        // Implementation for going to menu
        LoadingScreen.LoadScene("Menu_Scene");
    }

    private void TryAgain()
    {
        // Implementation for trying again
        LoadingScreen.LoadScene(SceneManager.GetActiveScene().name);
    }

    private void NextLevel()
    {
        LevelManager.Instance.NextLevel();
    }
}
