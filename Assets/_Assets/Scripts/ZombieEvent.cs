using Invector.vCharacterController.AI;
using System.Collections.Generic;
using System.Collections;
using UnityEngine;
using System;

public class ZombieEvent : MonoBehaviour
{
    //public int points;
    public int money;
    public int xp;
    public Action OnDeath;

    public void Kill()
    {
        //WaveSpawner.OnZombieKilled?.Invoke(points, money, xp);
        OnDeath?.Invoke();
        DestroyIndicator();
    }

    public void KillOutOfWave()
    {
        OnDeath?.Invoke();
        DestroyIndicator();

    }

    private void DestroyIndicator()
    {
        if (GetComponentInChildren<Scannable>())
        {
            Destroy(GetComponentInChildren<Scannable>().gameObject);
        }
    }

    private void GiveRewards()
    {
        //GameManager.Instance.TotalScore += points;
        //GameManager.Instance.Money += money;
        //GameManager.Instance.Xp += xp;
    }
}
