using UnityEngine;


[CreateAssetMenu(fileName = "Character", menuName = "Scriptables/New Character", order = 1)]
public class CharacterBase : ScriptableObject
{
    public GameObject girlPrefab;
    public GameObject girlPrefabGame;
    public string girlName;
    public int girlNecessaryLevel;

    [Header("Stats")]
    public float health;
    public float stamina;
    public float speed;
}
