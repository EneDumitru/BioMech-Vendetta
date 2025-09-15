using System;
using System.Collections;
using UnityEngine.InputSystem;
using UnityEngine;
using Invector.vCharacterController;
using Invector.vItemManager;
using HalvaStudio.Save;

public class PlayerDetails : MonoBehaviour
{
    public int playerID;

    private IEnumerator Start()
    {
        yield return null; // Wait one frame

        SetDeath();
        SetWeapon();

        InputManager.Instance.playerInput.actions["Pause"].Enable();
    }

    private void SetDeath()
    {
        GetComponent<vThirdPersonController>().onDead.AddListener(PlayerDead);
    }

    private void Update()
    {
        if (InputManager.Instance.playerInput.actions["Pause"].WasPerformedThisFrame())
        {
            PlayerDetails_started();
        }
    }

    private void SetWeapon()
    {
        var itemManager = GetComponent<vItemManager>();
        if (itemManager)
        {
            var reference = new ItemReference(SaveManager.Instance.saveData.selectedPistolID)
            {
                amount = 1,
                addToEquipArea = true,
                autoEquip = false,
                indexArea = 0
            };
            itemManager.CollectItem(reference);

            if (SaveManager.Instance.saveData.selectedAssaultID != 0)
                reference = new ItemReference(SaveManager.Instance.saveData.selectedAssaultID)
                {
                    amount = 1,
                    addToEquipArea = true,
                    autoEquip = true,
                    indexArea = 0
                };
            itemManager.CollectItem(reference);
        }
    }

    private void PlayerDead(GameObject _gameObject)
    {
        GameManager.Instance.totalPlayersDead += 1;

        if (GameManager.Instance.totalPlayers == GameManager.Instance.totalPlayersDead)
        {
            PanelManager.OnGoToPanel?.Invoke(PanelName.GameOver.ToString());
            PanelManager.OnBlockInteraction?.Invoke(true);
        }
    }

    // void OnEnable()
    // {
    //     var pauseAction = InputManager.Instance.playerInput.actions["Pause"];
    //     if (!pauseAction.enabled)
    //         pauseAction.Enable();
    //
    //     pauseAction.performed += PlayerDetails_started;
    //     Debug.LogError("SUB");
    // }
    //
    // void OnDisable()
    // {
    //     
    //     Debug.LogError("UNSUB");
    //     InputManager.Instance.playerInput.actions["Pause"].performed -= PlayerDetails_started;
    // }

    private void PlayerDetails_started()
    {
        PanelManager.OnPause?.Invoke();
    }
}