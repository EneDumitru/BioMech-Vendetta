using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using UnityEngine.EventSystems;

public class SettingsRow : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    public SettingsType settingsType;
    public Image icon;
    public TMP_Text nameText;
    public Image line;

    public Button button;
    //[Space]
    //public Image statusImage;
    //public Sprite statusOutline;
    //public Sprite statusDefault;

    [SerializeField] private Image selector;

    public OptionBase optionBase;

    private Color _topColor, _botColor;

    public void SetupRow()
    {
        if (nameText.enableVertexGradient)
        {
            _topColor = nameText.colorGradient.topLeft;
            _botColor = nameText.colorGradient.bottomLeft;
        }

        optionBase = GetComponent<OptionBase>();
        Deselect();
    }

    private void OnDisable()
    {
        Deselect();
    }

    public void SetupNavigation(Button _previousButton, Button _nextButton)
    {
        Navigation newNavigation = new Navigation();
        newNavigation.mode = Navigation.Mode.Explicit;
        newNavigation.selectOnUp = _previousButton;
        newNavigation.selectOnDown = _nextButton;
        button.navigation = newNavigation;
    }

    public void Select()
    {
        //line.color = ;
        //statusImage.sprite = statusOutline;
        optionBase.EnableOption(true);
        AudioManager.Instance.Play("Tick");
        optionBase.UpdateValue();
        selector.enabled = true;
        if (nameText)
        {
            nameText.color = optionBase.enabledColor;
        }
    }

    public void Deselect()
    {
        //line.enabled = false;
        //statusImage.sprite = statusDefault;
        optionBase.EnableOption(false);
        selector.enabled = false;
        if (nameText)
        {
            if (nameText.enableVertexGradient)
            {
                nameText.color = Color.white;
                nameText.colorGradient = new VertexGradient(_topColor, _topColor, _botColor, _botColor);
            }
            else
            {
                nameText.color = optionBase.disabledColor;
            }
        }
    }

    public void OnSelect(BaseEventData eventData)
    {
        Select();
    }

    public void OnDeselect(BaseEventData eventData)
    {
        Deselect();
    }
}