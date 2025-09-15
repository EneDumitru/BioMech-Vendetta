using System;
using UnityEngine;
using UnityEngine.InputSystem;

public class InputManager : Singleton<InputManager>
{
    public PlayerInput playerInput;

    public enum PlatformType { PC, PlayStation, Switch, Unknown }
    public enum InputDeviceType { KeyboardMouse, PlayStation, Xbox, SwitchPro, GenericGamepad }

    public PlatformType CurrentPlatform { get; private set; }
    public InputDeviceType CurrentDevice { get; private set; }

    public event Action<InputDeviceType> OnDeviceChanged;
    private InputDeviceType lastPolledDevice;

    private InputDevice lastDevice;


    public override void AwakeInit()
    {
        base.AwakeInit();
        
        DetectPlatform();
        DetectInitialDevice();
        InputSystem.onDeviceChange += HandleDeviceChange;
    }
    
    private void DetectPlatform()
    {
        switch (Application.platform)
        {
            case RuntimePlatform.WindowsPlayer:
            case RuntimePlatform.OSXPlayer:
            case RuntimePlatform.LinuxPlayer:
            case RuntimePlatform.WindowsEditor:
                CurrentPlatform = PlatformType.PC;
                break;
            case RuntimePlatform.PS4:
            case RuntimePlatform.PS5:
                CurrentPlatform = PlatformType.PlayStation;
                break;
            case RuntimePlatform.Switch:
                CurrentPlatform = PlatformType.Switch;
                break;
            default:
                CurrentPlatform = PlatformType.Unknown;
                break;
        }
    }

    private void DetectInitialDevice()
    {
        if (Keyboard.current != null && Keyboard.current.enabled)
        {
            SetDevice(InputDeviceType.KeyboardMouse);
        }
        else if (Gamepad.current != null)
        {
            SetDevice(GetDeviceType(Gamepad.current));
        }
    }

    private void HandleDeviceChange(InputDevice device, InputDeviceChange change)
    {
        if (CurrentPlatform != PlatformType.PC) return;

        if (device is Gamepad && (change == InputDeviceChange.Added || change == InputDeviceChange.Reconnected))
        {
            if (device != lastDevice)
            {
                SetDevice(GetDeviceType(device));
            }
        }
        else if (device is Keyboard && change == InputDeviceChange.Reconnected)
        {
            SetDevice(InputDeviceType.KeyboardMouse);
        }
    }

    private void SetDevice(InputDeviceType deviceType)
    {
        lastDevice = InputSystem.GetDevice<Gamepad>();
        if (CurrentDevice != deviceType)
        {
            CurrentDevice = deviceType;
            OnDeviceChanged?.Invoke(deviceType);
        }
    }

    private InputDeviceType GetDeviceType(InputDevice device)
    {
        string product = device.description.product.ToLower();

        if (product.Contains("playstation") || product.Contains("dualsense") || product.Contains("dualshock"))
            return InputDeviceType.PlayStation;
        if (product.Contains("xbox"))
            return InputDeviceType.Xbox;
        if (product.Contains("switch") || product.Contains("pro controller"))
            return InputDeviceType.SwitchPro;

        return InputDeviceType.PlayStation;
    }

    private void Update()
    {
        if (CurrentPlatform != PlatformType.PC) return;

        InputDeviceType detectedDevice = CurrentDevice;

        if (Keyboard.current != null && Keyboard.current.anyKey.wasPressedThisFrame ||
            Mouse.current != null && Mouse.current.leftButton.wasPressedThisFrame)
        {
            detectedDevice = InputDeviceType.KeyboardMouse;
        }
        else if (Gamepad.current != null && GamepadHasInput(Gamepad.current))
        {
            detectedDevice = GetDeviceType(Gamepad.current);
        }

        if (detectedDevice != CurrentDevice)
        {
            SetDevice(detectedDevice);
        }
    }

    private bool GamepadHasInput(Gamepad gamepad)
    {
        if (gamepad == null) return false;

        return gamepad.buttonSouth.wasPressedThisFrame ||
               gamepad.buttonNorth.wasPressedThisFrame ||
               gamepad.buttonEast.wasPressedThisFrame ||
               gamepad.buttonWest.wasPressedThisFrame ||
               gamepad.leftStick.ReadValue().magnitude > 0.1f ||
               gamepad.rightStick.ReadValue().magnitude > 0.1f ||
               gamepad.dpad.ReadValue().magnitude > 0.1f ||
               gamepad.leftTrigger.ReadValue() > 0.1f ||
               gamepad.rightTrigger.ReadValue() > 0.1f ||
               gamepad.leftShoulder.wasPressedThisFrame ||  
               gamepad.rightShoulder.wasPressedThisFrame;   
    }

    public void SwitchActionMap(string map)
    {
        playerInput.SwitchCurrentActionMap(map);
    }
}