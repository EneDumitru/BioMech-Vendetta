using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(menuName = "Scriptables/Collectables", fileName = "New Collectable Info")]

public class CollectableData : ScriptableObject
{
    public Types collectableType;

    public GameObject collectablePrefab;
}
    //[SerializeField] private Size collectableSize;
    // enum Size
    //{
    //    Big,
    //    Medium,
    //    Small
    //}
    
    public enum Types
    {
        Ammo,
        Grenade,
        Weapon,
        Heal
    }