using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using UnityEngine.Localization.Components;

public abstract class OptionBase : MonoBehaviour
{

    public TMP_Text statusText;
    public Button leftArrow;
    public Button rightArrow;
    public bool optionEnabled;
    public bool useLocalization;
    public LocalizeStringEvent localizeString;

    public Color enabledColor;
    public Color disabledColor;
    private void Awake()
    {
        //leftArrow.onClick.AddListener(Previous);
        //rightArrow.onClick.AddListener(Next);
    }


    public virtual void SetValue(bool _value)
    {

    }

    public virtual void SetValue(float _value)
    {

    }

    public virtual void SetValue(int _value)
    {

    }
    public virtual void SetValue(string _value)
    {

    }

    public virtual void UpdateValue()
    {

    }

    public void EnableOption(bool _state)
    {
        optionEnabled = _state;
        if (leftArrow)
        {
            leftArrow.gameObject.SetActive(optionEnabled);
            leftArrow.GetComponent<Image>().color = _state ? enabledColor : disabledColor;
        }

        if (rightArrow)
        {
            rightArrow.gameObject.SetActive(optionEnabled);
            rightArrow.GetComponent<Image>().color = _state ? enabledColor : disabledColor;
        }

        if (statusText)
        {
            statusText.color = _state ? enabledColor : disabledColor;
        }

        if (optionEnabled)
        {
            SettingsPanel.OnNextValue = Next;
            SettingsPanel.OnPreviousValue = Previous;
        }
        else
        {
            SettingsPanel.OnNextValue = null;
            SettingsPanel.OnPreviousValue = null;
        }

    }

    public virtual void Next()
    {
        if (!optionEnabled) return;
    }

    public virtual void Previous()
    {
        if (!optionEnabled) return;

    }
}
