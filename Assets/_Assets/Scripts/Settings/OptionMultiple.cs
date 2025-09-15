using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;
using UnityEngine;
using System;


[Serializable]
public class Option
{
    public string optionName;
    public string optionValue;
    public UnityEvent optionEvent;
}

public class OptionMultiple : OptionBase
{
    [Space]
    public Option[] options;
    public int currentOption;

    public override void SetValue(int _value)
    {
        base.SetValue(_value);
        currentOption = _value;
        UpdateValue();
        Debug.Log("Set value: " + _value);
    }

    public override void SetValue(string _value)
    {
        base.SetValue(_value);
        for (int i = 0; i < options.Length; i++)
        {
            if (options[i].optionValue == _value)
            {
                currentOption = i;
                break;
            }
        }
        UpdateValue();
    }

    public override void Next()
    {
        base.Next();
        currentOption += 1;
        UpdateValue();

    }

    public override void Previous()
    {
        base.Previous();
        currentOption -= 1;
        UpdateValue();
    }

    //public override void UpdateValue()
    //{
    //    if (currentOption > options.Length - 1)
    //        currentOption = 0;
    //    else if (currentOption < 0)
    //        currentOption = options.Length - 1;

    //    options[currentOption].optionEvent?.Invoke();
    //    statusText.text = options[currentOption].optionName;
    //}

    public override void UpdateValue()
    {
        if (currentOption > options.Length - 1)
            currentOption = 0;
        else if (currentOption < 0)
            currentOption = options.Length - 1;

        options[currentOption].optionEvent?.Invoke();

        if (!useLocalization)
        {
            statusText.text = options[currentOption].optionName;
        }
        else
        {
            localizeString.SetTable("Anime Girls Sun of a Beach");
            localizeString.SetEntry(options[currentOption].optionName);
        }

    }
}
