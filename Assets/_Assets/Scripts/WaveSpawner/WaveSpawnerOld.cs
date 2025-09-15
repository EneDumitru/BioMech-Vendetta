using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using HalvaStudio.Save;

namespace HalvaStudio.Old
{
    [System.Serializable]
    public class Wave
    {
        public string name;
        public List<EnemiesSet> enemiesSets; // Change to a list of enemy sets
        public int countMin;
        public int countMax;
        public float rate;
        public GameObject[] boss;
        [HideInInspector] // Hide this in the inspector, we will calculate it
        public int totalProbability;
    }

    [System.Serializable]
    public class EnemiesSet
    {
        public GameObject enemyPrefab;
        public int probability;
    }

    public enum WaveState { SPAWNING, WAITING, COUNTING };

    public class WaveSpawnerOld : Singleton<WaveSpawnerOld>
    {
        public WaveSpawnerOld waveSpawner;
        public Wave[] waves;
        public Transform[] spawnPoints;
        public int timeBetweenWaves = 5;
        public WaveState state = WaveState.COUNTING;

        //public Wave miniWave;


        private int nextWave = 0;
        private int waveCountdown;
        private float searchCountdown = 1f;

        [HideInInspector]
        public int zombiesToKill;
        [HideInInspector]
        public int zombiesKilled;
        [HideInInspector]
        public int currentWave;

        private int waveTime;

        private GameObject player;
        //public int gameMoney;

        public static Action<int, int, int> OnZombieKilled;
        public static Action OnZombieUpdateUI;
        public static Action OnZombieDestroy;
        public static Action OnWaveStart;
        //public static Action OnAddMoney;
        public static Action OnStopSpawner;

        #region Main
        //private void Awake()
        //{
        //    if (spawnPoints.Length == 0)
        //    {
        //        Debug.Log(spawnPoints.Length);
        //        Debug.Log(transform.GetChild(0).name);
        //        spawnPoints = new Transform[transform.GetChild(0).childCount];
        //    }
        //}

        void Start()
        {
            //for (int i = 0; i < transform.childCount; i++)
            //{
            //    spawnPoints[i] = transform.GetChild(i);
            //}
            player = Camera.main.gameObject;
            waveCountdown = timeBetweenWaves;
            StartWaves();
        }

        private void OnEnable()
        {
            OnZombieKilled += ZombieKilled;
            OnStopSpawner += StopWaveSpawner;
        }

        private void OnDisable()
        {
            OnZombieKilled -= ZombieKilled;
            OnStopSpawner -= StopWaveSpawner;
        }
        #endregion


        #region Wave System
        private void StartWaves()
        {
            GameManager.Instance.ResetWaveData();
            StartCoroutine(WaitForNextWave(5));
        }

        IEnumerator WaitForNextWave(int cooldown)
        {
            //OpenBoxes(true);
            state = WaveState.COUNTING;
            waveCountdown = cooldown;

            while (waveCountdown > 0)
            {
                if (waveCountdown == 3) OnZombieDestroy?.Invoke();

                //HUDPanel.OnUpdateWave?.Invoke(state, currentWave, waveCountdown);
                waveCountdown -= 1;
                yield return new WaitForSeconds(1f);
            }
            StartCoroutine(SpawnWave(waves[nextWave]));
            yield return null;
        }

