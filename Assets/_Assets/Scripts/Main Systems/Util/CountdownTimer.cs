using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using TMPro;

public class CountdownTimer : MonoBehaviour
{
    public TMP_Text timerText;

    public static Action<int, Action> OnInitializeTimer;
    public static Action OnStartTimer;
    public static Action OnStopTimer;
    public static Action<bool> OnTimerState;

    private Action callback;
    private int secondsLeft;

    private void Awake()
    {
        timerText.text = "--:--";
        SetupEvents();
    }

    private void SetupEvents()
    {
        OnStartTimer = null;
        OnStopTimer = null;
        OnTimerState = null;
        OnInitializeTimer = null;


        OnStartTimer = StartTimer;
        OnStopTimer = StopTimer;
        OnTimerState = TimerState;
        OnInitializeTimer = InitializeTimer;
    }

    private void TimerState(bool state)
    {
        timerText.gameObject.SetActive(state);
    }

    private void InitializeTimer(int seconds, Action _callback)
    {
        Debug.Log("On Initialize Timer");
        secondsLeft = seconds;
        callback = _callback;
    }

    private void StartTimer()
    {
        if (secondsLeft == 0) return;
        TimerState(true);
        InvokeRepeating(nameof(Timer), 1f, 1f);
    }

    private void StopTimer()
    {
        CancelInvoke();
    }

    private void Timer()
    {
        secondsLeft -= 1;
        CalculateTime();
        if (secondsLeft <= 0)
        {
            callback?.Invoke();
            CancelInvoke();
        }
    }

    void CalculateTime()
    {
        int minutes = (int)secondsLeft / 60;
        int seconds = ((int)secondsLeft- minutes * 60);
        timerText.text = ((minutes == 0) ? "00" : minutes.ToString("00")) + ":" + ((seconds == 0) ? "00" : seconds.ToString("00"));
    }
}
