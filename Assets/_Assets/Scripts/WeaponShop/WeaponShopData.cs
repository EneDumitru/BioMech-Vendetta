using System.Collections;
using System.Collections.Generic;
using Invector.vShooter;
using UnityEditor;
using UnityEngine;

[CreateAssetMenu(menuName = "Scriptables/WeaponShopInfo", fileName = "New WeaponShop Info")]
public class WeaponShopData : ScriptableObject
{
    public WeaponTypes type;
    public int id;
    public Sprite icon;
    public string name;
    public int price;
    public GameObject prefab;
    public vShooterWeapon gamePrefab;
}

    public enum WeaponTypes
{
    Pistol,
    ShotGun,
    Assault,
    Miscellaneous
}
