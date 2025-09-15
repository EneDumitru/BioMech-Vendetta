using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using DG.Tweening;
using System;
using UnityEngine.Localization.Components;

public class HUDPanel : Panel
{
    [Header("UI")]
    public TMP_Text waveText;
    public TMP_Text waveSubText;
    public TMP_Text zombieCount;
    public Image waveSplash;
    public Image waveLine;
    public Image waveIcon;
    public GameObject line;

    public static Action<bool, string, int, string> OnWaveAnnounce;
    public static Action<int> OnUpdateZombieCount;

    public LocalizeStringEvent localizeSubtitle;
    public LocalizeStringEvent localizeWave;
    public int currentLevel;


    private void Start()
    {
        localizeSubtitle = waveSubText.GetComponent<LocalizeStringEvent>();
        localizeWave = waveText.GetComponent<LocalizeStringEvent>();
        line.SetActive(GameManager.Instance.totalPlayers == 2);
        zombieCount.text = "?";

    }

    private void OnEnable()
    {
        OnWaveAnnounce += WaveAnnounce;
        OnUpdateZombieCount = UpdateUI;
        InputManager.Instance.playerInput.SwitchCurrentActionMap("Controller");
    }

    private void OnDisable()
    {
        OnWaveAnnounce -= WaveAnnounce;
        OnUpdateZombieCount = null;
    }

    private void UpdateUI(int zombiesToKill)
    {
        zombieCount.text = zombiesToKill.ToString();
    }


    private Color transparentColor = new Color(1f, 1f, 1f, 0f);

    private void WaveAnnounce(bool _state, string message = "" , int wave = 1, string submessage = "")
    {
        AudioManager.Instance.Play("Wave");
        if (_state)
        {
            currentLevel = wave;
            localizeWave.RefreshString();
            localizeSubtitle.SetTable("Anime Girls Sun of a Beach");
            localizeSubtitle.SetEntry(submessage);

            waveText.rectTransform.localScale = Vector3.one * 1.3f;
            waveText.color = transparentColor;
            waveSubText.color = transparentColor;

            waveText.enabled = true;
            waveSubText.enabled = true;

            Sequence waveAcnounce = DOTween.Sequence();
            waveAcnounce
                .Append(waveIcon.transform.DOScale(1f, 0.15f))
                .Insert(0.15f,waveLine.DOFillAmount(1f,0.15f))
                .Append(waveSplash.DOFillAmount(1f, 0.15f).OnComplete(() =>
                    {
                        //waveText.text = message + level;

                        //waveText.rectTransform.DOScale(1f, 0.3f);
                        waveText.DOColor(new Color32(231, 48, 5, 255), 0.3f);

                        //waveSubText.text = submessage;
                        waveSubText.DOColor(new Color32(133, 110,63, 255), 0.3f);
                    }));
        }
        else
        {
            waveSubText.DOColor(transparentColor, 0.3f);
             waveText.DOColor(transparentColor, 0.3f).OnComplete(() =>
             {
                 waveSplash.DOFillAmount(0f, 0.15f).OnComplete(() =>
                 {
                     waveText.enabled = false;
                     waveSubText.enabled = false;
                 });
                 waveLine.DOFillAmount(0f, 0.15f);
                 waveIcon.transform.DOScale(0f, 0.15f);
             });
        }
    }
}
