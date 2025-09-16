using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using EmeraldAI;
using Invector;

namespace EmeraldAI
{
    public class EmeraldAINonAIDamage : MonoBehaviour
    {
        public int Health = 50;
        public bool DebugLogDeath = true;
        public List<string> ActiveEffects = new List<string>();
        EmeraldAISystem EmeraldComponent;
        string StartingTag;
        int StartingLayer;
        int StartingHealth;

        private EmeraldAISystem _emerald;

        private void Start()
        {
            _emerald = GetComponent<EmeraldAISystem>();
            StartingLayer = gameObject.layer;
            StartingTag = gameObject.tag;
            StartingHealth = Health;
        }

        /// <summary>
        /// Manages Non-AI damage with an external script that can be customized as needed.
        /// </summary>
        public void SendNonAIDamage(int DamageAmount, Transform Target, bool CriticalHit = false)
        {
            //DefaultDamage(DamageAmount, Target);
            if (_emerald != null)
            {
                _emerald.Damage(DamageAmount, EmeraldAISystem.TargetType.Player);
            }

            //Creates damage text on the player's position, if enabled.
            //CombatTextSystem.Instance.CreateCombatText(DamageAmount, transform.position + new Vector3(0, transform.localScale.y / 2, 0), CriticalHit, false, false);
        }

        void DefaultDamage(int DamageAmount, Transform Target)
        {
            Debug.LogError(DamageAmount);
            Health -= DamageAmount;
            
            Debug.LogError(Health);

            if (Health <= 0)
            {
                if (DebugLogDeath)
                    Debug.Log("The Non-AI Target has died.");

                gameObject.layer = 0;
                gameObject.tag = "Untagged";
            }
        }

        /// <summary>
        /// Resets this Non-AI target to its default settings before it was killed. This includes health, layer, and tag.
        /// </summary>
        public void ResetNonAITarget ()
        {
            gameObject.layer = StartingLayer;
            gameObject.tag = StartingTag;
            Health = StartingHealth;
        }
    }
}
