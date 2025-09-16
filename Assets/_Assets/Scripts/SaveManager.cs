using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Newtonsoft.Json;
using _Assets._PlatformSpeciffics.Switch;
using System.IO;
using TMPro;
using DG.Tweening;

namespace HalvaStudio.Save
{
    public class SaveManager : Singleton<SaveManager>
    {
        [Header("Debug")]
        public int unlockCharacters;
        public int unlockLevels;
        public TMP_Text savingText;

        public SaveData saveData;
        [SerializeField] private SaveData defaultSafeData;

        //Save cooldown
        private float saveCooldown = 3.0f; // 3 seconds cooldown
        private float lastSaveTime = -3.0f; // Initialize to allow immediate first save
        private bool pendingSave = false; // Flag to track if a save is pending


        #region Main
        public override void AwakeInit()
        {
            Load();
            SetInitialValues();
        }

        private void Load()
        {
            saveData = new SaveData();

#if UNITY_EDITOR || UNITY_PS5 || UNITY_STANDALONE
            saveData = (SaveData)LoadPS(typeof(SaveData));
            saveData.money = 5000;
#elif UNITY_SWITCH
        saveData = (SaveData) LoadSwitch(typeof(SaveData));
#endif
        }

        public void Save(bool _forceSave = false)
        {
            savingText.DOKill();
            savingText.DOFade(1f, 0.5f);

            if (Time.time - lastSaveTime >= saveCooldown || _forceSave)
            {
                PerformSave();
            }
            else
            {
                Debug.Log("Save requested during cooldown. Will save after cooldown.");
                pendingSave = true; // Set pending save flag
            }
        }


        private void PerformSave()
        {
            Debug.Log("Do Save!");
            lastSaveTime = Time.time; // Update last save time

#if UNITY_EDITOR || UNITY_PS5 || UNITY_STANDALONE
            SavePS(saveData);
#elif UNITY_SWITCH
        SaveSwitch(saveData, _forceSave);
#endif

            pendingSave = false; // Reset pending save flag
            savingText.color = Color.white;
            savingText.DOKill();
            savingText.DOFade(0f, 1f);
        }

        void Update()
        {
            // Check if a pending save needs to be performed
            if (pendingSave && Time.time - lastSaveTime >= saveCooldown)
            {
                PerformSave();
            }
        }
        #endregion


        #region PlayStation
        public void SavePS(object saveObject)
        {
            string jsonString = JsonConvert.SerializeObject(saveObject);
            PlayerPrefs.SetString("NunsSave", jsonString);
            PlayerPrefs.Save();

            Debug.LogError("Save completed in PlayerPrefs.");
        }

        public object LoadPS(System.Type objectType)
        {
            if (PlayerPrefs.HasKey("NunsSave"))
            {
                string jsonString = PlayerPrefs.GetString("NunsSave");
                object returnObject = JsonConvert.DeserializeObject(jsonString, objectType);
                return returnObject;
            }
            else
            {
                Debug.LogError("No save data found in PlayerPrefs.");
                SaveData temp = defaultSafeData;
                return temp;
            }
        }

        #endregion


        #region Editor

        public void SaveEditor(object saveObject)
        {
            string jsonFile = JsonConvert.SerializeObject(saveObject);
            string savePath = GetSavePath();

            File.WriteAllText(savePath, jsonFile);

            Debug.Log("Save completed.");
        }

        private string GetSavePath()
        {
            string savePath = Path.Combine(Application.persistentDataPath, "save.json");
            Debug.Log("Save Path: " + savePath);

            return savePath;
        }


        public object LoadEditor(System.Type objectType)
        {
            string savePath = GetSavePath();
            object returnObject = null;

            if (File.Exists(savePath))
            {
                // Read the JSON string from the file
                string jsonFile = File.ReadAllText(savePath);

                // Deserialize the JSON string back into an object of type T
                returnObject = JsonConvert.DeserializeObject(jsonFile, objectType);

                return returnObject;
            }
            else
            {
                Debug.LogError("Save file not found.");
                SaveData temp = new SaveData();
                temp = defaultSafeData;
                return temp;
            }

        }


        #endregion

        #region Switch
        public void SaveSwitch(object saveObject, bool forceSave = false)
        {
#if UNITY_SWITCH
            string jsonFile = JsonConvert.SerializeObject(saveObject);
            //Debug.LogError("DEBUG: Save json : \n " + jsonFile);
            NintendoSave.Save(jsonFile, forceSave);
            Debug.Log("Save completed.");
#endif

        }

        public object LoadSwitch(System.Type objectType)
        {
#if UNITY_SWITCH

            object returnObject = null;
            bool successful = false;
            string jsonFile = NintendoSave.Load(ref successful);

            if (jsonFile == null)
            {
                Debug.LogError("Save file not found.");
                SaveData temp = new SaveData();
                temp = defaultSafeData;
                return temp;
            }

            Debug.Log("Load completed.");
            returnObject = JsonConvert.DeserializeObject(jsonFile, objectType);
            return returnObject;
#endif
            return null;
        }
        #endregion

        #region Other
        private void SetInitialValues()
        {
            for (int i = 0; i < unlockCharacters; i++)
            {
                saveData.charactersUnlocked[i] = true;
            }

            //Set default pistol
            if (!saveData.weaponUnlocked.ContainsKey(10))
            {
                saveData.weaponUnlocked[10] = true;
                saveData.selectedPistolID = 10;
            }

            LevelManager.Instance.Initialize();
        }
        #endregion


        [System.Serializable]
        public class SaveData
        {
            [Header("Player Data")]
            public int money;
            public int currentLocation;
            public int characterID;
            public int selectedPistolID;
            public int selectedAssaultID;
            public int highscore;
            public int xp;
            public int skillPoints;

            [Header("Lists")]
            public Dictionary<int, bool> charactersUnlocked = new Dictionary<int, bool>();
            public Dictionary<int, bool> weaponUnlocked = new Dictionary<int, bool>();
            public Dictionary<int, bool> skillsUnlocked = new Dictionary<int, bool>();
            public List<LevelSaveData> levelsData = new List<LevelSaveData>();

            [Header("Settings")]
            public int lookSensitivity;
            public int soundLevel;
            public int musicLevel;
            public bool vibrationsState;
            public bool indicatorState;
            public bool invertedY;
            public string language;
        }

        [System.Serializable]
        public class LevelSaveData
        {
            public float bestTime = 0;
            public bool isUnlocked;
            public bool isCompleted;

            public LevelSaveData(bool _isUnlocked)
            {
                isUnlocked = _isUnlocked;
            }
        }
    }
}

