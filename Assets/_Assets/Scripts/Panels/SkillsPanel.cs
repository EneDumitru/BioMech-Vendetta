using System;
using System.Collections.Generic;
using _Assets.Scripts.SkillTree;
using HalvaStudio.Save;
using TMPro;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.InputSystem;
using UnityEngine.Localization.Components;
using UnityEngine.Localization.SmartFormat.PersistentVariables;
using UnityEngine.UI;

namespace _Assets.Scripts.Panels
{
    public class SkillsPanel : Panel
    {
        [SerializeField] private SkillCell[] _skillCells;
        [SerializeField] private TMP_Text infoTitle;
        [SerializeField] private TMP_Text costText;
        [SerializeField] private TMP_Text infoDescription;
        [SerializeField] private Image infoIcon;
        [SerializeField] private Button buy;
        [SerializeField] private TMP_Text buttonText;

        [Header("Player info")] [SerializeField]
        private TMP_Text currentSkillPoints;

        [SerializeField] private TMP_Text currentLevel;

        public static Action<SkillCell> OnUpdateDetails;

        private SkillCell _selectedCell;
        
        private LocalizeStringEvent localizedTitle;
        private LocalizeStringEvent localizedDescription; 
        private LocalizeStringEvent localizedButton; 

        private void OnEnable()
        {
            InputManager.Instance.playerInput.actions["Submit"].started += Buy;
            InputManager.Instance.playerInput.actions["Cancel"].started += GoBack;
            
            EventSystem.current.SetSelectedGameObject(_skillCells[0].gameObject, null);
            _skillCells[0].OnSelect(null);
            currentLevel.text = ExperienceSystem.Instance.currentLevel.ToString();
            UpdateSkillPoints();
        }

        private void OnDisable()
        {
            InputManager.Instance.playerInput.actions["Submit"].started -= Buy;
            InputManager.Instance.playerInput.actions["Cancel"].started -= GoBack;
        }

        private void GoBack(InputAction.CallbackContext callbackContext)
        {
            PanelManager.OnGoBack?.Invoke();
        }

        private void UpdateSkillPoints()
        {
            int currentPoints = SaveManager.Instance.saveData.skillPoints;

            currentSkillPoints.text = currentPoints.ToString();
            costText.color = currentPoints < _selectedCell.Data.Cost ? Color.red : Color.green;
        }

        private void Awake()
        {
            localizedTitle = infoTitle.GetComponent<LocalizeStringEvent>();
            localizedDescription = infoDescription.GetComponent<LocalizeStringEvent>();
            localizedButton = buttonText.GetComponent<LocalizeStringEvent>();
            
            OnUpdateDetails = ShowInfo;
            buy.onClick.AddListener(Buy);
            foreach (var cell in _skillCells)
            {
                cell.SetLockedState(!IsUnlocked(cell.Data.ID));
            }
        }

        private void Buy(InputAction.CallbackContext callbackContext)
        {
            Buy();
        }

        private void Buy()
        {
            if (_selectedCell.Data.PreviousRequiredSkill != null && !SaveManager.Instance.saveData.skillsUnlocked.ContainsKey(_selectedCell.Data.PreviousRequiredSkill.ID))
                return;
            
            if (SaveManager.Instance.saveData.skillPoints >= _selectedCell.Data.Cost)
            {
                SaveManager.Instance.saveData.skillPoints -= _selectedCell.Data.Cost;
                SaveManager.Instance.saveData.skillsUnlocked[_selectedCell.Data.ID] = true;
                SaveManager.Instance.Save();

                UpdateSkillPoints();
                _selectedCell.SetLockedState(false);
                ShowInfo(_selectedCell);
            }
        }

        private void ShowInfo(SkillCell cell)
        {
            _selectedCell = cell;
            infoIcon.sprite = cell.Data.UnlockedIcon;
            localizedTitle.SetEntry(cell.Data.TitleLocalizationKey);
            localizedDescription.SetEntry(cell.Data.DescriptionLocalizationKey);
            costText.text = cell.Data.Cost.ToString();
            
            var args = new Dictionary<string, object>
            {
                { "value", cell.Data.BonusValue }
            };

            localizedDescription.StringReference.Arguments = new object[] { args };
            localizedDescription.RefreshString();

            if (IsUnlocked(cell.Data.ID))
            {
                localizedButton.SetEntry("bought");
                buy.interactable = false;
            }
            else
            {
                buy.interactable = true;
                localizedButton.SetEntry("buy");
            }

        }

        private bool IsUnlocked(int id)
        {
            if (SaveManager.Instance.saveData.skillsUnlocked.ContainsKey(id))
                return true;

            return false;
        }
    }
}