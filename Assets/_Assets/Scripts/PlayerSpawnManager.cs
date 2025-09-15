using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class PlayerSpawnManager : MonoBehaviour
{
    public Transform spawnPoint;

    private void Start()
    {
        GameManager.Instance.playerInstance = Instantiate(GameManager.Instance.GetPlayerCharacter().girlPrefabGame, spawnPoint.position, spawnPoint.rotation).gameObject;
        InputManager.Instance.SwitchActionMap("Controller");
    }
}