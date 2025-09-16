using System;
using Unity.Mathematics;
using UnityEngine;

namespace _Assets.Scripts.Companions
{
    public class CompanionSpawner : MonoBehaviour
    {
        [SerializeField] private GameObject companion;

        private void Start()
        {
            Vector3 spawnOffset = new Vector3(1.5f, 0f, 1.5f);
            Vector3 spawnPosition = GameManager.Instance.playerInstance.transform.position + spawnOffset;

            Instantiate(companion, spawnPosition, Quaternion.identity);

        }
    }
}