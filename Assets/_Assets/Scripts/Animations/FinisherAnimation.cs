using System.Collections;
using DG.Tweening;
using TMPro;
using UnityEngine;

namespace _Assets.Scripts.Animations
{
    public class FinisherAnimation : BaseAnimation
    {
        [SerializeField] private RectTransform topElement;
        [SerializeField] private RectTransform bottomElement;
        [SerializeField] private CanvasGroup elementsCanvasGroup;

        private Vector2 _topInitPos, _bottomInitPos;
        
        public override void StartAnimation()
        {
            _topInitPos = topElement.anchoredPosition;
            _bottomInitPos = bottomElement.anchoredPosition;

            topElement.anchoredPosition = _topInitPos + Vector2.left * 1000f;
            bottomElement.anchoredPosition = _bottomInitPos + Vector2.right * 1000f;

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

            // Animate top element from left
            topElement.DOAnchorPos(_topInitPos, 0.75f).SetEase(Ease.OutCubic).SetUpdate(true);
            yield return new WaitForSeconds(0.3f); // slight stagger

            // Animate bottom element from right
            bottomElement.DOAnchorPos(_bottomInitPos, 0.75f).SetEase(Ease.OutCubic).SetUpdate(true);
            yield return new WaitForSeconds(0.5f);

            // Fade in and finalize
            elementsCanvasGroup.DOFade(1f, 0.5f).SetUpdate(true);
            elementsCanvasGroup.interactable = true;
            isFinished = true;

            PanelManager.OnBlockInteraction?.Invoke(false);

        }

        public override void RepositionUI()
        {
            base.RepositionUI();
            // topElement.anchoredPosition = _topInitPos;
            // bottomElement.anchoredPosition = _bottomInitPos;
            elementsCanvasGroup.interactable = false;
            elementsCanvasGroup.alpha = 0f;
        }
    }
}