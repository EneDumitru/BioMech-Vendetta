using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "New Level", menuName = "Anime Girls/Create New Level", order = 1)]
public class LevelData : ScriptableObject
{
    [Header("Main")]
    public int level;
    public string locationSubtitle;
    public Sprite locationSprite;

    [Header("Details")]
    public float bestTime;

    [Header("Rewards")]
    public int rewardMoney;
    public int rewardXp;

    [Header("Scene")]
    public SceneName scene;

    public enum SceneName
    {
        GameScene_Islands, GameScene_Donut, GameScene_Lagoon, GameScene_Church
    }
    public float timeBetweenWaves = 5;
    public List<Wave> waves;

    public int GetTotalKills()
    {
        int totalKills = 0;

        foreach (Wave wave in waves)
        {
            foreach (EnemySet set in wave.enemySets)
            {
                totalKills += set.count;
            }
        }

        return totalKills;
    }
}
