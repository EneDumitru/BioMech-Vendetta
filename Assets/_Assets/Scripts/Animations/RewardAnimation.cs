using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using DG.Tweening;
using TMPro;
using HalvaStudio.Save;

public class RewardAnimation : BaseAnimation
{
    [Header("Main")]
    public Image backgroundBar;
    public RectTransform expSlot;
    public RectTransform cashSlot;
    public CanvasGroup expCG;
    public CanvasGroup cashCG;

    [Header("Exp Part")]
    public TMP_Text expTitle;
    public TMP_Text expReward;
    public TMP_Text expRemained;
    public Image expSlash;
    public Image expRing;
    public Image expFill;

    [Header("Cash Part")]
    public TMP_Text cashTitle;
    public TMP_Text cashReward;
    public TMP_Text cashTotal;
    public Image cashSlash;
    public Image cashRing;
    public Image cashFill;

    private float currentXp;
    private int remainedXP;
    private int forNextLevelXP;
    private int rewardXP;

    private int rewardMoney;
    private int totalMoney;

    private bool isLevelUp;
    private Vector2 _barInitialAnchoredPos;

    private void OnEnable()
    {
        ExperienceSystem.Instance.OnLevelUp += LevelUpInfo;
        SetValues();
    }

    private void OnDisable()
    {
        ExperienceSystem.Instance.OnLevelUp -= LevelUpInfo;
    }
    public override void StartAnimation()
    {
        StopAllCoroutines();
        StartCoroutine(AnimationCoroutine());
    }
    private void LevelUpInfo()
    {
        isLevelUp = true;
    }
    private void SetValues()
    {
        currentXp = ExperienceSystem.Instance.GetCurrentXpPercent();
        remainedXP = ExperienceSystem.Instance.remainingXPForNextLevel;
        forNextLevelXP = ExperienceSystem.Instance.GetXpForNextLevel();
        totalMoney = SaveManager.Instance.saveData.money;
        rewardXP = LevelManager.Instance.currentLevelData.rewardXp;
        rewardMoney = LevelManager.Instance.currentLevelData.rewardMoney;
    }

