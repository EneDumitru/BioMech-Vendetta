using UnityEngine;
using System.Collections.Generic;
using System.Collections;
using HalvaStudio.Save;
using System;

[System.Serializable]
public class Wave
{
    public List<EnemySet> enemySets;
    public int maxEnemiesActive;
    public float spawnRate;
}

[System.Serializable]
public class EnemySet
{
    public GameObject enemyPrefab;
    public int count;
}

public class WaveSpawner : MonoBehaviour
{
    public SquareSpawnArea[] spawnAreas;
    
    private Queue<GameObject> enemyQueue = new Queue<GameObject>();
    private List<GameObject> activeEnemies = new List<GameObject>();
    
    private LevelData currentLevelData;
    private int totalEnemiesToSpawn;
    private int enemiesSpawned;
    private int waveIndex = 0;
    private int enemiesRemain;
    private GameObject player;
    private bool waveWaiting;

    private bool gameInProgress;
    private float levelTime;

    public static Action<GameObject> OnAddSpawnedEnemy;

    void Start()
    {
        levelTime = 0;
        player = GameManager.Instance.playerInstance;
        StartLevel();
    }

    private void Update()
    {
        if (gameInProgress)
        {
            levelTime += Time.deltaTime;
        }
    }

    private void OnEnable()
    {
        OnAddSpawnedEnemy = AddSpawnedEnemy;
    }

    private void OnDisable()
    {
        OnAddSpawnedEnemy = null;
    }


    private void AddSpawnedEnemy(GameObject enemy)
    {
        enemiesRemain += 1;
        activeEnemies.Add(enemy);
        HUDPanel.OnUpdateZombieCount?.Invoke(enemiesRemain);
        enemy.GetComponent<ZombieEvent>().OnDeath += () => EnemyDied(enemy);
    }

    void StartLevel()
    {
        GameManager.Instance.ResetWaveData();
        waveIndex = 0;
        currentLevelData = LevelManager.Instance.currentLevelData;
        StartWave(currentLevelData.waves[waveIndex]);
        gameInProgress = true;
    }

    void StartWave(Wave wave)
    {
        StartCoroutine(AnnounceWaveStart(2f));
        foreach (EnemySet set in wave.enemySets)
        {
            for (int i = 0; i < set.count; i++)
            {
                enemyQueue.Enqueue(set.enemyPrefab);
            }
        }
        
        totalEnemiesToSpawn = enemyQueue.Count;
        int temp = enemiesRemain;
        enemiesRemain = totalEnemiesToSpawn + temp;
        enemiesSpawned = 0;

        StartCoroutine(ManageEnemySpawning());
    }

    IEnumerator ManageEnemySpawning()
    {

        while (enemiesSpawned < totalEnemiesToSpawn && activeEnemies.Count < currentLevelData.waves[waveIndex].maxEnemiesActive)
        {
            yield return new WaitForSeconds(currentLevelData.waves[waveIndex].spawnRate);
            
            SpawnEnemy();
        }
        
        yield return null;
    }


    void SpawnEnemy()
    {
        if (enemyQueue.Count > 0)
        {
            GameObject enemyPrefab = enemyQueue.Dequeue();
            Vector3 spawnPosition = ChooseSpawnPosition();
            GameObject enemy = Instantiate(enemyPrefab, spawnPosition, Quaternion.identity);

            activeEnemies.Add(enemy);
            enemiesSpawned++;

            enemy.GetComponent<ZombieEvent>().OnDeath += () => EnemyDied(enemy);
        }
    }

    private Transform lastUsedSpawnPoint = null;

    Vector3 ChooseSpawnPosition()
    {
        if (spawnAreas.Length == 0) return Vector3.zero;

        SquareSpawnArea bestArea = null;
        float shortestDistance = float.MaxValue;

        foreach (SquareSpawnArea area in spawnAreas)
        {
            float dist = Vector3.Distance(area.transform.position, player.transform.position);
            if (dist < shortestDistance)
            {
                shortestDistance = dist;
                bestArea = area;
            }
        }

        if (bestArea)
            bestArea.PlaySpawnEffect();

        return bestArea ? bestArea.GetRandomPointInside() : Vector3.zero;
    }

