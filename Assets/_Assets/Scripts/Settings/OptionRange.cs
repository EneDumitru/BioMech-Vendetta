using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;
using UnityEngine;

public class OptionRange : OptionBase
{
    [Space]
    public int step;
    public int currentValue;
    public int minValue;

    public UnityEvent<int> optionEvent;

    public override void SetValue(int _value)
    {
        base.SetValue(_value);
        currentValue = _value;
        UpdateValue();
    }

    public override void Next()
    {
        base.Next();
        currentValue += step;
        UpdateValue();
    }

    public override void Previous()
    {
        base.Previous();
        currentValue -= step;
        UpdateValue();
    }

    public override void UpdateValue()
    {
        if (optionEnabled)
        {
            if (currentValue >= 100)
            {
                currentValue = 100;
                rightArrow.gameObject.SetActive(false);
                leftArrow.gameObject.SetActive(true);
            }
            else if (currentValue <= minValue)
            {
                currentValue = minValue;
                rightArrow.gameObject.SetActive(true);
                leftArrow.gameObject.SetActive(false);
            }
            else
            {

                rightArrow.gameObject.SetActive(true);
                leftArrow.gameObject.SetActive(true);
            }
        }

        optionEvent?.Invoke(currentValue);
        statusText.text = currentValue.ToString();
    }
}
