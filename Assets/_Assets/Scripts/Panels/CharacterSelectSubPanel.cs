using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CharacterSelectSubPanel : MonoBehaviour
{
    public GameObject readyObj;
    public GameObject buttonsObj;

    public void PlayerSelected(bool _state)
    {
        readyObj.SetActive(_state);
        buttonsObj.SetActive(!_state);
    }
}
