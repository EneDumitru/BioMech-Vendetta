using System.Collections.Generic;
using UnityEngine.EventSystems;
using System.Collections;
using HalvaStudio.Save;
using UnityEngine.UI;
using UnityEngine;
using System;
using System.Linq;
using TMPro;
using UnityEngine.InputSystem;
using UnityEngine.Localization.Components;
using DG.Tweening;

public class LocationPanel : Panel
{
    [Header("Main")]
    public LocationSlot slotPrefab;
    public Transform content;
    public Image locationImage;
    public List<LocationSlot> slots = new List<LocationSlot>();

    [Header("Details")] 
    public RectTransform detailsPanel;
    public TMP_Text locationName;
    public TMP_Text locationSubtitle;

    public TMP_Text totalKills;
    public TMP_Text xpReward;
    public TMP_Text moneyReward;

    [Header("Lerp")]
    public ScrollRect scrollView;
    public float scrollDuration = 0.5f;

    private GameObject lastObject;
    private bool isInitialized;
    private PlayerInput playerInput;

    public LocalizeStringEvent localizeString;

    public static Action<int> OnSlotSelected;
    public static Action<int, Transform> OnUpdateDetails;

    public override void Initialize()
    {
        Init();
    }

    IEnumerator Start()
    {
        yield return new WaitUntil(() => InputManager.Instance != null);
        playerInput = InputManager.Instance.playerInput;
        
        localizeString = locationSubtitle.GetComponent<LocalizeStringEvent>();
        localizeString.SetTable("Anime Girls Sun of a Beach");
        lastObject = slots[0].button.gameObject;
        EventSystem.current.SetSelectedGameObject(lastObject);
        lastObject.GetComponent<LocationSlot>().Select();
        isInitialized = true;
        SetActions();
        SetupNavigation();
        UpdateDetails(0, slots[0].transform);
    }

    private void OnEnable()
    {
        OnSlotSelected = SlotSelected;
        OnUpdateDetails = UpdateDetails;
        //CustomizeManager.Instance.currentCharacter.SetActive(false);

        if (isInitialized)
        {
            SetActions();
            EventSystem.current.SetSelectedGameObject(lastObject);
            lastObject.GetComponent<LocationSlot>().Select();
        }
    }

    private void SetActions()
    {
        playerInput.actions["Cancel"].started += GoBack_Started;
    }

    private void RemoveActions()
    {
        playerInput.actions["Cancel"].started -= GoBack_Started;
    }
    
    private void GoBack_Started(InputAction.CallbackContext obj)
    {
        PanelManager.OnGoBack?.Invoke();
    }
    
    private void OnDisable()
    {
        OnSlotSelected = null;
        OnUpdateDetails = null;
        
        RemoveActions();

        if (EventSystem.current)
        {
            if (EventSystem.current.currentSelectedGameObject)
            {
                lastObject = EventSystem.current.currentSelectedGameObject;
                lastObject.GetComponent<LocationSlot>().Deselect();
            }
        }
    }

    private void Init()
    {

        for (int i = 0; i < LevelManager.Instance.levelData.Length; i++)
        {
            slots.Add(Instantiate(slotPrefab, content));
            slots[i].SetupSlot(i, LevelManager.Instance.levelData[i]);
            slots[i].SetupState(SaveManager.Instance.saveData.levelsData[i]);
        }
    }

    private void UpdateDetails(int _slotID, Transform slotTR)
    {
        string subtitle = LevelManager.Instance.levelData[_slotID].locationSubtitle;
        localizeString.SetEntry(subtitle);

        //locationName.text = text;
        locationImage.sprite = LevelManager.Instance.levelData[_slotID].locationSprite;

        totalKills.text = LevelManager.Instance.levelData[_slotID].GetTotalKills().ToString();
        xpReward.text = LevelManager.Instance.levelData[_slotID].rewardXp.ToString();
        moneyReward.text = LevelManager.Instance.levelData[_slotID].rewardMoney.ToString();

        detailsPanel.SetParent(slotTR);
        detailsPanel.anchoredPosition = Vector2.zero;
        detailsPanel.localScale = Vector3.one;
        detailsPanel.gameObject.SetActive(true);
        
        detailsPanel.anchorMin = new Vector2(0f, 0f); // Bottom anchor at 0 (bottom of parent)
        detailsPanel.anchorMax = new Vector2(1f, 0f); // Top anchor at 0 (bottom of parent)

// Set left and right to 0
        detailsPanel.offsetMin = new Vector2(0, detailsPanel.offsetMin.y); // Left
        detailsPanel.offsetMax = new Vector2(0, detailsPanel.offsetMax.y); // Right

        

        string FormatTime(float totalSeconds)
        {
            TimeSpan timeSpan = TimeSpan.FromSeconds(totalSeconds);

            if (timeSpan.TotalHours >= 1)
            {
                return string.Format("{0:D2}:{1:D2}:{2:D2}", timeSpan.Hours, timeSpan.Minutes, timeSpan.Seconds);
            }
            else
            {
                return string.Format("{0:D2}:{1:D2}", timeSpan.Minutes, timeSpan.Seconds);
            }
        }
    }

    private void SetupNavigation()
    {
        int count = slots.Count;

        for (int i = 0; i < count; i++)
        {
            if (i == 0)
            {
                slots[i].SetupNavigation(null, slots[i + 1].button);
            }
            else if (i > 0 && i < count - 1)
            {
                slots[i].SetupNavigation(slots[i - 1].button, slots[i + 1].button);
            }
            else
            {
                slots[i].SetupNavigation(slots[i - 1].button, null);
            }
        }
    }

    #region Lerp Scroll Bar Horizontal
    int selectedID;
    private void SlotSelected(int _slotID)
    {
        selectedID = _slotID;
        float targetScrollPos = CalculateTargetScrollPositionHorizontal();
        StartCoroutine(LerpScrollBarCoroutineHorizontal(targetScrollPos));
        //Debug.Log("Target Scroll Pos: " + targetScrollPos);
    }

    private float CalculateTargetScrollPositionHorizontal()
    {
        float targetPosition = 0f;
        for (int i = 0; i < selectedID; i++)
        {
            targetPosition += slots[i].button.image.rectTransform.rect.width;
        }

        float scrollWidth = scrollView.content.rect.width - scrollView.viewport.rect.width;
        targetPosition /= scrollWidth;

        targetPosition = Mathf.Clamp01(targetPosition);

        return targetPosition;
    }

    IEnumerator LerpScrollBarCoroutineHorizontal(float targetScrollPos)
    {
        float startTime = Time.time;
        float startScrollPos = scrollView.horizontalNormalizedPosition;

        while (Time.time - startTime < scrollDuration)
        {
            float t = (Time.time - startTime) / scrollDuration;
            float lerpedScrollPos = Mathf.Lerp(startScrollPos, targetScrollPos, t);
            scrollView.horizontalNormalizedPosition = lerpedScrollPos;
            yield return null;
        }

        scrollView.horizontalNormalizedPosition = targetScrollPos;
    }
    #endregion
}
