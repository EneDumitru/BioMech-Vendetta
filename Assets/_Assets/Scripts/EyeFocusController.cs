using UnityEngine;

public class EyeFocusController : MonoBehaviour
{
    public Transform leftEye;
    public Transform rightEye;
    public SkinnedMeshRenderer skinnedMeshRenderer;
    // Blend shape indices for each direction of each eye
    public int leftEyeLeftIndex, leftEyeRightIndex, leftEyeUpIndex, leftEyeDownIndex;
    public int rightEyeLeftIndex, rightEyeRightIndex, rightEyeUpIndex, rightEyeDownIndex;
    public float focusStrength = 100f; // Adjust to control the intensity of the focus

    private Camera mainCamera;

    void Start()
    {
        mainCamera = Camera.main; // Get the main camera
    }

    void Update()
    {
        FocusEyes(leftEye, leftEyeLeftIndex, leftEyeRightIndex, leftEyeUpIndex, leftEyeDownIndex);
        FocusEyes(rightEye, rightEyeLeftIndex, rightEyeRightIndex, rightEyeUpIndex, rightEyeDownIndex);
    }

    void FocusEyes(Transform eye, int leftIndex, int rightIndex, int upIndex, int downIndex)
    {
        Vector3 directionToCamera = mainCamera.transform.position - eye.position; // Calculate direction to camera
        directionToCamera = eye.InverseTransformDirection(directionToCamera); // Convert to local space

        // Determine blend shape weights based on direction
        float leftWeight = Mathf.Max(0, -directionToCamera.x * focusStrength);
        float rightWeight = Mathf.Max(0, directionToCamera.x * focusStrength);
        float upWeight = Mathf.Max(0, directionToCamera.y * focusStrength);
        float downWeight = Mathf.Max(0, -directionToCamera.y * focusStrength);

        // Apply blend shape weights for each direction
        skinnedMeshRenderer.SetBlendShapeWeight(leftIndex, leftWeight);
        skinnedMeshRenderer.SetBlendShapeWeight(rightIndex, rightWeight);
        skinnedMeshRenderer.SetBlendShapeWeight(upIndex, upWeight);
        skinnedMeshRenderer.SetBlendShapeWeight(downIndex, downWeight);
    }
}
