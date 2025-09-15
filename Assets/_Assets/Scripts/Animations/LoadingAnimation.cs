using System.Collections;
using TMPro;
using UnityEngine;

namespace _Assets.Scripts.Animations
{
    public class LoadingAnimation:MonoBehaviour
    {
        [SerializeField] private TMP_Text loadingText; // Or TMP_Text if you're using TextMeshPro
        [SerializeField] private float interval = 0.35f;
        [SerializeField] private int maxDots = 3;

        private void OnEnable()
        {
            StartCoroutine(AnimateDots());
        }

        private IEnumerator AnimateDots()
        {
            int dotCount = 0;

            while (true)
            {
                dotCount = (dotCount + 1) % (maxDots + 1);
                string dots = new string('.', dotCount);
                loadingText.text = $"Loading{dots}";
                yield return new WaitForSeconds(interval);
            }
        }

        private void OnDisable()
        {
            StopAllCoroutines(); // Clean stop if screen is hidden or unloaded
        }
    }
}