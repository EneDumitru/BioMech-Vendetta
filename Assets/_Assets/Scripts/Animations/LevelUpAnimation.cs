using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using DG.Tweening;
using TMPro;

public class LevelUpAnimation : BaseAnimation
{
    [Header("Arrows Part")]
    public Image circle;
    public RectTransform arrowTransform;
    public Image[] arrows;
    public Color fillColor;

    [Header("Palm Part")]
    public RectTransform palmCircle;
    public Image slashBlue;
    public Image slashOrange;
    public TMP_Text levelText;

    public override void StartAnimation()
    {
        StopAllCoroutines();
        StartCoroutine(AnimationCoroutine());
    }

    IEnumerator AnimationCoroutine()
    {
        if (canvasGroup)
        {
            canvasGroup.DOFade(1f, 0.5f);
            yield return new WaitForSeconds(0.5f);
        }

        // circle.DOFade(1f, 0.3f).OnComplete(() => 
        // {
        //     arrowTransform.DOAnchorPos(Vector3.zero, 0.7f).SetEase(Ease.OutExpo);
        // });
        
        arrowTransform.DOAnchorPos(Vector3.zero, 0.7f).SetEase(Ease.OutExpo);
        yield return new WaitForSeconds(0.7f);
        arrows[0].DOColor(fillColor, .15f);
        yield return new WaitForSeconds(0.1f);
        arrows[1].DOColor(fillColor, .15f);
        yield return new WaitForSeconds(0.1f);
        arrows[2].DOColor(fillColor, .15f);
        yield return new WaitForSeconds(0.4f);
        // palmCircle.DOLocalRotate(Vector3.zero, 0.3f);
        // palmCircle.DOScale(1f, 0.3f);
        
        arrowTransform.DOScale(Vector3.one * 3, 0.25f).OnComplete(() =>
        {
            arrowTransform.gameObject.SetActive(false);
        });
        
        yield return new WaitForSeconds(0.5f);
        slashBlue.DOFillAmount(1f, 0.3f);
        slashOrange.DOFillAmount(1f, 0.3f);

        yield return new WaitForSeconds(0.5f);
        levelText.text = ExperienceSystem.Instance.currentLevel.ToString();
        levelText.rectTransform.DOLocalRotate(Vector3.forward * 15f, 0.5f).SetEase(Ease.InOutExpo);
        levelText.rectTransform.DOScale(1f, 0.5f).SetEase(Ease.InOutExpo);

        yield return new WaitForSeconds(1f);
        isFinished = true;
    }

    public override void RepositionUI()
    {
        base.RepositionUI();

        arrowTransform.anchoredPosition = Vector2.up * -200f;

        // palmCircle.localScale = Vector3.zero;
        // palmCircle.localEulerAngles = Vector3.forward * 90f;

        levelText.rectTransform.localEulerAngles = Vector3.forward * 90f;
        levelText.rectTransform.localScale = Vector3.zero;

        slashBlue.fillAmount = 0f;
        slashOrange.fillAmount = 0f;
    }
}
