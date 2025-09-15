using DG.Tweening;
using HalvaStudio.Save;
using System;
using System.Collections;
using System.Collections.Generic;
using _Assets.Scripts.Animations;
using TMPro;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityEngine.Localization.Components;
using UnityEngine.UI;

public class CustomizePanel : Panel
{
    [Header("Stats")] public Image healthFill;
    public Image staminaFill;
    public Image speedFill;
    [Space] public TMP_Text healthValue;
    public TMP_Text staminaValue;
    public TMP_Text speedValue;

    [Header("Other")] public TMP_Text girlName;
    public TMP_Text girlNameOutlain;
    public GameObject conditionToUnlock;
    public TMP_Text conditionToUnlockTxt;
    public TMP_Text lvl;

    public Image lvlSlide;

    //public TMP_Text girlPriceText;
    public LocalizeStringEvent localizedNecessaryLevel;
    public int necessaryLevel;

    [Header("Characters")] public GameObject[] characters;
    private int chosingCharacterIndex;
    private List<int> character = new();

    [Header("Auto Scroll")] [SerializeField]
    private ScrollRect scrollRect;

    private RectTransform _content;
    private RectTransform _viewport;
    private Tweener _scrollTween;


    public static Action OnSelectUpdate;
    private bool isInitialized;
    private PlayerInput playerInput;

    private void Awake()
    {
        _content = scrollRect.content;
        _viewport = scrollRect.viewport;
    }

    private void OnEnable()
    {
        CameraManager.OnChangeCameraMode?.Invoke(CameraMode.Customize);
        UpdateUI();
        CustomizeManager.OnCharacterSpawn += UpdateUI;
        OnSelectUpdate = SelectUpdate;

        if (isInitialized)
        {
            SetActions();
            CustomizeManager.Instance.SetCustomizeRotation(true);
            CustomizeManager.Instance.currentCharacter.GetComponent<Animator>().SetTrigger("StandUp");
            CustomizeManager.Instance.currentCharacter.GetComponent<IdleRandomizer>().ChangeState(true);
        }
    }

    private void OnDisable()
    {
        ResetIcon();
        CustomizeManager.OnCharacterSpawn -= UpdateUI;
        OnSelectUpdate = null;
        RemoveActions();
        CustomizeManager.Instance.SetCustomizeRotation(false);
        CustomizeManager.Instance.currentCharacter.GetComponent<IdleRandomizer>().ChangeState(false);
        CustomizeManager.Instance.currentCharacter.GetComponent<Animator>().SetTrigger("SitDown");
    }


    IEnumerator Start()
    {
        yield return new WaitUntil(() => InputManager.Instance != null);

        Init();
        lvl.text = ExperienceSystem.Instance.currentLevel.ToString();
        lvlSlide.fillAmount = ExperienceSystem.Instance.GetCurrentXpPercent();
        playerInput = InputManager.Instance.playerInput;
        isInitialized = true;

        SetActions();
        CustomizeManager.Instance.SetCustomizeRotation(true);
        CustomizeManager.Instance.currentCharacter.GetComponent<Animator>().SetTrigger("StandUp");
        CustomizeManager.Instance.currentCharacter.GetComponent<IdleRandomizer>().ChangeState(true);
    }

    private void SetActions()
    {
        playerInput.actions["Navigate"].started += PlayerSelector_started;
        playerInput.actions["Submit"].started += Submit_Started;
        playerInput.actions["Cancel"].started += GoBack_Started;
    }

    private void RemoveActions()
    {
        playerInput.actions["Navigate"].started -= PlayerSelector_started;
        playerInput.actions["Submit"].started -= Submit_Started;
        playerInput.actions["Cancel"].started -= GoBack_Started;
    }

    private void Submit_Started(InputAction.CallbackContext obj)
    {
        if (CheckIfCharacterUnlocked(playerInput.playerIndex))
        {
            CustomizeManager.Instance.Save();
            AudioManager.Instance.Play("Change");
            OnSelectUpdate?.Invoke();
        }
    }

    private void GoBack_Started(InputAction.CallbackContext obj)
    {
        CustomizeManager.Instance.SpawnSaved();
        PanelManager.OnGoBack?.Invoke();
    }


    private bool CheckIfCharacterUnlocked(int playerID)
    {
        if (playerID == 0)
        {
            if (SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(CustomizeManager.Instance.characterID))
            {
                return SaveManager.Instance.saveData.charactersUnlocked[CustomizeManager.Instance.characterID];
            }
        }

        return false;
    }


    private void PlayerSelector_started(InputAction.CallbackContext obj)
    {
        if (obj.ReadValue<Vector2>().y == -1f)
        {
            CustomizeManager.Instance.Next();
            AudioManager.Instance.Play("Tick");
        }
        else if (obj.ReadValue<Vector2>().y == 1f)
        {
            CustomizeManager.Instance.Previous();
            AudioManager.Instance.Play("Tick");
        }
    }

    public void SelectUpdate()
    {
        Select();
    }

