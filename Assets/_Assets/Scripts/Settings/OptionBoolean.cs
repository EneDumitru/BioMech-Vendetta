using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.Localization;
using UnityEngine.Localization.Components;
using UnityEngine.Localization.Settings;

public class OptionBoolean : OptionBase
{
    [Space]
    public bool state;
    public UnityEvent optionOn;
    public UnityEvent optionOff;

    private LocalizeStringEvent stringEvent;

    public override void SetValue(bool _value)
    {
        base.SetValue(_value);
        state = _value;
        UpdateValue();
        Debug.Log("Set value: " + _value);
    }

    public override void Next()
    {
        base.Next();
        state = !state;
        UpdateValue();
    }

    public override void Previous()
    {
        base.Previous();
        state = !state;
        UpdateValue();
    }

    public override void UpdateValue()
    {
        if (!stringEvent) stringEvent = statusText.GetComponent<LocalizeStringEvent>();
        if (stringEvent) stringEvent.StringReference.SetReference("Anime Girls Sun of a Beach", state ? "On" : "Off");
        string text = LocalizationSettings.StringDatabase.GetLocalizedString("Anime Girls Sun of a Beach", state ? "On" : "Off");
        if (statusText) statusText.text = text;
        if (state) optionOn?.Invoke();
        else optionOff?.Invoke();
    }
}