    void EnemyDied(GameObject enemy)
    {
        activeEnemies.Remove(enemy);
        StartCoroutine(ManageEnemySpawning());
        enemiesRemain -= 1;
        HUDPanel.OnUpdateZombieCount?.Invoke(enemiesRemain);
        StartCoroutine(CheckWaveCompletion());
        PS5TrophyManager.Instance.IncreaseProgressStat(TrophyEvents.OnMonsterKilled, TrophyParams.MonstersKilled, TrophyID.PURGE_OF_THE_DAMNED);
    }

    IEnumerator CheckWaveCompletion()
    {
        if (waveIndex+1 > currentLevelData.waves.Count)
        {
            waveWaiting = false;
        }
        
        if (enemiesSpawned == totalEnemiesToSpawn && enemiesRemain == 0 && waveWaiting == false)
        {
            waveIndex++;
            if (waveIndex < currentLevelData.waves.Count)
            {
                StartCoroutine(AnnounceWaveCompleted());

                waveWaiting = true;
                yield return new WaitForSeconds(currentLevelData.timeBetweenWaves);
                waveWaiting = false;
                StartWave(currentLevelData.waves[waveIndex]);
            }
            else
            {
                gameInProgress = false;
                SaveBestTime();
                yield return new WaitForSeconds(2f);

                LevelManager.Instance.Reward();
            }
        }

        yield return null;
    }

    IEnumerator AnnounceWaveCompleted()
    {
        HUDPanel.OnWaveAnnounce?.Invoke(true, "WAVE COMPLETED", waveIndex + 1, "Next wave coming soon");
        yield return new WaitForSeconds(2f);
        HUDPanel.OnWaveAnnounce?.Invoke(false, "WAVE COMPLETED", waveIndex + 1, "Next wave coming soon");


    }

    IEnumerator AnnounceWaveStart(float delay = 0)
    {
        yield return new WaitForSeconds(delay);
        HUDPanel.OnUpdateZombieCount?.Invoke(enemiesRemain);
        HUDPanel.OnWaveAnnounce?.Invoke(true, "WAVE ", waveIndex + 1, "Clear the area of monsters");
        yield return new WaitForSeconds(2f);
        HUDPanel.OnWaveAnnounce?.Invoke(false, "WAVE ", waveIndex + 1, "Clear the area of monsters");
    }

    public void SaveBestTime()
    {
        int levelIndex = LevelManager.Instance.currentLevelData.level;
        //Debug.LogError("Level Index: " + levelIndex);

        if (LevelManager.Instance.currentLevelData.bestTime > levelTime)
        {
            LevelManager.Instance.currentLevelData.bestTime = levelTime;
            SaveManager.Instance.saveData.levelsData[levelIndex].bestTime = levelTime;

        }

        if (!SaveManager.Instance.saveData.levelsData[levelIndex - 1].isCompleted)
        {
            SaveManager.Instance.saveData.levelsData[levelIndex - 1].isCompleted = true;
        }

        int levelsCompleted = 0;
        foreach (var level in SaveManager.Instance.saveData.levelsData)
        {
            if (level.isCompleted) levelsCompleted += 1;
        }

        if (levelIndex == 30) levelsCompleted = 30;

        PS5TrophyManager.Instance.UpdateProgressStat(TrophyEvents.OnLevelCompleted, TrophyParams.LevelsCompleted, TrophyID.SANCTUARY_SWEEPER, levelsCompleted);
     

        levelIndex += 1;
        string levelKey = $"Complete_Level_{levelIndex}";

#if UNITY_PS5 && !UNITY_EDITOR
        if (NpManager.Instance.levelsCompleted.ContainsKey(levelKey))
        {
            NpManager.Instance.levelsCompleted[levelKey] = true;
            NpManager.Instance.EndLevel(levelKey, NpManager.ActivityEndState.Completed);
        }

        if (!GameManager.Instance.tookDamage)
            PS5TrophyManager.Instance.UnlockTrophy(TrophyID.IMMACULATE_VICTORY);
#endif
    }
}
