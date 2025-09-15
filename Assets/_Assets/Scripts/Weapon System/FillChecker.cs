using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Invector.vItemManager;

public class FillChecker : MonoBehaviour
{
    public CollectableContainer collectableContainer;

    private void Start()
    {
        GetComponent<vItemCollection>().OnPressActionInput.AddListener(Collected);
    }
    public void Collected()
    {
        if (collectableContainer)
        {
            collectableContainer.Invoke(nameof(collectableContainer.CollectableCollected),2f);
            AchievementCollected();
        }
    }

    public void AchievementCollected()
    {
        if (collectableContainer.containerType == CollectableContainer.ContainerTypes.Ammo)
        {
            PS5TrophyManager.Instance.IncreaseProgressStat(TrophyEvents.OnAmmoPicked, TrophyParams.AmmoPicked, TrophyID.ARMORY_OF_LIGHT);
        }
        else if (collectableContainer.containerType == CollectableContainer.ContainerTypes.Heal)
        {
            PS5TrophyManager.Instance.IncreaseProgressStat(TrophyEvents.OnHealthPicked, TrophyParams.HealthPicked, TrophyID.DIVINE_RESTORATION);
        }
    }
}
