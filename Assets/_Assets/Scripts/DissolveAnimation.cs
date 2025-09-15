using AmazingAssets.AdvancedDissolve;
using DG.Tweening;
using System;
using UnityEngine;

public class DissolveAnimation : MonoBehaviour
{
    private Renderer[] renderers;
    private Material[][] materials;
    private float clipValue;

    private void Start()
    {
        renderers = GetComponentsInChildren<Renderer>();
        materials = new Material[renderers.Length][];

        // Create new material instances and assign them correctly to the renderer
        for (int i = 0; i < renderers.Length; i++)
        {
            var rendererMaterials = renderers[i].materials; // Get all the materials attached to the renderer
            materials[i] = new Material[rendererMaterials.Length];

            for (int j = 0; j < rendererMaterials.Length; j++)
            {
                // Create new instances of materials to avoid affecting shared materials
                materials[i][j] = new Material(rendererMaterials[j]);
            }

            // Assign the new materials back to the renderer
            renderers[i].materials = materials[i];
        }

        AppearAnimation();
    }

    public void AppearAnimation(float duration = 3f)
    {
        clipValue = 1f;
        UpdateClipValues();

        DOTween.To(() => clipValue, x => clipValue = x, 0f, duration)
            .OnUpdate(() =>
            {
                UpdateClipValues();
            }).OnComplete(() =>
            {
                // Optionally, reset materials or handle any final changes here
            });
    }

    public void DisappearAnimation(float duration = 3f, Action callback = null)
    {
        clipValue = 0f;
        UpdateClipValues();

        DOTween.To(() => clipValue, x => clipValue = x, 1f, duration)
            .OnUpdate(() =>
            {
                UpdateClipValues();
            }).OnComplete(() => callback?.Invoke());
    }

    private void UpdateClipValues()
    {
        foreach (var rendererMaterials in materials)
        {
            foreach (var material in rendererMaterials)
            {
                AdvancedDissolveProperties.Cutout.Standard.UpdateLocalProperty(material, AdvancedDissolveProperties.Cutout.Standard.Property.Clip, clipValue);
            }
        }
    }
}
