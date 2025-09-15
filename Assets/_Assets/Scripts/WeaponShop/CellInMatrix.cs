using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class CellInMatrix : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    [HideInInspector]public Button button;

    public WeaponTypes weaponType;
    public Image icon;
    public WeaponCell weaponCell;
    public void SetupCellInMatrix(WeaponTypes type)
    {
        weaponCell = GetComponent<WeaponCell>();
        weaponType = type;
        Deselect();
    }
    private void Awake()
    {
        button = GetComponent<Button>();
    }
    private void OnDisable()
    {
        Deselect();
    }

    public void SetupNavigation(Button _upButton, Button _downButton, Button _leftButton, Button _rightButton)
    {
        Navigation newNavigation = new Navigation();
        newNavigation.mode = Navigation.Mode.Explicit;
        newNavigation.selectOnUp = _upButton;
        newNavigation.selectOnDown = _downButton;
        newNavigation.selectOnLeft = _leftButton;
        newNavigation.selectOnRight = _rightButton;
        button.navigation = newNavigation;
    }

    public void EnableOption(bool _state)
    {
        AudioManager.Instance.Play("Tick");
        weaponCell.cellEnable = _state;
        weaponCell.UpdateButtonState();
    }
    public void Deselect()
    {
        EnableOption(false);
    }

    public void UpdateCell()
    {
        weaponCell.UpdateButtonState();
    }

    public void OnSelect(BaseEventData eventData)
    {
        EnableOption(true);
    }

    public void OnDeselect(BaseEventData eventData)
    {
        Deselect();
    }
}
