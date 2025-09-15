using HalvaStudio.Save;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class ExperienceSystem : Singleton<ExperienceSystem>
{
    [System.Serializable]
    public class PlayerLevelData
    {
        public int xpForNextLevel; 
        public bool isOpenNewCharacter;
    }

    public int currentLevel;
    public int remainingXPForNextLevel;
    public Action OnLevelUp;
    public Action OnUpdateExp;

    [Header("Level Data")]
    public PlayerLevelData[] playerLevels;

    private void Start()
    {
        CalculateCurrentLevel();
    }

    private void CalculateCurrentLevel()
    {
        int totalXP = SaveManager.Instance.saveData.xp;
        int characterIndex = 0;

        for (int i = 0; i < playerLevels.Length; i++)
        {
            if (totalXP >= playerLevels[i].xpForNextLevel)
            {
                totalXP -= playerLevels[i].xpForNextLevel;
                currentLevel = i + 1;

                if (playerLevels[currentLevel].isOpenNewCharacter)
                {
                    UnlockCharacterForLevel(characterIndex);
                    characterIndex += 1;
                }
            }
            else
            {
                remainingXPForNextLevel = playerLevels[i].xpForNextLevel - totalXP;
                OnUpdateExp?.Invoke();
                break;
            }
        }
    }

    private void UpdateLevelInfo(int exp)
    {
        remainingXPForNextLevel -= exp;
        if (remainingXPForNextLevel < 0)
        {
            CalculateCurrentLevel();
            OnLevelUp?.Invoke();
            SaveManager.Instance.saveData.skillPoints += 1;
        }
    }

    public void GainExperience(int experience)
    {
        SaveManager.Instance.saveData.xp += experience;
        UpdateLevelInfo(experience);
        //SaveManager.Instance.Save();
        OnUpdateExp?.Invoke();
    }

    private void UnlockCharacterForLevel(int characterIndex)
    {
        if (!SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(characterIndex))
        {
            SaveManager.Instance.saveData.charactersUnlocked[characterIndex] = true;
            CheckUnlockedCharacters();
        }
    }

    public void CheckUnlockedCharacters()
    {
        int unlockedCount = SaveManager.Instance.saveData.charactersUnlocked.Count(kvp => kvp.Value);
        PS5TrophyManager.Instance.UpdateProgressStat(TrophyEvents.OnCharacterUnlocked, TrophyParams.CharactersUnlocked, TrophyID.HOLY_SISTERHOOD, unlockedCount);
    }

    public float GetCurrentXpPercent() 
    {
        float xpPercent = (float)remainingXPForNextLevel / playerLevels[currentLevel].xpForNextLevel;
        return Mathf.Clamp01(1f - xpPercent);
    } 

    public int GetXpForNextLevel()
    {
        return playerLevels[currentLevel].xpForNextLevel;
    }

}
