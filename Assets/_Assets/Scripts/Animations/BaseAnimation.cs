using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using DG.Tweening;

public class BaseAnimation : MonoBehaviour
{
    [HideInInspector] public bool isFinished;
    [HideInInspector] public CanvasGroup canvasGroup;
    private Color transparent = new Color(1f, 1f, 1f, 0f);

    private void Awake()
    {
        canvasGroup = transform.GetComponent<CanvasGroup>();
    }

    protected void ResetPosition(RectTransform rect)
    {
        if (canvasGroup) canvasGroup.alpha = 0f;
        rect.anchoredPosition = Vector2.zero;
    }

    protected void ResetColor(Image image)
    {
        image.color = transparent;
    }

    protected void ResetFill(Image image)
    {
        image.fillAmount = 0;
    }

    protected void SetTransparent(TMP_Text text)
    {
        text.alpha = 0;
    }

    protected void SetTransparent(CanvasGroup canvasGroup)
    {
        canvasGroup.alpha = 0;
    }

    public virtual void RepositionUI()
    {
        isFinished = false;
        if (canvasGroup) canvasGroup.alpha = 0f;
    }

    public virtual void PlayAnimation()
    {
        RepositionUI();
        StartAnimation();
    }

    public virtual void CloseAnimation()
    {
        if (canvasGroup) canvasGroup.DOFade(0f, 0.5f).SetUpdate(true);
    }

    public virtual void StartAnimation()
    {
        if (canvasGroup) canvasGroup.alpha = 0f;
    }
}
