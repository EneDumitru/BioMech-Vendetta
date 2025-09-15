using DG.Tweening;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EmeraldAIDestroy : MonoBehaviour
{
    private float destroyAfter = 1f;
    private DissolveAnimation dissolveAnimation;

    private void Awake()
    {
        dissolveAnimation = GetComponent<DissolveAnimation>();
    }

    public void DestroyObject()
    {
        Destroy(gameObject, destroyAfter);
    }

    public void DestroyObjectAfterGrounding()
    {
        Invoke(nameof(WaitSeconds), destroyAfter);
    }

    private void WaitSeconds()
    {
        if (dissolveAnimation)
            dissolveAnimation.DisappearAnimation(3f, () => Destroy(gameObject));
        else
            gameObject.transform.DOMoveY(-2, 10).OnComplete(() => Destroy(gameObject));

    }
    
    public void GoThroughGround(float time, float delay)
    {
        if (dissolveAnimation)
            dissolveAnimation.DisappearAnimation(3f, () => Destroy(gameObject));
        else
            gameObject.transform.DOMoveY(-2, time).SetDelay(delay).OnComplete(() => Destroy(gameObject));
    }
}