    IEnumerator AnimationCoroutine()
    {
        //Set initial informations
        cashTotal.text = totalMoney.ToString() +" $";
        expRemained.text = remainedXP.ToString() +"/"+ forNextLevelXP + " XP";
        cashReward.text = rewardMoney.ToString();
        expReward.text = rewardXP.ToString();
        expFill.DOFillAmount(currentXp, 0);
        GameManager.Instance.SaveReward();

        if (canvasGroup)
        {
            canvasGroup.DOFade(1f, 0.5f);
            yield return new WaitForSeconds(0.25f);
        }

        backgroundBar.transform.DOScale(Vector3.one, 0.3f)
            .SetEase(Ease.OutBack)
            .SetUpdate(true);
        backgroundBar.rectTransform.DOAnchorPos(new Vector2(0f, 150f), 0.3f).SetEase(Ease.OutExpo);

        yield return new WaitForSeconds(0.4f);
        
        expCG.DOFade(1f, 0.3f);
        cashCG.DOFade(1f, 0.3f);
        yield return new WaitForSeconds(0.4f);

        // expSlot.DOAnchorPos(new Vector2(-130f, expSlot.anchoredPosition.y), 1.5f).SetEase(Ease.OutExpo);
        // cashSlot.DOAnchorPos(new Vector2(130f, cashSlot.anchoredPosition.y), 1.5f).SetEase(Ease.OutExpo);
        yield return new WaitForSeconds(1f);


        // expTitle.rectTransform.DOAnchorPos(new Vector2(0f, 77f), 1f).SetEase(Ease.OutExpo);
        // cashTitle.rectTransform.DOAnchorPos(new Vector2(0f, 77f), 1f).SetEase(Ease.OutExpo);
        // expRemained.rectTransform.DOAnchorPos(new Vector2(0f, -102f), 1f).SetEase(Ease.OutExpo);
        // cashTotal.rectTransform.DOAnchorPos(new Vector2(0f, -102f), 1f).SetEase(Ease.OutExpo);

        expTitle.DOFade(1f, 1f);
        cashTitle.DOFade(1f, 1);
        expRemained.DOFade(1f, 1);
        cashTotal.DOFade(1f, 1);

        expRing.DOFade(0.1f, 1);
        expFill.DOFade(1f, 1);
        expSlash.DOFillAmount(1f, 1);
        
        cashFill.DOFade(1f, 1);
        cashRing.DOFade(0.1f, 1);
        cashSlash.DOFillAmount(1f, 1);

        yield return new WaitForSeconds(0.7f);

        // expReward.rectTransform.DOAnchorPos(new Vector2(-125f, 0f), 1f).SetEase(Ease.OutExpo);
        // cashReward.rectTransform.DOAnchorPos(new Vector2(-125f, 0f), 1f).SetEase(Ease.OutExpo);

        expReward.DOFade(1f, 0.6f);
        cashReward.DOFade(1f, 0.6f);

        yield return new WaitForSeconds(1f);

        // expReward.rectTransform.DOAnchorPos(new Vector2(-50f, 0f), 1.5f).SetEase(Ease.OutExpo);
        // cashReward.rectTransform.DOAnchorPos(new Vector2(-50f, 0f), 1.5f).SetEase(Ease.OutExpo);

        // expReward.DOFade(0f, 1.5f);
        // cashReward.DOFade(0f, 1.5f);

        //Get new current informations
        SetValues();

        if (isLevelUp)
        {
            isLevelUp = false;
            expFill.DOFillAmount(1, 1f);
            //expFill.DOColor(new Color32(190, 84, 25, 255), 0.2f);
            yield return new WaitForSeconds(1f);
            expFill.DOFillAmount(0, 0);
            //expFill.DOColor(Color.white, 0);
        }
        expFill.DOFillAmount(currentXp, 1f);

        expRemained.DOFade(0, 1.5f);
        cashTotal.DOFade(0, 1.5f);

        yield return new WaitForSeconds(1f);

        
        //New information
        expRemained.text = remainedXP.ToString() + "/" + forNextLevelXP + " XP";
        cashTotal.text = totalMoney.ToString() + " $";

        // expRemained.rectTransform.anchoredPosition = new Vector2(0f, -50f);
        // cashTotal.rectTransform.anchoredPosition = new Vector2(0f, -50f);

        expRemained.DOFade(1f, 1.5f);
        cashTotal.DOFade(1f, 1.5f);
        // expRemained.rectTransform.DOAnchorPos(new Vector2(0f, -102f), 1.5f).SetEase(Ease.OutExpo);
        // cashTotal.rectTransform.DOAnchorPos(new Vector2(0f, -102f), 1.5f).SetEase(Ease.OutExpo);
        
        yield return new WaitForSeconds(2.5f);
        isFinished = true;
    }

    public override void RepositionUI()
    {
        base.RepositionUI();

        SetTransparent(expCG);
        SetTransparent(cashCG);

        SetTransparent(expTitle);
        //SetTransparent(expReward);
        SetTransparent(expRemained);
        SetTransparent(cashTitle);
        //SetTransparent(cashReward);
        SetTransparent(cashTotal);

        //ResetColor(expRing);
        //ResetColor(expFill);
        //ResetColor(cashRing);
        //ResetColor(cashFill);

        ResetFill(expSlash);
        ResetFill(cashSlash);
        //ResetFill(backgroundBar);

        backgroundBar.transform.localScale = Vector3.one * 3f;

        // ResetPosition(expTitle.rectTransform);
        // ResetPosition(expReward.rectTransform);
        // ResetPosition(expRemained.rectTransform);
        //
        // ResetPosition(cashTitle.rectTransform);
        // ResetPosition(cashReward.rectTransform);
        // ResetPosition(cashTotal.rectTransform);

        // expSlot.anchoredPosition = new Vector2(0, expSlot.anchoredPosition.y);
        // cashSlot.anchoredPosition = new Vector2(0, expSlot.anchoredPosition.y);

    }

}
