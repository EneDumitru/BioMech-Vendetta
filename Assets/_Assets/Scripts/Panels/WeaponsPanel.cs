using HalvaStudio.Save;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine.UI;
using UnityEngine;
using DG.Tweening;
using System;
using _Assets.Scripts.WeaponShop;
using Invector.vShooter;
using UnityEngine.EventSystems;

public class WeaponsPanel : Panel
{
    [SerializeField] private Transform spawnPoint;
    [SerializeField] private Transform weaponsParent;
    [SerializeField] private GameObject cellPrefab;
    [SerializeField] private TMP_Text currentMoney;
    [SerializeField] private WeaponShopData[] weaponInfos;
    [SerializeField] private Sprite equippedBasic, equippedSelected;
    [SerializeField] private Stat damage, speed, recoil;
    private List<CellInMatrix> weaponMatrix = new List<CellInMatrix>();

    private GameObject spawnedWeapon;
    private int numberOfWeaponTypes;
    private int currentSlot = 0;
    public WeaponCategorySlot[] categorySlots;
    public WeaponCategorySlot[] categoryTypeSlots;

    public static Action<int> OnWeaponEnable;

    [System.Serializable]
    public class WeaponCategorySlot
    {
        public WeaponTypes weaponType;
        public Image weaponIcon;
        public Image slotImage;
    }

    public WeaponTypes currentCategory;

    private void Awake()
    {
        OnWeaponEnable = SpawnWeapon;
        numberOfWeaponTypes = categorySlots.Length;
        currentCategory = (WeaponTypes)0;

        //UpdateUI((int)currentCategory);
    }


    private void OnEnable()
    {
        SetEvents();
        CustomizeManager.Instance.CharacterState(false);
        UpdateUI((int)currentCategory);
        CameraManager.OnChangeCameraMode?.Invoke(CameraMode.Weapons);
    }

    private void OnDisable()
    {
        RemoveEvents();
        Destroy(spawnedWeapon);

        CustomizeManager.Instance.CharacterState(true);
    }

    private void SetEvents()
    {
        InputManager.Instance.playerInput.actions["Next"].started += NextCategory;
        InputManager.Instance.playerInput.actions["NextSlot"].started += NextSlot;
        InputManager.Instance.playerInput.actions["Previous"].started += PreviousCategory;
        InputManager.Instance.playerInput.actions["PreviousSlot"].started += PreviousSlot;
        InputManager.Instance.playerInput.actions["Cancel"].started += GoBack_Started;
    }

    private void RemoveEvents()
    {
        InputManager.Instance.playerInput.actions["Next"].started -= NextCategory;
        InputManager.Instance.playerInput.actions["NextSlot"].started -= NextSlot;
        InputManager.Instance.playerInput.actions["Previous"].started -= PreviousCategory;
        InputManager.Instance.playerInput.actions["PreviousSlot"].started -= PreviousSlot;
        InputManager.Instance.playerInput.actions["Cancel"].started -= GoBack_Started;
    }

    private void NextSlot(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        //currentSlot++;
        //if (currentSlot >= categoryTypeSlots.Length)
        currentSlot = 1;
        UpdateCategoryTypeUI();
    }

    private void PreviousSlot(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        //currentSlot--;
        //if (currentSlot < 0)
        //    currentSlot = categoryTypeSlots.Length - 1;

        currentSlot = 0;
        UpdateCategoryTypeUI();
    }

    private void GoBack_Started(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        CustomizeManager.Instance.currentCharacter.SetActive(true);
        PanelManager.OnGoBack?.Invoke();
    }

    private void NextCategory(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        int oldCategory = (int)currentCategory;
        currentCategory += 1;
        if ((int)currentCategory == numberOfWeaponTypes)
        {
            currentCategory = 0;
        }

        UpdateUI((int)currentCategory, oldCategory);
    }

    private void PreviousCategory(UnityEngine.InputSystem.InputAction.CallbackContext obj)
    {
        int oldCategory = (int)currentCategory;
        currentCategory -= 1;
        if ((int)currentCategory == -1)
        {
            currentCategory = (WeaponTypes)(numberOfWeaponTypes - 1);
        }

        UpdateUI((int)currentCategory, oldCategory);
    }

