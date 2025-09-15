using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Rendering;
using DG.Tweening;
using TMPro;

public class CustomButton : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    public GameObject selector;

    [SerializeField] private TMP_Text text;
    [SerializeField] private Color baseColor;
    [SerializeField] private Color selectedColor;
    private Button _button;

    [HideInInspector]
    public Button button
    {
        get
        {
            if (!_button) _button = GetComponent<Button>();
            return _button;
        }
    }

    public void Setup()
    {
        DeactivateSelector();
    }

    private void OnDisable()
    {
        DeactivateSelector();
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
        if (selector)
        {
            selector.transform.DOKill();
            //selector.gameObject.SetActive(true);
            selector.transform.DOScale(1, 0.2f).SetUpdate(true);
            if (text)
                text.DOColor(selectedColor, 0.2f).SetUpdate(true);
        }

        AudioManager.Instance.Play("Tick");
    }

    public void Deselect()
    {
        if (selector)
        {
            selector.transform.DOKill();
            selector.transform.DOScale(0f, 0.2f).SetUpdate(true);
            if (text)
                text.DOColor(baseColor, 0.2f).SetUpdate(true);
            //Invoke(nameof(DeactivateSelector), 0.2f);
        }
    }

    public void DeactivateSelector()
    {
        selector.transform.DOScale(0f, 0f).SetUpdate(true);
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