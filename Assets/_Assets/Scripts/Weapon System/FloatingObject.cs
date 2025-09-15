using UnityEngine;
using DG.Tweening;

public class FloatingObject : MonoBehaviour
{
    private float appearDuration = 1f; // Adjust the duration as needed
    private float floatingHeight = 0.3f; // Height of the floating motion
    private float floatingDuration = 1f; // Duration of one float cycle

    private void Start()
    {
        transform.localScale = Vector3.zero;
        DoFloat();
    }

    private void DoFloat()
    {
        // Ensure the end position is above the ground
        Vector3 endPos = transform.position + new Vector3(0, floatingHeight, 0);

        DOTween.Sequence()
            .Append(transform.DOMove(endPos, appearDuration))
            .Join(transform.DOScale(1, appearDuration))
            .AppendCallback(() =>
            {
                // Start floating motion from the end position
                float startY = transform.localPosition.y;
                float endY = startY + floatingHeight;

                transform.DOLocalMoveY(endY, floatingDuration)
                        .SetLoops(-1, LoopType.Yoyo)
                        .SetEase(Ease.InOutSine);
            });
    }

    private void OnDestroy()
    {
        transform.DOKill();
    }
}
