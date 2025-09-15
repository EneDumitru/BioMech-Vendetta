using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class ButtonClickSound : MonoBehaviour, ISelectHandler
{
    bool canPlaySound;
    private void Start()
    {
        canPlaySound = true;
    }
    public void OnSelect(BaseEventData eventData)
    {
        if (canPlaySound)
        {
            AudioManager.Instance?.Play("Change");
        }
        
    }

}
