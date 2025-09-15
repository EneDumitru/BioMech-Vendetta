using UnityEngine;
using System;
using System.Collections.Generic;
using System.Collections;

[Serializable]
public struct ContainerInfo
{
    public CollectableContainer containerPrefab;
    public int numberOfContainers;
}

public class ContainerSpawner : MonoBehaviour
{
    [SerializeField] private Transform containerParent;
    [SerializeField] private Transform[] containerSpawnPoints;
    [SerializeField] private CollectableContainer[] containerInfos;
    [SerializeField] private float timeBetweenSpawn = 30;

    private List<int> availableSpawnIndices = new List<int>();

    IEnumerator Start()
    {
        yield return new WaitForSeconds(2);
        InitializeSpawnIndices();
        StartCoroutine(SpawnContainers());
    }

    private IEnumerator SpawnContainers()
    {
        if (containerSpawnPoints.Length == 0 || containerInfos.Length == 0)
        {
            Debug.LogWarning("Container spawn points or container infos are missing.");
            yield break;
        }

        foreach (var containerInfo in containerInfos)
        {

            
                yield return new WaitForSeconds(timeBetweenSpawn/3);
                SpawnContainerOfType(containerInfo);
                yield return new WaitForSeconds(timeBetweenSpawn);
            
        }
    }

    private void SpawnContainerOfType(CollectableContainer containerPrefab)
    {
        if (availableSpawnIndices.Count == 0)
        {
            Debug.LogWarning("All spawn points have been used.");
            return;
        }

        int randomSpawnIndexIndex = UnityEngine.Random.Range(0, availableSpawnIndices.Count);
        int randomSpawnIndex = availableSpawnIndices[randomSpawnIndexIndex];

        Transform spawnPoint = containerSpawnPoints[randomSpawnIndex];

        if (containerPrefab != null && spawnPoint != null)
        {
            CollectableContainer spawnedContainer = Instantiate(containerPrefab, spawnPoint.position, spawnPoint.rotation, containerParent);
            // Nu setăm tipul, deoarece tipul este deja predefinit în containerPrefab
            spawnedContainer.OnContainerDestroyed += HandleContainerDestroyed;
        }

        availableSpawnIndices.RemoveAt(randomSpawnIndexIndex);
    }

    private void InitializeSpawnIndices()
    {
        availableSpawnIndices.Clear();
        for (int i = 0; i < containerSpawnPoints.Length; i++)
        {
            availableSpawnIndices.Add(i);
        }
    }

    public CollectableContainer GetRandomContainer()
    {
        if (containerInfos.Length == 0)
        {
            Debug.LogWarning("No container infos available.");
            return null;
        }

        int randomContainerIndex = UnityEngine.Random.Range(0, containerInfos.Length);
        return containerInfos[randomContainerIndex];
    }
    private void HandleContainerDestroyed(Transform destroyedContainer)
    {
        CollectableContainer spawnedContainer = Instantiate(GetRandomContainer(), destroyedContainer.position, destroyedContainer.rotation, containerParent);
        // Nu setăm tipul, deoarece tipul este deja predefinit în containerPrefab
        spawnedContainer.OnContainerDestroyed += HandleContainerDestroyed;
    }
}