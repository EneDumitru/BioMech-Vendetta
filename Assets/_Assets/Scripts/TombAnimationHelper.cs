using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine;

namespace _Assets.Scripts
{
    public class TombAnimationHelper : MonoBehaviour
    {
        [SerializeField] GameObject unitPrefab;
        [SerializeField] GameObject unit;
        [SerializeField] private ParticleSystem particleSystem;
        [SerializeField] bool reset;
        [SerializeField] float timeToReset = 15f;
        [SerializeField] float timeBeforeTrigger = 5f;
        private Collider triggerCollider;

        private void Awake()
        {
            triggerCollider = GetComponent<Collider>();
        }

        private void OnEnable()
        {
            LevelCompletePanel.OnLevelComplete += DisableEnemy;
        }

        private void OnDisable()
        {
            LevelCompletePanel.OnLevelComplete -= DisableEnemy;
        }

        private void DisableEnemy()
        {
            gameObject.SetActive(false);
        }

        private IEnumerator Hatch()
        {
            float basicY = unit.transform.position.y;
            unit.transform.DOMoveY(basicY - 3f, 0);
            unit.SetActive(true);
            unit.GetComponent<Animator>().SetTrigger("Spawned");
            WaveSpawner.OnAddSpawnedEnemy?.Invoke(unit);
            particleSystem.Play();

            
            unit.transform.DOMoveY(basicY, 0.2f);
            triggerCollider.enabled = false;
            
            yield return new WaitForSeconds(4f);
            particleSystem.Stop();
            
            if (reset)
            {
                yield return new WaitForSeconds(timeToReset);
                StartCoroutine(ResetTomb());
            }
        }

        private IEnumerator ResetTomb()
        {
            unit = Instantiate(unitPrefab, transform.position, transform.rotation, transform);
            unit.SetActive(false);

            yield return new WaitForSeconds(timeBeforeTrigger);
            triggerCollider.enabled = true;
        }

        private void OnTriggerEnter(Collider other)
        {
            if (other.CompareTag("Player"))
                StartCoroutine(Hatch());
        }
    }
}