using UnityEngine;
using UnityEngine.Serialization;

namespace _Assets.Scripts.SkillTree
{
    [CreateAssetMenu(fileName = "SkillData", menuName = "Scriptables/SkillData", order = 0)]
    public class SkillData : ScriptableObject
    {
        //public string Title;
        public string TitleLocalizationKey;
        //public string Description;
        public string DescriptionLocalizationKey;
        public int ID;
        public int Cost;
        public Sprite UnlockedIcon;
        public Sprite LockedIcon;
        public SurvivalSkillType SurvivalType;
        public CombatSkillType CombatType;
        public SupportSkillType SupportType;
        public SkillCategory Category;
        public SkillData PreviousRequiredSkill;
        public float BonusValue;
        
        public enum SurvivalSkillType
        {
            None, MaxHpBonus, RegenerationHp, Vampirism, Revive
        }
        
        public enum CombatSkillType
        {
            None, DamageBonus, AttackSpeedBonus, CriticalDamage, DamageHpBelow
        }
        
        public enum SupportSkillType
        {
            None, DamageReduction, RegenerationStamina, MoveSpeedHpBelow
        }
        
        public enum SkillCategory
        {
            Combat, Survival, Support
        }
    }
}