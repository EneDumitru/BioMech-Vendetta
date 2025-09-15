using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ControlsPanel : Panel
{
    private void OnEnable()
    {
        InputManager.Instance.playerInput.actions["Cancel"].performed += Cancel_performed;
        Time.timeScale = 0;

    }
    private void OnDisable()
    {
        InputManager.Instance.playerInput.actions["Cancel"].performed -= Cancel_performed;
        Time.timeScale = 1;
    }
    private void Cancel_performed(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        PanelManager.OnGoBack?.Invoke();
    }
}
