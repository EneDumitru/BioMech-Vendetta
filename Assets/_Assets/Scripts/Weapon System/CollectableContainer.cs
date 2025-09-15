using UnityEngine;
using System.Collections.Generic;
using System;
using Random = UnityEngine.Random;
using Invector.vItemManager;
using DG.Tweening;

public class CollectableContainer : MonoBehaviour
{
    public ContainerTypes containerType;
    public enum ContainerTypes
    {
        Ammo,
        Grenade,
        Weapon,
        Heal,
        Random
    }

    
    [SerializeField] private Transform door;
    [SerializeField] private Vector3 openAngle =  new Vector3(150f, 0f, 0f);

    
    [SerializeField] private CollectableData[] collectableSpecs;
    [SerializeField] private Transform[] spawnPoints;


    private bool isWaitToDestroy;
    private List<GameObject> spawnedCollectables = new List<GameObject>();

    public delegate void ContainerDestroyedEventHandler(Transform destroyedContainer);
    public event ContainerDestroyedEventHandler OnContainerDestroyed;


    public void FillContainerNew()
    {
        OpenChestAnimation();
        spawnedCollectables.Clear();
        for (int i = 0; i < spawnPoints.Length; i++)
        {
            int collectableID = Random.Range(0, collectableSpecs.Length);
            GameObject gameObj = Instantiate(collectableSpecs[collectableID].collectablePrefab, spawnPoints[i].position, spawnPoints[i].rotation, transform);

            gameObj.GetComponent<FillChecker>().collectableContainer = this;
            spawnedCollectables.Add(gameObj);
        }
    }

    public void CollectableCollected()
    {
        foreach (GameObject collectable in spawnedCollectables)
        {
            if (collectable != null)
            {
                return;
            }

        }

        if (!isWaitToDestroy)
        {
            Invoke(nameof(DestroyContainer), 60f);
            //Destroy(GetComponentInChildren<Target>().gameObject);
            isWaitToDestroy = true;
        }
    }

    private void OpenChestAnimation()
    {
        door.DOLocalRotate(openAngle, 1f).SetEase(Ease.OutCubic);
    }

    private void DestroyContainer()
    {
        OnContainerDestroyed?.Invoke(transform);
        Destroy(gameObject);
    }
}