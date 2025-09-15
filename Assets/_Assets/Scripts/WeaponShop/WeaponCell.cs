using HalvaStudio.Save;
using TMPro;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;
using UnityEngine.EventSystems;

public class WeaponCell : MonoBehaviour
{
    public int id;
    [SerializeField] private TMP_Text weaponNameText;
    [SerializeField] private GameObject weaponLocked;
    [SerializeField] private GameObject weaponSelected;

    [SerializeField] private Sprite baseBG, selectedBG;
    
    public Image weaponIconImage;
    public TMP_Text weaponPrice;
    public Image selector;
    public Color baseColor;
    public Color enabledColor;
    //public Color selectedColor;
    public bool cellEnable;

    public void SetWeaponInfo(WeaponShopData weaponInfo)
    {
        if (weaponInfo == null || weaponNameText == null || weaponIconImage == null)
        {
            Debug.LogError("Missing references in WeaponCell.");
            return;
        }

        weaponNameText.text = weaponInfo.name;
        weaponIconImage.sprite = weaponInfo.icon;
        id = weaponInfo.id;
        UpdateButtonState();
    }

    public void UpdateButtonState()
    {
        weaponLocked.SetActive(!IsUnlocked());
        if (SaveManager.Instance.saveData.selectedAssaultID == id) weaponSelected.SetActive(true);
        else if(SaveManager.Instance.saveData.selectedPistolID == id) weaponSelected.SetActive(true);
        else weaponSelected.SetActive(false);

        if (cellEnable)
        {
            //selector.transform.DOScale(1.1f, 0.1f);
            weaponIconImage.DOFlip();
            SetEnableColor();
            WeaponsPanel.OnWeaponEnable?.Invoke(id);
        }
        else
        {
            //selector.transform.DOScale(1f, 0.1f);
            weaponIconImage.DOFlip();
            SetBasicColor();
        }
    }

    public bool IsUnlocked()
    {
        if (SaveManager.Instance.saveData.weaponUnlocked.ContainsKey(id)) return true;
        else return false;
    }
    #region SetColor
    public void SetBasicColor()
    {
        selector.sprite = baseBG;
        weaponNameText.color = baseColor;
        //selector.DOColor(baseColor,0.1f);
        //weaponSelected.GetComponent<Image>().DOColor(baseColor,0.1f);
        //weaponLocked.GetComponent<Image>().DOColor(baseColor,0.1f);
    }
    public void SetEnableColor()
    {
        selector.sprite = selectedBG;
        weaponNameText.color = enabledColor;
        //selector.DOColor(enabledColor, 0.1f);
        //weaponSelected.GetComponent<Image>().DOColor(enabledColor, 0.1f);
        //weaponLocked.GetComponent<Image>().DOColor(enabledColor, 0.1f);
    }
    //public void SetSelectedColor()
    //{
    //    selector.DOColor(selectedColor, 0.1f);
    //    weaponSelected.GetComponent<Image>().DOColor(selectedColor, 0.1f);
    //}
    #endregion

    private void OnDestroy()
    {
        transform.DOKill();
    }
}
