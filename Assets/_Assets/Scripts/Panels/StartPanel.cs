using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using Michsky.LSS;
using HalvaStudio.Save;
using UnityEngine.Rendering;

public class StartPanel : Panel
{
    public bool directLoad;

    [Header("Buttons")]
    public Button startBtn;
    public Button characterBtn;
    //public Button controlBtn;
    public Button settingsBtn;
    public Button weaponBtn;
    public Button skillBtn;

    private bool isInitialized;

    private void OnEnable()
    {
        CameraManager.OnChangeCameraMode?.Invoke(CameraMode.Menu);
    }

    IEnumerator Start()
    {
        yield return new WaitUntil(() => CustomizeManager.Instance && CustomizeManager.Instance.currentCharacter);
        CustomizeManager.Instance.currentCharacter.GetComponent<Animator>().SetTrigger("SitDown");
        yield return new WaitForSeconds(1f);
        
        startBtn.onClick.AddListener(StartSelect);
        characterBtn.onClick.AddListener(CharacterSelect);
        //controlBtn.onClick.AddListener(ControlsSelect);
        settingsBtn.onClick.AddListener(SettingsSelect);
        weaponBtn.onClick.AddListener(WeaponSelect);
        skillBtn.onClick.AddListener(SkillsSelect);
        isInitialized = true;
    }


    private bool isLoading;
    public void StartSelect()
    {
        if (directLoad)
        {
            if (!isLoading)
            {
                isLoading = true;
                GameManager.Instance.totalPlayers = 1;
                GameManager.Instance.SetPlayerCharacter(CustomizeManager.Instance.characters[SaveManager.Instance.saveData.characterID]);
                LoadingScreen.LoadScene("GameScene");
            }
        }
        else
            PanelManager.OnGoToPanel?.Invoke(PanelName.LocationSelect.ToString());
    }

    public void CharacterSelect()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.Customize.ToString());
    }

    //public void ControlsSelect()
    //{
    //    PanelManager.OnGoToPanel?.Invoke(PanelName.Controls.ToString());
    //}

    public void SettingsSelect()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.Settings.ToString());
    }    
    public void WeaponSelect()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.Weapons.ToString());
    }
    public void SkillsSelect()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.Skills.ToString());
    }
}
