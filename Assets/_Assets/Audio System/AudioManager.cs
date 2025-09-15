using UnityEngine.Audio;
using UnityEngine;
using System;
using DG.Tweening;
using System.Collections.Generic;
using System.Collections;
using HalvaStudio.Save;

public class AudioManager : Singleton<AudioManager>
{
    public Sound[] themesMenu;
    public Sound[] themesGame;
    public Sound[] sounds;

    public AudioMixer audioMixer;
    public AudioMixerGroup AudMixMaster;
    public AudioMixerGroup AudMixMusic;
    public AudioMixerGroup AudMixSFX;

    private const string MASTER_VOLUME = "MasterVolume";
    private const string MUSIC_VOLUME = "MusicVolume";
    private const string SOUND_VOLUME = "SoundVolume";

    public static Action OnStopCarSounds;

    private int menuSongID;
    private int gameSongID;

    public override void AwakeInit()
    {
        Initialize();
    }

    private void Initialize()
    {
        foreach (Sound sound in sounds)
        {
            sound.source = gameObject.AddComponent<AudioSource>();
            sound.source.clip = sound.clip;

            sound.source.outputAudioMixerGroup = AudMixSFX;
            sound.source.volume = sound.volume;
            sound.source.pitch = sound.pitch;
        }

        foreach (Sound sound in themesMenu)
        {
            sound.source = gameObject.AddComponent<AudioSource>();
            sound.source.clip = sound.clip;

            sound.source.outputAudioMixerGroup = AudMixMusic;
            sound.source.volume = sound.volume;
            sound.source.pitch = sound.pitch;
        }

        foreach (Sound sound in themesGame)
        {
            sound.source = gameObject.AddComponent<AudioSource>();
            sound.source.clip = sound.clip;

            sound.source.outputAudioMixerGroup = AudMixMusic;
            sound.source.volume = sound.volume;
            sound.source.pitch = sound.pitch;
        }

        menuSongID = -1;
        gameSongID = -1;
        //PlayOnLoop("Ambience");
    }

    private void Start()
    {
        audioMixer.updateMode = AudioMixerUpdateMode.UnscaledTime;
        SoundState(true);
        //Initialize();
        UpdateSound();
        UpdateMusic();
        //PlayThemeMenu();
    }


    public void UpdateSound()
    {
        ChangeSoundVolume(SaveManager.Instance.saveData.soundLevel / 100f);
    }

    public void UpdateMusic()
    {
        ChangeMusicVolume(SaveManager.Instance.saveData.musicLevel / 100f);
    }

    public void Play(string name)
    {

        Sound s = Array.Find(sounds, sound => sound.name == name);
        if (s == null)
        {
            Debug.LogWarning($"Sound {name} not found");
            return;
        }

        if (s.clip != null && s != null && s.source != null)
        {
            s.source.PlayOneShot(s.clip);
        }

    }


    public void PlayOnLoop(string name)
    {

        Sound s = Array.Find(sounds, sound => sound.name == name);
        if (s == null)
        {
            Debug.LogWarning($"Sound {name} not found");
            return;
        }
        s.source.Play();

    }



    public void PauseSound(string name)
    {
        Sound s = Array.Find(sounds, sound => sound.name == name);
        if (s == null)
        {
            Debug.LogWarning($"Sound {name} not found");
            return;
        }
        s.source.Pause();
    }

    public void StopSound(string name)
    {
        Sound s = Array.Find(sounds, sound => sound.name == name);
        if (s == null)
        {
            Debug.LogWarning($"Sound {name} not found");
            return;
        }
        s.source.Stop();
    }

    public void PlayThemeMenu()
    {
        Debug.Log("Play theme menu!");
        if (themesMenu.Length == 0) return;

        StopCurrentTheme(() =>
        {
            if (themesMenu.Length == 1)
            {
                menuSongID = 0;
            }
            else
            {
                int newSongID = UnityEngine.Random.Range(0, themesMenu.Length);
                while (newSongID == menuSongID)
                {
                    newSongID = UnityEngine.Random.Range(0, themesMenu.Length);
                }
                menuSongID = newSongID;
            }

            themesMenu[menuSongID].source.volume = 0f;
            themesMenu[menuSongID].source.Play();
            themesMenu[menuSongID].source.DOFade(1f, 1f).SetUpdate(true);
            Debug.Log("Play Menu Theme: " + menuSongID);
            StartCoroutine(WaitAndPlayNext(themesMenu[menuSongID].clip.length, PlayThemeMenu));
        });
    }


