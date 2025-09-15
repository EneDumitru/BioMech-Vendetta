using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;

public class ScanHelper : MonoBehaviour
{
    private void OnEnable()
    {
        InputManager.Instance.playerInput.actions["Scan"].started += ScanHelper_started;
    }

    private void OnDisable()
    {
        if (InputManager.Instance)
            InputManager.Instance.playerInput.actions["Scan"].started -= ScanHelper_started;
    }

    private void ScanHelper_started(InputAction.CallbackContext obj)
    {
        StartScan();
    }

    private void StartScan()
    {
        ScannerEffectDemo.OnScan?.Invoke(transform.position);
    }
}