    public void SelectItem(WeaponCell weaponCell)
    {
        int selectedID = weaponCell.id;
        
        int otherSlotIndex = currentSlot == 0 ? 1 : 0;
        int otherSlotID = (otherSlotIndex == 0)
            ? SaveManager.Instance.saveData.selectedPistolID
            : SaveManager.Instance.saveData.selectedAssaultID;

        if (selectedID == otherSlotID)
        {
            return;
        }

        if (currentSlot == 0)
            SaveManager.Instance.saveData.selectedPistolID = selectedID;
        else
            SaveManager.Instance.saveData.selectedAssaultID = selectedID;

        SaveManager.Instance.Save();

        foreach (CellInMatrix cell in weaponMatrix)
            cell.UpdateCell();

        categoryTypeSlots[currentSlot].weaponIcon.sprite = weaponCell.weaponIconImage.sprite;

        AudioManager.Instance.Play("Ammo");
    }

    public void SpawnWeapon(int id)
    {
        if (spawnedWeapon) Destroy(spawnedWeapon);

        for (int i = 0; i < weaponInfos.Length; i++)
        {
            if (weaponInfos[i].id == id)
            {
                spawnedWeapon = Instantiate(weaponInfos[i].prefab, spawnPoint.position, spawnPoint.rotation,
                    spawnPoint);
                
                ShowStats(weaponInfos[i].gamePrefab);
            }
        }
    }

    private void ShowStats(vShooterWeapon weapon)
    {
        if (weapon)
        {
            speed.SetData(weapon.shootFrequency);
            damage.SetData((weapon.minDamage+weapon.maxDamage)/2f);
            recoil.SetData(weapon.recoilUp);
        }
    }

    #region UI

    private void UpdateUI(int currentCategoryIndex)
    {
        foreach (WeaponCategorySlot slot in categorySlots)
        {
            slot.weaponIcon.DOFade(0.3f, 0);
            slot.weaponIcon.transform.DOScale(0.8f, 0);
            slot.slotImage.transform.DOScale(0, 0);
        }

        categorySlots[currentCategoryIndex].weaponIcon.DOFade(1, 0.2f);
        categorySlots[currentCategoryIndex].slotImage.transform.DOScale(1, 0.2f);
        currentMoney.text = SaveManager.Instance.saveData.money.ToString();

        foreach (WeaponShopData weaponInfo in weaponInfos)
        {
            if (weaponInfo.id == SaveManager.Instance.saveData.selectedPistolID)
            {
                categoryTypeSlots[0].weaponIcon.sprite = weaponInfo.icon;
            }
            else if (weaponInfo.id == SaveManager.Instance.saveData.selectedAssaultID)
            {
                categoryTypeSlots[1].weaponIcon.sprite = weaponInfo.icon;
            }
        }

        SpawnWeaponCells(currentCategory);
        UpdateCategoryTypeUI();
    }

    private void UpdateUI(int currentCategoryIndex, int previousCategory)
    {
        categorySlots[currentCategoryIndex].weaponIcon.DOFade(1, 0.2f);
        categorySlots[currentCategoryIndex].weaponIcon.transform.DOScale(1, 0.2f);
        categorySlots[currentCategoryIndex].slotImage.transform.DOScale(1, 0.2f);

        categorySlots[previousCategory].weaponIcon.DOFade(0.3f, 0.2f);
        categorySlots[previousCategory].weaponIcon.transform.DOScale(0.8f, 0.2f);
        categorySlots[previousCategory].slotImage.transform.DOScale(0, 0.2f);

        currentMoney.text = SaveManager.Instance.saveData.money.ToString();
        SpawnWeaponCells(currentCategory);
        UpdateCategoryTypeUI();
    }

    private void UpdateCategoryTypeUI()
    {
        for (int i = 0; i < categoryTypeSlots.Length; i++)
        {
            categoryTypeSlots[i].slotImage.sprite = (i == currentSlot) ? equippedSelected : equippedBasic;
            categoryTypeSlots[i].weaponIcon.DOFade((i == currentSlot) ? 1f : 0.2f, 0.2f);
        }
    }

    #endregion

    #region Buy item

