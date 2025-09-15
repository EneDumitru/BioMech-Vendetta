using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using DG.Tweening;
using TMPro;

public class CompleteAnimation : BaseAnimation
{
    public Image sideBar;
    public CanvasGroup elementsCanvasGroup;

    public override void StartAnimation()
    {
        StopAllCoroutines();
        StartCoroutine(AnimationCoroutine());
    }

    IEnumerator AnimationCoroutine()
    {
        if (canvasGroup)
        {
            canvasGroup.DOFade(1f, 0.5f).SetUpdate(true);
            yield return new WaitForSeconds(0.5f);
        }

        sideBar.DOFillAmount(1f, 0.3f).SetUpdate(true);
        yield return new WaitForSeconds(0.5f);

        elementsCanvasGroup.DOFade(1f, 0.5f).SetUpdate(true);
        elementsCanvasGroup.interactable = true;
        isFinished = true;

        PanelManager.OnBlockInteraction?.Invoke(false);
    }

    public override void RepositionUI()
    {
        base.RepositionUI();
        sideBar.fillAmount = 0f;
        elementsCanvasGroup.interactable = false;
        elementsCanvasGroup.alpha = 0f;
    }

}
