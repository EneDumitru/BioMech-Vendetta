using UnityEngine;

public class SquareSpawnArea : MonoBehaviour
{
    public ParticleSystem spawnEffect;
    public float size = 5f;

    private AudioSource audioSource;

    private void Awake()
    {
        audioSource = GetComponent<AudioSource>();
    }

    public void PlaySpawnEffect()
    {
        if (spawnEffect.isPlaying) return;

        spawnEffect.Play();
        if (audioSource) audioSource.Play();
    }

    public Vector3 GetRandomPointInside()
    {
        Vector3 localPoint = new Vector3(
            Random.Range(-size / 2f, size / 2f),
            0f,
            Random.Range(-size / 2f, size / 2f)
        );

        return transform.TransformPoint(localPoint);
    }

#if UNITY_EDITOR
    private void OnDrawGizmos()
    {
        Gizmos.color = Color.green;
        Vector3 center = transform.position;
        Vector3 halfSize = new Vector3(size / 2f, 0f, size / 2f);

        Vector3[] corners = new Vector3[]
        {
                center + new Vector3(-halfSize.x, 0, -halfSize.z),
                center + new Vector3(halfSize.x, 0, -halfSize.z),
                center + new Vector3(halfSize.x, 0, halfSize.z),
                center + new Vector3(-halfSize.x, 0, halfSize.z),
        };

        // Draw square outline
        for (int i = 0; i < corners.Length; i++)
        {
            Vector3 from = corners[i];
            Vector3 to = corners[(i + 1) % corners.Length];
            Gizmos.DrawLine(from, to);
        }

        // Optional: fill area or indicate center
        Gizmos.DrawWireSphere(center, 0.1f);
    }
#endif
}