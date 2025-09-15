using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Linq;
using Michsky.LSS;
using HalvaStudio.Save;

public class LevelManager : Singleton<LevelManager>
{
    public LevelData[] levelData;
    public LevelData currentLevelData;

    //public override void AwakeInit()
    //{
    //    if (levelData == null)
    //    {
    //        levelData = Resources.LoadAll<LevelData>("Level Data").OrderBy(levelData => levelData.level).ToArray();
    //    }

    //}

    public void Initialize()
    {
        if (SaveManager.Instance.saveData.levelsData.Count == 0)
        {
            for (int i = 0; i < levelData.Length; i++)
            {
                bool isUnlocked = i < SaveManager.Instance.unlockLevels;
                SaveManager.Instance.saveData.levelsData.Add(new SaveManager.LevelSaveData(isUnlocked));
            }
        }

        //SaveManager.Instance.Save();
    }

    public void SelectLevel(int _levelID)
    {
        currentLevelData = levelData[_levelID];

        GameManager.Instance.totalPlayers = 1;
        GameManager.Instance.SetPlayerCharacter(
            CustomizeManager.Instance.characters[SaveManager.Instance.saveData.characterID]);

        _levelID += 1;
        string levelKey = $"Complete_Level_{_levelID}";
        LoadingScreen.LoadScene(currentLevelData.scene.ToString());
    }

    public void NextLevel()
    {
        int index = Array.IndexOf(levelData, currentLevelData) + 1;

        if (index < levelData.Length)
        {
            currentLevelData = levelData[index];
            LoadingScreen.LoadScene(currentLevelData.scene.ToString());
        }
        else LoadingScreen.LoadScene("Menu_Scene");
    }

    public void Reward()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.LevelComplete.ToString());
        PanelManager.OnBlockInteraction?.Invoke(true);
    }
}