    private void Init()
    {
        localizedNecessaryLevel = conditionToUnlockTxt.GetComponent<LocalizeStringEvent>();
        character = new(SaveManager.Instance.saveData.charactersUnlocked.Keys);
        ResetSelect();
    }


    private void Select()
    {
        int charID = CustomizeManager.Instance.characterID;

        if (SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(charID))
        {
            if (SaveManager.Instance.saveData.charactersUnlocked[charID])
            {
                CustomizeManager.Instance.Save();
                AudioManager.Instance.Play("Click");
                UpdateUI();
                ResetSelect();
            }
        }
    }

    private void UpdateUI()
    {
        //Debug.LogError("On Character Spawn!");

        int charID = CustomizeManager.Instance.characterID;

        if (girlName) girlName.text = CustomizeManager.Instance.characters[CustomizeManager.Instance.characterID].girlName;
        if (girlNameOutlain) girlNameOutlain.text = CustomizeManager.Instance.characters[CustomizeManager.Instance.characterID].girlName;
        //if (girlPriceText) girlPriceText.text = CustomizeManager.Instance.characters[CustomizeManager.Instance.player1CurrentID].girlPrice + "$";

        if (healthFill) healthFill.fillAmount = CustomizeManager.Instance.characters[charID].health / 200f;
        if (staminaFill) staminaFill.fillAmount = CustomizeManager.Instance.characters[charID].stamina / 300f;
        if (speedFill) speedFill.fillAmount = CustomizeManager.Instance.characters[charID].speed / 100f;

        if (healthValue) healthValue.text = CustomizeManager.Instance.characters[charID].health.ToString("F0");
        if (staminaValue) staminaValue.text = CustomizeManager.Instance.characters[charID].stamina.ToString("F0");
        if (speedValue) speedValue.text = CustomizeManager.Instance.characters[charID].speed.ToString("F0");

        if (characters[charID])
        {
            UpdateSkinSlot(chosingCharacterIndex);
            ResetIcon();
            chosingCharacterIndex = charID;
            //characters[chosingCharacterIndex].GetComponent<RectTransform>().DOSizeDelta(new Vector2(155, 155), 0.3f);

            //characters[chosingCharacterIndex].GetComponent<Image>().color = new Color32(246, 242, 213, 255);
            characters[chosingCharacterIndex].GetComponent<SkinSlot>().SetHighlightedUI(true);
            ScrollTo(characters[chosingCharacterIndex].GetComponent<RectTransform>());
        }

        UpdateSkinSlot(chosingCharacterIndex);
        CustomizeManager.Instance.currentCharacter.GetComponent<IdleRandomizer>().ChangeState(true);
    }

    private void UpdateSkinSlot(int charID)
    {
        if (SaveManager.Instance.saveData.charactersUnlocked.ContainsKey(charID) && characters[charID])
        {
            characters[charID].GetComponent<SkinSlot>().SetUnlockedUI();
            characters[charID].GetComponent<SkinSlot>() .SetSelectedUI(SaveManager.Instance.saveData.characterID == charID);
            conditionToUnlock.SetActive(false);
        }
        else
        {
            conditionToUnlock.SetActive(true);
            //conditionToUnlockTxt.text = "Reach level " + CustomizeManager.Instance.characters[CustomizeManager.Instance.player1CurrentID].girlNecessaryLevel + " to unlock";
            UpdateNecessaryLevel();
            if (localizedNecessaryLevel) localizedNecessaryLevel.RefreshString();
        }
    }

    public void ScrollTo(RectTransform target)
    {
        if (!target) return;

        Canvas.ForceUpdateCanvases(); // Ensure layout is up-to-date

        // Calculate offset from target to viewport center
        Vector2 targetPos = _viewport.InverseTransformPoint(target.position);
        Vector2 viewportCenter = _viewport.rect.center;
        float offset = targetPos.y - viewportCenter.y;

        // Apply offset to content position
        Vector3 newContentPos = _content.localPosition;
        newContentPos.y -= offset; // ✅ corrected scroll direction

        // Tween content position smoothly
        _scrollTween?.Kill();
        _scrollTween = _content.DOLocalMove(newContentPos, 0.3f)
            .SetEase(Ease.Linear);
    }


    private void UpdateNecessaryLevel()
    {
        necessaryLevel = CustomizeManager.Instance.characters[CustomizeManager.Instance.characterID]
            .girlNecessaryLevel;
    }

    private void ResetIcon()
    {
        if (characters[chosingCharacterIndex])
        {
            //characters[chosingCharacterIndex].GetComponent<RectTransform>().DOSizeDelta(new Vector2(110, 110), 0.3f);
            //characters[chosingCharacterIndex].GetComponent<Image>().color = new Color32(1, 97, 127, 255);
            characters[chosingCharacterIndex].GetComponent<SkinSlot>().SetHighlightedUI(false);
            ScrollTo(characters[chosingCharacterIndex].GetComponent<RectTransform>());
        }
    }

    private void ResetSelect()
    {
        foreach (int index in character)
        {
            UpdateSkinSlot(index);
        }
    }
}