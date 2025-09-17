using System;
using HalvaStudio.Save;
using Unity.Mathematics;
using UnityEngine;

namespace _Assets.Scripts.Companions
{
    public class CompanionSpawner : MonoBehaviour
    {
        [SerializeField] private CompanionData[] companions;

        private void Start()
        {
            CompanionData companionData = GetSavedCompanionData();
            if (companionData == null) return;
            
            Vector3 spawnOffset = new Vector3(1.5f, 0f, 1.5f);
            Vector3 spawnPosition = GameManager.Instance.playerInstance.transform.position + spawnOffset;

            Instantiate(companionData.prefab, spawnPosition, Quaternion.identity);

        }

        private CompanionData GetSavedCompanionData()
        {
            int savedID = SaveManager.Instance.saveData.selectedCompanionID;
            foreach (var data in companions)
            {
                if (data.id == savedID)
                    return data;
            }

            return null;
        }
    }
}