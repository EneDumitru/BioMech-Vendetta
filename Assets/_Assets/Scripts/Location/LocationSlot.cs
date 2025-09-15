using System;
using System.Collections;
using System.Collections.Generic;
using DG.Tweening;
using UnityEngine.EventSystems;
using HalvaStudio.Save;
using UnityEngine.UI;
using UnityEngine;
using TMPro;
using UnityEngine.Localization.SmartFormat.PersistentVariables;
using UnityEngine.Localization.Components;
using UnityEngine.Localization;

public class LocationSlot : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    public Image slotImage;
    public Image lockImage;
    public Image locationImage;
    public Image skullImage;
    [Space] public TMP_Text locationName;
    public TMP_Text locationSubtitle;
    public TMP_Text killCount;
    public TMP_Text level;
    public Button button;
    public CanvasGroup canvasGroup;

    [SerializeField] private Sprite basicBg, selectedBg;

    [Header("Animations")] 
    [SerializeField]
    private RectTransform smoke;
    [SerializeField]
    private RectTransform levelInfo;

    [SerializeField] private float _smokeY;

    private int slotID;
    private LevelData levelData;
    private bool isUnlocked;
    private bool isCompleted;
    private LocalizeStringEvent localizedSubtitle;
    private LocalizeStringEvent localizedLevel;
    public int levelId;

    private float _levelInfoY;

    public void SetID(int id) => levelId = id;

    private void Awake()
    {
        _levelInfoY = levelInfo.anchoredPosition.y;
    }

    public void SetupSlot(int _slotID, LevelData _levelData)
    {
        slotID = _slotID;
        levelData = _levelData;
        levelId = _levelData.level;
        button.onClick.AddListener(SelectLevel);
        localizedSubtitle = locationSubtitle.GetComponent<LocalizeStringEvent>();
        localizedLevel = locationSubtitle.GetComponent<LocalizeStringEvent>();
        localizedSubtitle.SetTable("Anime Girls Sun of a Beach");
        killCount.text = GetTotalKills(_levelData).ToString();
        level.text = levelData.level.ToString();
        locationName.text = levelData.locationSubtitle;

        UpdateSlot();
    }

    private int GetTotalKills(LevelData levelData)
    {
        int totalKills = 0;

        foreach (Wave wave in levelData.waves)
        {
            foreach (EnemySet set in wave.enemySets)
            {
                totalKills += set.count;
            }
        }

        return totalKills;
    }


    public void SetupState(SaveManager.LevelSaveData _levelData)
    {
        isUnlocked = _levelData.isUnlocked;
        lockImage.gameObject.SetActive(!isUnlocked);
        //lockImage.enabled = false;
        if (_levelData.isUnlocked)
            locationImage.material = null;
        //canvasGroup.alpha = isUnlocked ? 1f : 0.6f;
    }

    private void SelectLevel()
    {
        if (!isUnlocked) return;

        LevelManager.Instance.SelectLevel(slotID);
    }

    private void UpdateSlot()
    {
        locationImage.sprite = levelData.locationSprite;
        //locationName.text = "Day " + levelId;
        localizedSubtitle.SetEntry(levelData.locationSubtitle);
        //localizedLevel.RefreshString();
    }


    private void UpdateDetails()
    {
        LocationPanel.OnUpdateDetails?.Invoke(slotID, transform);
    }

    #region Navigation

    public void SetupNavigation(Button _previousButton, Button _nextButton)
    {
        Navigation newNavigation = new Navigation();
        newNavigation.mode = Navigation.Mode.Explicit;
        newNavigation.selectOnLeft = _previousButton;
        newNavigation.selectOnRight = _nextButton;
        button.navigation = newNavigation;
    }

    public void Select()
    {
        slotImage.sprite = selectedBg;
        LocationPanel.OnSlotSelected?.Invoke(slotID);
        smoke.DOAnchorPosY(_smokeY, 0.25f);
        levelInfo.DOAnchorPosY(0, 0.25f);
        AudioManager.Instance.Play("Tick");
        transform.DOScale(1.1f, 0.3f);
    }

    public void Deselect()
    {
        levelInfo.DOAnchorPosY(_levelInfoY, 0.25f);
        smoke.DOAnchorPosY(0, 0.25f);
        slotImage.sprite = basicBg;
        transform.DOScale(1f, 0.3f);
    }


    public void OnSelect(BaseEventData eventData)
    {
        Select();
        UpdateDetails();
    }

    public void OnDeselect(BaseEventData eventData)
    {
        Deselect();
    }

    #endregion
}