using UnityEngine;
using System.Collections;

public class EyeBlinking : MonoBehaviour
{
    public SkinnedMeshRenderer skinnedMeshRenderer;
    public int leftEyeBlendShapeIndex;  // The blend shape index for the left eye
    public int rightEyeBlendShapeIndex; // The blend shape index for the right eye
    public float blinkDuration = 0.1f;  // Duration of a single blink

    private float blinkTimer;
    private bool isBlinking = false;

    void Update()
    {
        if (!isBlinking)
        {
            // Set a random timer for the next blink
            blinkTimer -= Time.deltaTime;
            if (blinkTimer <= 0f)
            {
                StartCoroutine(Blink());
                // Reset the timer to a new random value, e.g., between 3 to 5 seconds
                blinkTimer = Random.Range(3f, 5f);
            }
        }
    }

    private IEnumerator Blink()
    {
        isBlinking = true;
        float timer = 0f;

        // Close the eyes
        while (timer < blinkDuration)
        {
            timer += Time.deltaTime;
            float blendValue = Mathf.Lerp(0, 100, timer / blinkDuration);
            skinnedMeshRenderer.SetBlendShapeWeight(leftEyeBlendShapeIndex, blendValue);
            skinnedMeshRenderer.SetBlendShapeWeight(rightEyeBlendShapeIndex, blendValue);
            yield return null;
        }

        // Open the eyes
        timer = 0f;
        while (timer < blinkDuration)
        {
            timer += Time.deltaTime;
            float blendValue = Mathf.Lerp(100, 0, timer / blinkDuration);
            skinnedMeshRenderer.SetBlendShapeWeight(leftEyeBlendShapeIndex, blendValue);
            skinnedMeshRenderer.SetBlendShapeWeight(rightEyeBlendShapeIndex, blendValue);
            yield return null;
        }

        isBlinking = false;
    }
}
