using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class EggAnimationHellper : MonoBehaviour
{
    [SerializeField] GameObject eggPrefab;
    [SerializeField] GameObject larvePrefab;
    [SerializeField] GameObject eggMesh;
    [SerializeField] GameObject larve;
    [SerializeField] bool reset;
    [SerializeField] float timeToReset = 15f;
    [SerializeField] float timeBeforeTrigger = 5f;

    private Animator eggAnimator;
    private Collider triggerCollider;

    private void Awake()
    {
        eggAnimator = GetComponent<Animator>();
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
        eggAnimator.SetTrigger("Hatch");

        larve.SetActive(true);
        //larve.transform.parent = null;
        WaveSpawner.OnAddSpawnedEnemy?.Invoke(larve);

        triggerCollider.enabled = false;

        yield return new WaitForSeconds(4f);
        eggMesh.SetActive(false);

        if (reset)
        {
            yield return new WaitForSeconds(timeToReset);
            StartCoroutine(ResetEgg());
        }
    }

    private IEnumerator ResetEgg()
    {
        eggAnimator.SetTrigger("Reset");
        eggMesh.SetActive(true);
        larve = Instantiate(larvePrefab, transform.position, transform.rotation, transform);
        larve.SetActive(false);

        yield return new WaitForSeconds(timeBeforeTrigger);
        triggerCollider.enabled = true;
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.CompareTag("Player"))
            StartCoroutine(Hatch());
    }
}
