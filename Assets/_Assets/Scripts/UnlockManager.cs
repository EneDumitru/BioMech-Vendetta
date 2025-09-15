using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class UnlockManager : MonoBehaviour
{
    [SerializeField] private GameObject[] characters; // Personajele disponibile
    private int currentLevel; // Nivelul curent

    private void Start()
    {
        // Inițializează cu primul personaj disponibil
        SelectCharacter(0);
    }

    public void SetCurrentLevel(int level)
    {
        currentLevel = level;
        
        // Verifică nivelul și activează/dezactivează personajele în funcție de nivel
        for (int i = 0; i < characters.Length; i++)
        {
            characters[i].SetActive(i <= currentLevel);
        }
    }

    public void SelectCharacter(int characterIndex)
    {
        // Verifică dacă personajul este disponibil la nivelul curent
        if (characterIndex <= currentLevel)
        {
            // Deselectează toate personajele
            for (int i = 0; i < characters.Length; i++)
            {
                characters[i].SetActive(false);
            }

            // Selectează personajul dorit
            characters[characterIndex].SetActive(true);
        }
        else
        {
            Debug.LogWarning("Personajul nu este disponibil la nivelul curent.");
        }
    }
}
