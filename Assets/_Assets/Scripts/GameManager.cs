using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using HalvaStudio.Save;

public class GameManager : Singleton<GameManager>
{
    [Header("Game Data")]
    public int totalPlayers;
    public int totalPlayersDead;

    private CharacterBase playerCharacter;
    public GameObject playerInstance;

    public int ZombiesKilled { get; set; }
    public int WavesSurvived { get; set; }
    public float TotalTime { get; set; }
    public float BestTime { get; set; }
    public int Money { get; set; }
    public int Xp { get; set; }
    public bool tookDamage{ get; set; }

    public void SetPlayerCharacter(CharacterBase playerCharacter)
    {
        this.playerCharacter = playerCharacter;
    }

    public CharacterBase GetPlayerCharacter()
    {
        return playerCharacter;
    }

    public void ResetWaveData()
    {
        totalPlayersDead = 0;

        tookDamage = false;
        ZombiesKilled = 0;
        WavesSurvived = 0;
        TotalTime = 0;
        Money = 0;
        Xp = 0;
        //BestTime = LevelManager.Instance.currentLevelData.bestTime;
    }

    public void SaveReward()
    {
        //if (TotalTime > BestTime)
        //{
        //    LevelManager.Instance.currentLevelData.bestTime = TotalTime;
        //}

        if (LevelManager.Instance.currentLevelData.level + 1 <= SaveManager.Instance.saveData.levelsData.Count)
        {
            SaveManager.Instance.saveData.levelsData[LevelManager.Instance.currentLevelData.level].isUnlocked = true;
        }

        Xp += LevelManager.Instance.currentLevelData.rewardXp;
        Money += LevelManager.Instance.currentLevelData.rewardMoney;
        SaveManager.Instance.saveData.money += Money;
        ExperienceSystem.Instance.GainExperience(Xp);
        SaveManager.Instance.Save();
    }

}
