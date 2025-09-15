using System.Collections;
using System.Collections.Generic;
using UnityEngine.Events;
using UnityEngine;
using UnityEngine.UI;

public class OptionControls : OptionBase
{
    private void Start()
    {
        Button controlBtn = GetComponent<Button>();
        controlBtn.onClick.AddListener(ControlsSelect);
    }
    public void ControlsSelect()
    {
        PanelManager.OnGoToPanel?.Invoke(PanelName.Controls.ToString());
    }
}
