using System;
using System.Collections;
using System.Collections.Generic;
using _Assets.Scripts.SkillTree;
using HalvaStudio.Save;
using UnityEngine;
using UnityEngine.Events;

namespace Invector
{
    [vClassHeader("HealthController", iconName = "HealthControllerIcon")]
    public class vHealthController : vMonoBehaviour, vIHealthController
    {
        #region Variables

        [vEditorToolbar("Health", order = 0)] [SerializeField] [vReadOnly]
        protected bool _isDead;

        [vBarDisplay("_maxHealth", false)] [SerializeField]
        protected float _currentHealth;

        public bool isImmortal = false;
        public ParticleSystem reviveVFX;

        [vHelpBox(
            "If you want to start with different value, uncheck this and make sure that the current health has a value greater zero")]
        public bool fillHealthOnStart = true;

        [SerializeField] protected int _maxHealth = 100;

        public virtual int maxHealth
        {
            get { return _maxHealth; }
            set { _maxHealth = value; }
        }

        protected virtual void OnValidate()
        {
            if (currentHealth <= 0 && !isDead) isDead = true;
        }

        public virtual int MaxHealth
        {
            get { return maxHealth; }
            protected set { maxHealth = value; }
        }

        public virtual float currentHealth
        {
            get { return _currentHealth; }
            protected set
            {
                if (_currentHealth != value)
                {
                    _currentHealth = value;
                    _currentHealth = Mathf.Clamp(_currentHealth, 0, MaxHealth);
                    onChangeHealth.Invoke(_currentHealth);
                    HandleCheckHealthEvents();
                }

                if (_isPlayer && _reviveUnlocked && _currentHealth <= 0)
                {
                    if(reviveVFX != null)
                        reviveVFX.Play(true);
                    _currentHealth = _maxHealth;
                    _reviveUnlocked = false;
                }

                if (_isPlayer)
                {
                    isLowHp = _currentHealth <= MaxHealth*0.2f;
                }

                var newDeathState = _currentHealth <= 0;
                if (newDeathState != isDead)
                {
                    isDead = newDeathState;
                }
            }
        }


        public virtual bool isDead
        {
            get { return _isDead; }
            set
            {
                if (_isDead != value)
                {
                    _isDead = value;
                    if (value) onDead.Invoke(gameObject);
                }
            }
        }

        [SerializeField] protected float _healthRecovery = 0;

        public virtual float healthRecovery
        {
            get { return _healthRecovery; }
            set { _healthRecovery = value; }
        }

        [SerializeField] protected float _healthRecoveryDelay = 0f;

        public virtual float healthRecoveryDelay
        {
            get { return _healthRecoveryDelay; }
            set { _healthRecoveryDelay = value; }
        }

        protected float _currentHealthRecoveryDelay;

        public virtual float currentHealthRecoveryDelay
        {
            get { return _currentHealthRecoveryDelay; }
            set { _currentHealthRecoveryDelay = value; }
        }

        [vEditorToolbar("Events", order = 100)]
        public List<CheckHealthEvent> checkHealthEvents = new List<CheckHealthEvent>();

        [SerializeField] protected OnReceiveDamage _onStartReceiveDamage = new OnReceiveDamage();
        [SerializeField] protected OnReceiveDamage _onReceiveDamage = new OnReceiveDamage();
        [SerializeField] protected OnDead _onDead = new OnDead();
        public ValueChangedEvent onChangeHealth;

        public OnReceiveDamage onStartReceiveDamage
        {
            get { return _onStartReceiveDamage; }
            protected set { _onStartReceiveDamage = value; }
        }

        public OnReceiveDamage onReceiveDamage
        {
            get { return _onReceiveDamage; }
            protected set { _onReceiveDamage = value; }
        }

        public OnDead onDead
        {
            get { return _onDead; }
            protected set { _onDead = value; }
        }

        public UnityEvent onResetHealth;
        public virtual bool inHealthRecovery { get; set; }

        private bool _reviveUnlocked;
        [HideInInspector] public bool vampirismActive;
        [HideInInspector] public bool isLowHp;
        [HideInInspector] public float vampirismPercent;
        private bool _isPlayer;
        private float _damageReductionPercentage;

        #endregion

        public void ConfigPlayerHealth()
        {
            _isPlayer = true;

            var bonusHP = 0f;
            foreach (var skillData in SkillsManager.Instance.SkillsData)
            {
                if (!SaveManager.Instance.saveData.skillsUnlocked.ContainsKey(skillData.ID))
                    continue;

                if (skillData.Category == SkillData.SkillCategory.Survival)
                {
                    switch (skillData.SurvivalType)
                    {
                        case SkillData.SurvivalSkillType.None:
                            break;
                        case SkillData.SurvivalSkillType.MaxHpBonus:
                            float tempBonus = skillData.BonusValue / 100 * _maxHealth;
                            if (tempBonus > bonusHP)
                                bonusHP = tempBonus;
                            break;
                        case SkillData.SurvivalSkillType.RegenerationHp:
                            _healthRecovery = skillData.BonusValue;
                            _healthRecoveryDelay = 1f;
                            break;
                        case SkillData.SurvivalSkillType.Vampirism:
                            vampirismActive = true;
                            vampirismPercent = skillData.BonusValue;
                            break;
                        case SkillData.SurvivalSkillType.Revive:
                            _reviveUnlocked = true;
                            break;
                    }
                }

                if (skillData.Category == SkillData.SkillCategory.Support)
                {
                    if (skillData.SupportType == SkillData.SupportSkillType.DamageReduction)
                    {
                        if (skillData.BonusValue > _damageReductionPercentage)
                            _damageReductionPercentage = skillData.BonusValue;
                    }
                }
            }

            _maxHealth += (int)bonusHP;
        }

