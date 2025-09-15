using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SkinSlot : MonoBehaviour
{
    [SerializeField] private GameObject lockIcon;
    [SerializeField] private GameObject selectedIcon;
    [SerializeField] private Image playerIcon;
    [SerializeField] private Sprite basicCell, selectedCell;
    [SerializeField] private Image _image;

    public void SetUnlockedUI()
    {
        playerIcon.color = Color.white;
        lockIcon.SetActive(false);
    }

    public void SetHighlightedUI(bool isHighlighted)
    {
        _image.sprite = isHighlighted ? selectedCell : basicCell;   
    }
    
    public void SetSelectedUI(bool isSelected)
    {
        selectedIcon.SetActive(isSelected);
    }
}