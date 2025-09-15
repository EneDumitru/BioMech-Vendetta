using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using HalvaStudio.Save;
using UnityEngine.Rendering;
using UnityEngine.Localization.Settings;
using Invector.vCamera;

public class SettingsManager : Singleton<SettingsManager>
{
    private vThirdPersonCamera tpCamera;
    private void Start()
    {
        Application.targetFrameRate = 60;
        DebugManager.instance.enableRuntimeUI = false;
        Load();
    }

    private void Load()
    {
        ChangeSound(SaveManager.Instance.saveData.soundLevel);
        ChangeMusic(SaveManager.Instance.saveData.musicLevel);
        ChangeLookSensitivity(SaveManager.Instance.saveData.lookSensitivity);
        ChangeVibration(SaveManager.Instance.saveData.vibrationsState);
        ChangeLanguage(SaveManager.Instance.saveData.language);
        ChangeInvertedY(SaveManager.Instance.saveData.invertedY);
    }

    public void ChangeSound(int _value)
    {
        SaveManager.Instance.saveData.soundLevel = _value;
        AudioListener.volume = ((float)SaveManager.Instance.saveData.soundLevel) / 100f;
        AudioManager.Instance.UpdateSound();
    }

    public void ChangeMusic(int _value)
    {
        SaveManager.Instance.saveData.musicLevel = _value;
        AudioManager.Instance.UpdateMusic();
    }

    public int sensitivity;
    public void ChangeLookSensitivity(int _value)
    {
        SaveManager.Instance.saveData.lookSensitivity = _value;
        sensitivity = _value;
    }

    public void ChangeVibration(bool _state)
    {
        SaveManager.Instance.saveData.vibrationsState = _state;
    }
    public void ChangeIndicator(bool _state)
    {
        SaveManager.Instance.saveData.indicatorState = _state;
        //IndicatorCanvas.OnIndicatorState?.Invoke(_state);
    }

    public void ChangeInvertedY(bool _state)
    {
        SaveManager.Instance.saveData.invertedY = _state;
        //IndicatorCanvas.OnIndicatorState?.Invoke(_state);
    }

    public void ChangeLanguage(string _language)
    {
        StartCoroutine(LanguageCoroutine(_language));
    }



    IEnumerator LanguageCoroutine(string _language)
    {
        yield return new WaitUntil(() => LocalizationSettings.AvailableLocales.Locales.Count > 0);
        ChangeLanguageAfter(_language);
    }


    public void ChangeLanguageAfter(string _language)
    {
        SaveManager.Instance.saveData.language = _language;

        switch (_language)
        {
            case "English":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[0];
                break;

            case "ChineseSimplified":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[1];
                break;

            case "ChineseTraditional":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[2];
                break;

            case "Dutch":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[3];
                break;

            case "French":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[4];
                break;

            case "German":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[5];
                break;

            case "Italian":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[6];
                break;

            case "Japanese":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[7];
                break;

            case "Korean":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[8];
                break;

            case "Portuguese":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[9];
                break;

            case "Spanish":
                LocalizationSettings.SelectedLocale = LocalizationSettings.AvailableLocales.Locales[10];
                break;

            default:
                break;
        }
    }
}