    public void TryBuyItem(WeaponShopData item, WeaponCell weaponCell)
    {
        if (TrySpendMoney(item.price))
        {
            BoughtItem(item);
            weaponCell.UpdateButtonState();
            weaponCell.GetComponent<Button>().onClick.RemoveAllListeners();
            weaponCell.GetComponent<Button>().onClick.AddListener(() => SelectItem(weaponCell));
            currentMoney.text = SaveManager.Instance.saveData.money.ToString();
            SelectItem(weaponCell);
            currentMoney.DOKill();
            currentMoney.color = Color.green;
            currentMoney.DOColor(Color.white, 1f);
            AudioManager.Instance.Play("Buy");
            Debug.Log("buy");
        }
        else
        {
            AudioManager.Instance.Play("Wrong");
            currentMoney.DOKill();
            currentMoney.color = Color.red;
            currentMoney.DOColor(Color.white, 1f);
            Debug.Log("can't buy");
        }
    }

    private bool TrySpendMoney(int spendMoneyAmount)
    {
        if (SaveManager.Instance.saveData.money >= spendMoneyAmount)
        {
            SaveManager.Instance.saveData.money -= spendMoneyAmount;
            SaveManager.Instance.Save();
            return true;
        }
        else return false;
    }

    private void BoughtItem(WeaponShopData itemInfo)
    {
        SaveManager.Instance.saveData.weaponUnlocked[itemInfo.id] = true;
        SaveManager.Instance.Save();
    }

    #endregion

    #region Spawn Cells

    public void SpawnWeaponCells(WeaponTypes weaponTypes)
    {
        if (weaponsParent == null || cellPrefab == null || weaponInfos == null)
        {
            Debug.LogError("Missing references in ShopManager.");
            return;
        }

        ClearSpawnedObjects();
        weaponMatrix.Clear();

        foreach (WeaponShopData weaponInfo in weaponInfos)
        {
            if (weaponInfo != null && weaponInfo.type == weaponTypes)
            {
                GameObject cell = Instantiate(cellPrefab, weaponsParent);
                WeaponCell weaponCell = cell.GetComponent<WeaponCell>();

                if (weaponCell != null)
                {
                    weaponCell.SetWeaponInfo(weaponInfo);

                    if (weaponCell.IsUnlocked())
                    {
                        weaponCell.GetComponent<Button>().onClick.AddListener(() => SelectItem(weaponCell));
                    }
                    else
                    {
                        weaponCell.weaponPrice.text = weaponInfo.price.ToString();
                        weaponCell.GetComponent<Button>().onClick.AddListener(() => TryBuyItem(weaponInfo, weaponCell));
                    }

                    weaponMatrix.Add(cell.GetComponent<CellInMatrix>());
                }
            }
        }

        SetupMatrix();

        void ClearSpawnedObjects()
        {
            foreach (Transform child in weaponsParent)
            {
                Destroy(child.gameObject);
            }
        }
    }

    private void SetupMatrix()
    {
        int maxCols = 3;
        int rowCount = (weaponMatrix.Count + maxCols - 1) / maxCols;

        for (int row = 0; row < rowCount; row++)
        {
            for (int col = 0; col < maxCols; col++)
            {
                int index = row * maxCols + col;
                if (index < weaponMatrix.Count)
                {
                    weaponMatrix[index].SetupCellInMatrix(currentCategory);
                }
            }
        }

        EventSystem.current.SetSelectedGameObject(weaponMatrix[0].gameObject, null);
        for (int row = 0; row < rowCount; row++)
        {
            for (int col = 0; col < maxCols; col++)
            {
                int index = row * maxCols + col;
                if (index < weaponMatrix.Count)
                {
                    Button upButton = (row > 0) ? weaponMatrix[(row - 1) * maxCols + col].button : null;
                    Button downButton = (row < rowCount - 1 && weaponMatrix.Count > ((row + 1) * maxCols + col))
                        ? weaponMatrix[(row + 1) * maxCols + col].button
                        : null;
                    Button leftButton = (col > 0) ? weaponMatrix[row * maxCols + col - 1].button : null;
                    Button rightButton = (col < maxCols - 1 && weaponMatrix.Count > (row * maxCols + col + 1))
                        ? weaponMatrix[row * maxCols + col + 1].button
                        : null;

                    weaponMatrix[index].SetupNavigation(upButton, downButton, leftButton, rightButton);
                }
            }
        }
    }

    #endregion
}