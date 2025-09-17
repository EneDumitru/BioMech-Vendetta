using UnityEngine;

namespace _Assets.Scripts.Companions
{
    [CreateAssetMenu(fileName = "Scriptables/CompanionData", menuName = "CompanionData", order = 0)]
    public class CompanionData : ScriptableObject
    {
        public int id;
        public Sprite icon;
        public string name;
        public string description;
        public int price;
        public GameObject prefab;
    }
}