using _Assets.Scripts.Panels;
using DG.Tweening;
using HalvaStudio.Save;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

namespace _Assets.Scripts.SkillTree
{
    public class SkillCell : MonoBehaviour, ISelectHandler, IDeselectHandler
    {
        [SerializeField] private SkillData skillData;
        [SerializeField] private Image icon;
        [SerializeField] private Image basicCell;
        [SerializeField] private Vector2 selectedSize = new(66, 66);
        [SerializeField] private Vector2 basicSize = new(77, 77);
        [SerializeField] private Sprite selected, deselected;
        
        private bool _selected;

        public SkillData Data => skillData;

        private void UpdateButtonState()
        {
            if (_selected)
            {
                basicCell.sprite = selected;
                //basicCell.DOSizeDelta(selectedSize, 0.25f);
            }
            else
            {
                basicCell.sprite = deselected;
                //basicCell.DOSizeDelta(basicSize, 0.25f);
            }
        }

        public void SetLockedState(bool locked)
        {
            if (locked)
            {
                icon.sprite = skillData.LockedIcon;
            }
            else
            {
                
                icon.sprite = skillData.UnlockedIcon;
            }
        }

        public void OnSelect(BaseEventData eventData)
        {
            _selected = true;
            UpdateButtonState();
            SkillsPanel.OnUpdateDetails?.Invoke(this);
        }

        public void OnDeselect(BaseEventData eventData)
        {
            Deselect();
        }

        public void Deselect()
        {
            _selected = false;
            UpdateButtonState();
        }
    }
}