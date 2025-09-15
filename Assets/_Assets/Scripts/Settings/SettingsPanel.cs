using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;
using System;
using HalvaStudio.Save;


public enum SettingsType
{
    Sound, Music, Vibrations, Sensitivity, Indicator, Controls, Language, InvertedY
}

public class SettingsPanel : Panel
{
    public SettingsRow[] settingsRows;

    private bool isInitialized;

    public static Action OnNextValue;
    public static Action OnPreviousValue;

    private void Start()
    {
        SetupSettings();
        SetStartValues();
        EventSystem.current.SetSelectedGameObject(settingsRows[0].gameObject, null);
        isInitialized = true;
        SetEvents(true);
    }


    private void OnEnable()
    {
        if (isInitialized)
        {
            SetEvents(true);
        }
    }

    private void SetEvents(bool _state)
    {
        Debug.Log("Set Panel Events: " + _state);

        if (_state)
        {
            InputManager.Instance.playerInput.actions["Cancel"].performed += Cancel_performed;
            InputManager.Instance.playerInput.actions["Submit"].performed += Submit_performed;
            InputManager.Instance.playerInput.actions["Navigate"].started += Move_started;

            EventSystem.current.SetSelectedGameObject(settingsRows[0].gameObject, null);
            settingsRows[0].Select();
            //SetStartValues();
            Time.timeScale = 0f;
        }
        else
        {
            InputManager.Instance.playerInput.actions["Cancel"].performed -= Cancel_performed;
            InputManager.Instance.playerInput.actions["Submit"].performed -= Submit_performed;
            InputManager.Instance.playerInput.actions["Navigate"].started -= Move_started;
            Time.timeScale = 1f;
        }
    }

    private void OnDisable()
    {
        if (isInitialized)
        {
            SaveManager.Instance.Save();
            SetEvents(false);
        }
    }


    private void Move_started(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        Vector2 inputVector = obj.ReadValue<Vector2>();

        if (inputVector.x == 1f)
        {
            OnNextValue?.Invoke();
            AudioManager.Instance.Play("Tick");

        }
        else if(inputVector.x == -1f)
        {
            OnPreviousValue?.Invoke();
            AudioManager.Instance.Play("Tick");
        }
    }



    private void Cancel_performed(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        PanelManager.OnGoBack?.Invoke();
    }

    private void Submit_performed(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
    }


    private void SetupSettings()
    {
        int count = settingsRows.Length;

        for (int i = 0; i < settingsRows.Length; i++)
        {
            settingsRows[i].SetupRow();
        }


        for (int i = 0; i < count; i++)
        {
            if (i == 0)
            {
                settingsRows[i].SetupNavigation(null, settingsRows[i + 1].button);
            }
            else if (i > 0 && i < count - 1)
            {
                settingsRows[i].SetupNavigation(settingsRows[i - 1].button, settingsRows[i + 1].button);
            }
            else
            {
                settingsRows[i].SetupNavigation(settingsRows[i - 1].button, null);
            }
        }
    }

    private void SetStartValues()
    {
        for (int i = 0; i < settingsRows.Length; i++)
        {
            switch (settingsRows[i].settingsType)
            {
                case SettingsType.Sound:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.soundLevel);
                    break;
                case SettingsType.Music:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.musicLevel);
                    break;
                case SettingsType.Sensitivity:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.lookSensitivity);
                    break;
                case SettingsType.Vibrations:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.vibrationsState);
                    break;
                case SettingsType.Indicator:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.indicatorState);
                    break;
                case SettingsType.Language:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.language);
                    break;
                case SettingsType.InvertedY:
                    settingsRows[i].optionBase.SetValue(SaveManager.Instance.saveData.invertedY);
                    break;
                case SettingsType.Controls:
                    break;
                default:
                    break;
            }
        }
    }

    #region Methods
    public void ChangeSound(int _value)
    {
        SettingsManager.Instance.ChangeSound(_value);
    }

    public void ChangeMusic(int _value)
    {
        SettingsManager.Instance.ChangeMusic(_value);
    }

    public void ChangeLookSensitivity(int _value)
    {
        SettingsManager.Instance.ChangeLookSensitivity(_value);
    }

    public void ChangeVibration(bool _state)
    {
        SettingsManager.Instance.ChangeVibration(_state);
    }

    public void ChangeIndicator(bool _state)
    {
        SettingsManager.Instance.ChangeIndicator(_state);
    }

    public void ChangeLanguage(string language)
    {
        SettingsManager.Instance.ChangeLanguage(language);
    }

    public void ChangeInvertedY(bool _state)
    {
        SettingsManager.Instance.ChangeInvertedY(_state);
    }

    #endregion
}