    public void PlayThemeGame()
    {
        Debug.Log("Play theme game!");
        if (themesGame.Length == 0) return;

        StopCurrentTheme(() =>
        {
            if (themesGame.Length == 1)
            {
                gameSongID = 0;
            }
            else
            {
                int newSongID = UnityEngine.Random.Range(0, themesGame.Length);
                while (newSongID == gameSongID)
                {
                    newSongID = UnityEngine.Random.Range(0, themesGame.Length);
                }
                gameSongID = newSongID;
            }

            themesGame[gameSongID].source.volume = 0f;
            themesGame[gameSongID].source.Play();
            themesGame[gameSongID].source.DOFade(1f, 1f).SetUpdate(true);
            Debug.Log("Play Game Theme: " + gameSongID);
            StartCoroutine(WaitAndPlayNext(themesGame[gameSongID].clip.length, PlayThemeGame));
        });
    }

    IEnumerator WaitAndPlayNext(float delay, Action nextSongMethod)
    {
        Debug.Log("WaitAndPlayNext!");
        yield return new WaitForSecondsRealtime(delay);
        Debug.Log("Next song method!");
        nextSongMethod();
    }


    public void StopCurrentTheme(Action callback)
    {
        StopAllCoroutines();

        if (menuSongID >= 0 && themesMenu[menuSongID].source.isPlaying)
        {
            Debug.Log("Stop menu theme!");
            themesMenu[menuSongID].source.DOFade(0f, 1f).OnComplete(() =>
            {
                themesMenu[menuSongID].source.Stop();
                //themesMenu[menuSongID].source.volume = 1f; // Reset volume for next play
                callback?.Invoke();
            }).SetUpdate(true); // This ensures the fade operates in real-time, ignoring the time scale
        }
        else if (gameSongID >= 0 && themesGame[gameSongID].source.isPlaying)
        {
            Debug.Log("Stop Game theme!");
            themesGame[gameSongID].source.DOFade(0f, 1f).OnComplete(() =>
            {
                themesGame[gameSongID].source.Stop();
                //themesGame[gameSongID].source.volume = 1f; // Reset volume for next play
                callback?.Invoke();
            }).SetUpdate(true); // Same here for game themes
        }
        else
        {
            Debug.Log("Stop theme!");
            callback?.Invoke();
        }
    }


    public void SoundState(bool state)
    {
        // new
        if (state)
        {
            AudMixMaster.audioMixer.SetFloat("MasterVolume", 0);
        }
        else
        {
            AudMixMaster.audioMixer.SetFloat("MasterVolume", -80);
        }
        // old
        Sound tempSound;
        for (int i = 0; i < sounds.Length; i++)
        {
            tempSound = sounds[i];
            //tempSound.source.enabled = state;

        }
    }


    public void ChangeMasterVolume(float amount)
    {
        AudMixMaster.audioMixer.SetFloat(MASTER_VOLUME, Mathf.Log10(amount) * 20f);
    }

    public void ChangeMusicVolume(float amount)
    {
        if (amount == 0)
            AudMixMusic.audioMixer.SetFloat(MUSIC_VOLUME, Mathf.Log10(0.001f) * 20f);
        else
            AudMixMusic.audioMixer.SetFloat(MUSIC_VOLUME, Mathf.Log10(amount) * 20f);
    }

    public void ChangeSoundVolume(float amount)
    {
        if (amount == 0)
            AudMixSFX.audioMixer.SetFloat(SOUND_VOLUME, Mathf.Log10(0.001f) * 20f);
        else
            AudMixSFX.audioMixer.SetFloat(SOUND_VOLUME, Mathf.Log10(amount) * 20f);
    }

}