        private bool UnlockCharacter()
        {
            int totalCharacters = 8;
            for (int i = 1; i < totalCharacters; i++)
            {
                if (currentWave == i * 5)//Change to every 5 waves
                {
                    if (SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(i))
                    {
                        if (!SaveManager.Instance.saveData.charactersUnlocked[i])
                        {
                            SaveManager.Instance.saveData.charactersUnlocked[i] = true;
                            SaveManager.Instance.Save();
                            return true;
                        }
                    }
                    else if (!SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(i))
                    {
                        SaveManager.Instance.saveData.charactersUnlocked[i] = true;
                        SaveManager.Instance.Save();
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
            }
            return false;
        }

        IEnumerator SpawnWave(Wave _wave)
        {
            //OpenBoxes(false);
            state = WaveState.WAITING;
            currentWave += 1;
            WaveTimerState(true);

            HUDPanel.OnWaveAnnounce?.Invoke(true, "WAVE ", currentWave, "Clear school of zombies");
            yield return new WaitForSeconds(2f);
            HUDPanel.OnWaveAnnounce?.Invoke(false, "WAVE ", currentWave, "Clear school of zombies");

            zombiesToKill = UnityEngine.Random.Range(_wave.countMin, _wave.countMax);
            zombiesKilled = 0;
            OnWaveStart?.Invoke();

            for (int i = 0; i < zombiesToKill; i++)
            {
                GameObject enemyToSpawn = GetRandomEnemyByProbability(_wave.enemiesSets);
                SpawnEnemy(enemyToSpawn.transform);
                yield return new WaitForSeconds(1f / _wave.rate);
            }

            if (_wave.boss.Length != 0)
            {
                foreach (GameObject boss in _wave.boss)
                {
                    zombiesToKill += 1;
                    SpawnEnemy(boss.transform);
                }
            }

            yield break;
        }

        //public IEnumerator SpawnMiniWave()
        //{
        //    int newZombieToKill = 4;
        //    zombiesToKill += 4;

        //    for (int i = 0; i < newZombieToKill; i++)
        //    {
        //        GameObject enemyToSpawn = GetRandomEnemyByProbability(miniWave.enemiesSets);
        //        SpawnEnemy(enemyToSpawn.transform);
        //        yield return new WaitForSeconds(1f / miniWave.rate);
        //    }
        //    yield break;
        //}

        GameObject GetRandomEnemyByProbability(List<EnemiesSet> enemySets)
        {
            int totalProbability = 0;

            foreach (var enemySet in enemySets)
            {
                totalProbability += enemySet.probability;
            }

            int randomValue = UnityEngine.Random.Range(0, totalProbability);

            foreach (var enemySet in enemySets)
            {
                if (randomValue < enemySet.probability)
                {
                    return enemySet.enemyPrefab;
                }
                randomValue -= enemySet.probability;
            }

            // Fallback to the first enemy set if something goes wrong
            return enemySets[0].enemyPrefab;
        }

        void WaveCompleted()
        {
            //GameManager.Instance.totalWaveTime = waveTime;
            GameManager.Instance.WavesSurvived = currentWave;
            StartCoroutine(AnnounceWaveCompleted());
            WaveTimerState(false);

            if (nextWave + 1 > waves.Length - 1)
            {
                //nextWave = 0;
                Debug.Log("All Waves Complete. Repeating...");
                StartCoroutine(WaitForNextWave(20));

            }
            else
            {
                nextWave++;
                StartCoroutine(WaitForNextWave(20));
            }

        }

        IEnumerator AnnounceWaveCompleted()
        {
            bool characterUnlocked = UnlockCharacter();
            Debug.Log("Character unlocked: " + characterUnlocked);

            if (characterUnlocked)
                HUDPanel.OnWaveAnnounce?.Invoke(true, "WAVE COMPLETED",currentWave, "New character unlocked");
            else
                HUDPanel.OnWaveAnnounce?.Invoke(true, "WAVE COMPLETED", currentWave, "Next wave coming soon");

            yield return new WaitForSeconds(2f);

            if (characterUnlocked)
                HUDPanel.OnWaveAnnounce?.Invoke(false, "WAVE COMPLETED", currentWave, "New character unlocked");
            else
                HUDPanel.OnWaveAnnounce?.Invoke(false, "WAVE COMPLETED", currentWave, "Next wave coming soon");

        }

        private void StopWaveSpawner()
        {
            //GameManager.Instance.totalWaveTime += waveTime;
            StopAllCoroutines();
            CancelInvoke();
        }
        #endregion


        #region Other
        private void ZombieKilled(int score, int money, int xp)
        {
            Debug.Log("Zombie Killed!");
            zombiesKilled += 1;
            //gameMoney += money;
            GameManager.Instance.TotalTime += score;
            GameManager.Instance.Money += money;
            //ExperienceSystem.Instance.GainExperience(xp);
            GameManager.Instance.ZombiesKilled += 1;
            //HUDPanel.OnUpdateZombieCount?.Invoke(zombiesToKill, zombiesKilled);
            //HUDPanel.OnUpdateMoney?.Invoke(gameMoney);

            if (state == WaveState.WAITING)
            {
                if (zombiesKilled == zombiesToKill)
                {
                    WaveCompleted();
                }
            }

        }

        private List<Transform> usedSpawnPoints = new List<Transform>();

        void SpawnEnemy(Transform _enemy)
        {

            if (spawnPoints.Length == 0)
            {
                Debug.LogError("No spawn points referenced");
                return;
            }

            // Sortați punctele de spawn în funcție de distanța față de jucător
            List<Transform> validSpawnPoints = new List<Transform>();
            foreach (Transform spawnPoint in spawnPoints)
            {
                float distanceToPlayer = Vector3.Distance(spawnPoint.position, player.transform.position);
                if (distanceToPlayer >= 3f)
                {
                    validSpawnPoints.Add(spawnPoint);
                }
            }
            validSpawnPoints.Sort((a, b) => Vector3.Distance(a.position, player.transform.position).CompareTo(Vector3.Distance(b.position, player.transform.position)));

            // Alegeți cele mai apropiate 4 puncte
            int numSpawnPointsToUse = Mathf.Min(4, validSpawnPoints.Count);
            List<Transform> closestSpawnPoints = validSpawnPoints.GetRange(0, numSpawnPointsToUse);


            // Check if all spawn points have been used; if so, reset the list
            if (usedSpawnPoints.Count == 4)
            {
                usedSpawnPoints.Clear();
            }

            int id = 0;
            while (usedSpawnPoints.Contains(closestSpawnPoints[id]))
            {
                id += 1;
                if (id >= 5)
                    break;
            }

            Instantiate(_enemy, closestSpawnPoints[id].position, closestSpawnPoints[id].rotation);
            Debug.Log("Zombie Spawned!");
            //HUDPanel.OnUpdateZombieCount?.Invoke(zombiesToKill, zombiesKilled);

            if (!usedSpawnPoints.Contains(closestSpawnPoints[id]))
            {
                usedSpawnPoints.Add(closestSpawnPoints[id]);
            }
        }



        private void WaveTimerState(bool _state)
        {
            if (_state)
            {
                waveTime = 0;
                InvokeRepeating(nameof(TimerIncrement), 1f, 1f);
            }
            else
            {
                CancelInvoke();
            }
        }

        private void TimerIncrement()
        {
            waveTime += 1;
            //HUDPanel.OnUpdateWave?.Invoke(state, currentWave, waveTime);
        }

        //public static Action<bool> OnOpenBox;

        //private void OpenBoxes(bool _state)
        //{
        //    OnOpenBox?.Invoke(_state);
        //}

        #endregion
    }
}

