using Cinemachine;
using DG.Tweening;
using System;
using UnityEngine;
using UnityEngine.Rendering;
using UnityEngine.Rendering.Universal;

public enum CameraMode
{
    Menu, Customize, Weapons, None
}


[System.Serializable]
public class CameraSet
{
    public CinemachineVirtualCamera virtualCamera;
    public CameraMode mode;
    public bool lerpDepth;
    public float depthValue;
}

public class CameraManager : MonoBehaviour
{
    [Header("Cameras")]
    public CinemachineBrain cameraBrain;
    public CameraSet[] cameraSets;
    
    [Header("Volume")]
    public Volume postProcessVolume;
    public float tweenDuration = 0.5f; // seconds
    public Ease tweenEase = Ease.OutSine;

    private DepthOfField dof;
    private Tween dofTween;


    public static Action<CameraMode> OnChangeCameraMode;

    private void Awake()
    {
        OnChangeCameraMode = ChangeCameraMode;
    }

    private void Start()
    {
        if (postProcessVolume.profile.TryGet(out DepthOfField depthOfField))
        {
            dof = depthOfField;
        }
        else
        {
            Debug.LogError("No DepthOfField override found in the assigned Volume.");
        }

        ChangeCameraMode(CameraMode.Menu);
    }


    private void ChangeCameraMode(CameraMode _mode)
    {
        for (int i = 0; i < cameraSets.Length; i++)
        {
            if (cameraSets[i].virtualCamera && cameraSets[i].mode == _mode)
            {
                cameraSets[i].virtualCamera.enabled = true;
                if (cameraSets[i].lerpDepth) TweenFocusDistance(cameraSets[i].depthValue);
            }
            else
            {
                cameraSets[i].virtualCamera.enabled = false;
            }

        }

        cameraBrain.gameObject.SetActive(_mode != CameraMode.None);
    }

    public void TweenFocusDistance(float targetFocusDistance)
    {
        if (dof == null) return;

        // Kill any existing tween on this before starting a new one
        dofTween?.Kill();

        float startValue = dof.focusDistance.value;

        dofTween = DOTween.To(
            () => startValue,
            x => {
                startValue = x;
                dof.focusDistance.value = startValue;
            },
            targetFocusDistance,
            tweenDuration
        ).SetEase(tweenEase);
    }
}
