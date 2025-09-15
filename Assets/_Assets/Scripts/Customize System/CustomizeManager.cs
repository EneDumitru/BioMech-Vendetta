using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using HalvaStudio.Save;
using System;
using _Assets.Scripts.Animations;
using DG.Tweening;
using EmeraldAI.Example;

public class CustomizeManager : Singleton<CustomizeManager>
{
    public CharacterBase[] characters;
    public Transform spawnPoint;
    public Transform customizeSpawnpoint;

    public int characterID;
    public GameObject currentCharacter;

    private Vector3 startRotation;
    public Vector3 customizeRotation;

    public static Action OnCharacterSpawn;

    private void Start()
    {
        startRotation = spawnPoint.localRotation.eulerAngles;
        SpawnSaved();
    }

    public void SpawnSaved()
    {
        characterID = SaveManager.Instance.saveData.characterID;
        SpawnGirl(spawnPoint, false);

    }

    public void Next()
    {
        characterID += 1;
        SpawnGirl();
    }

    public void Previous()
    {
        characterID -= 1;
        SpawnGirl();
    }

    public void Save()
    {
        GameManager.Instance.SetPlayerCharacter(characters[characterID]);
        SaveManager.Instance.saveData.characterID = characterID;
        SaveManager.Instance.Save();
    }

    public void SpawnGirl(Transform point = null, bool standUp = true)
    {
        if (characterID > characters.Length - 1) characterID = 0;
        else if (characterID < 0) characterID = characters.Length - 1;

        if (currentCharacter) Destroy(currentCharacter);
        if (!point) point = customizeSpawnpoint;
        currentCharacter = Instantiate(characters[characterID].girlPrefab, point.position, point.rotation);
        currentCharacter.GetComponent<Animator>().SetTrigger(standUp ? "StandUp" : "SitDown");
        currentCharacter.GetComponent<AvatarChanger>().SetAvatarCustomize();

        if (!standUp)
        {
            currentCharacter.transform.DOMove(spawnPoint.position, 0.3f);
            currentCharacter.transform.DORotate(spawnPoint.eulerAngles, 0.3f);
        }
        OnCharacterSpawn?.Invoke();
    }

    public void SetCustomizeRotation(bool state)
    {
        if (state)
        {
            currentCharacter.transform.DOMove(customizeSpawnpoint.position, 0.3f);
            currentCharacter.transform.DORotate(customizeSpawnpoint.eulerAngles, 0.3f);
            currentCharacter.GetComponent<AvatarChanger>().SetAvatarCustomize();
        }
        else
        {
            currentCharacter.transform.DOMove(spawnPoint.position, 0.3f);
            currentCharacter.transform.DORotate(spawnPoint.eulerAngles, 0.3f);
            currentCharacter.GetComponent<AvatarChanger>().SetAvatarMenu();
        }

    }

    public void CharacterState(bool state)
    {
        if (!state)
        {
            currentCharacter.SetActive(false);
        }
        else
        {
            currentCharacter.SetActive(true);
            currentCharacter.GetComponent<Animator>().SetTrigger("SitDown");
            currentCharacter.transform.DOMove(spawnPoint.position, 0.3f);
            currentCharacter.transform.DORotate(spawnPoint.eulerAngles, 0.3f);
            currentCharacter.GetComponent<AvatarChanger>().SetAvatarMenu();
        }

    }
}