        protected virtual void Start()
        {
            if (fillHealthOnStart)
                currentHealth = maxHealth;
            currentHealthRecoveryDelay = healthRecoveryDelay;
        }

        protected virtual bool canRecoverHealth
        {
            get { return (currentHealth >= 0 && healthRecovery > 0 && currentHealth < maxHealth); }
        }

        protected virtual IEnumerator RecoverHealth()
        {
            inHealthRecovery = true;
            while (canRecoverHealth && !isDead)
            {
                HealthRecovery();
                yield return null;
            }

            inHealthRecovery = false;
        }

        protected virtual void HealthRecovery()
        {
            if (!canRecoverHealth || isDead) return;
            if (currentHealthRecoveryDelay > 0)
                currentHealthRecoveryDelay -= Time.deltaTime;
            else
            {
                if (currentHealth > maxHealth)
                    currentHealth = maxHealth;
                if (currentHealth < maxHealth)
                    currentHealth += healthRecovery * Time.deltaTime;
            }
        }

        /// <summary>
        /// Increase or decrease  currentHealth (Positive or Negative Values)
        /// </summary>
        /// <param name="value">Value to change</param>
        public virtual void AddHealth(int value)
        {
            currentHealth += value;
        }

        /// <summary>
        /// Change the currentHealth of Character
        /// </summary>
        /// <param name="value"></param>
        public virtual void ChangeHealth(int value)
        {
            currentHealth = value;
        }

        /// <summary>
        /// Reset's current health to specific health value
        /// </summary>
        /// <param name="health">target health</param>
        public virtual void ResetHealth(float health)
        {
            currentHealth = health;
            onResetHealth.Invoke();
        }

        /// <summary>
        /// Reset's current health to max health
        /// </summary>
        public virtual void ResetHealth()
        {
            currentHealth = maxHealth;
            onResetHealth.Invoke();
        }

        /// <summary>
        /// Change the MaxHealth of Character
        /// </summary>
        /// <param name="value"></param>
        public virtual void ChangeMaxHealth(int value)
        {
            maxHealth += value;
            if (maxHealth < 0)
                maxHealth = 0;
        }

        /// <summary>
        /// Set a value to HealthRecovery to start recovering health
        /// </summary>
        /// <param name="value"></param>
        public virtual void SetHealthRecovery(float value)
        {
            healthRecovery = value;
            StartCoroutine(RecoverHealth());
        }

        /// <summary>
        /// Apply Damage to Current Health
        /// </summary>
        /// <param name="damage">damage</param>
        public virtual void TakeDamage(vDamage damage)
        {
            if (damage != null)
            {
                if (_isPlayer && _damageReductionPercentage > 1)
                {
                    if (_damageReductionPercentage != 0)
                        damage.damageValue -= damage.damageValue * _damageReductionPercentage / 100;
                }
                
                onStartReceiveDamage.Invoke(damage);
                currentHealthRecoveryDelay = currentHealth <= 0 ? 0 : healthRecoveryDelay;

                if (currentHealth > 0 && !isImmortal)
                {
                    currentHealth -= damage.damageValue;
                }

                if (damage.damageValue > 0)
                    onReceiveDamage.Invoke(damage);
            }
        }

        protected virtual void HandleCheckHealthEvents()
        {
            var events = checkHealthEvents.FindAll(e =>
                (e.healthCompare == CheckHealthEvent.HealthCompare.Equals && currentHealth.Equals(e.healthToCheck)) ||
                (e.healthCompare == CheckHealthEvent.HealthCompare.HigherThan && currentHealth > (e.healthToCheck)) ||
                (e.healthCompare == CheckHealthEvent.HealthCompare.LessThan && currentHealth < (e.healthToCheck)));

            for (int i = 0; i < events.Count; i++)
            {
                events[i].OnCheckHealth.Invoke();
            }

            if (currentHealth < maxHealth && this.gameObject.activeInHierarchy && !inHealthRecovery)
                StartCoroutine(RecoverHealth());
        }

        [System.Serializable]
        public class CheckHealthEvent
        {
            public int healthToCheck;
            public bool disableEventOnCheck;

            public enum HealthCompare
            {
                Equals,
                HigherThan,
                LessThan
            }

            public HealthCompare healthCompare = HealthCompare.Equals;

            public UnityEngine.Events.UnityEvent OnCheckHealth;
        }

        [System.Serializable]
        public class ValueChangedEvent : UnityEvent<float>
        {
        }
    }
}