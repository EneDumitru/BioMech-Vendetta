using UnityEngine;
using UnityEngine.UI;

public class InputIconUpdater : MonoBehaviour
{
    [Header("Icon Variants")]
    public Sprite keyboardIcon;
    public Sprite playStationIcon;
    public Sprite switchProIcon;

    private Image image;

    void Awake()
    {
        image = GetComponent<Image>();
        UpdateIcon(InputManager.Instance.CurrentDevice);
        InputManager.Instance.OnDeviceChanged += UpdateIcon;
    }

    void OnDestroy()
    {
        if (InputManager.Instance != null)
            InputManager.Instance.OnDeviceChanged -= UpdateIcon;
    }

    private void UpdateIcon(InputManager.InputDeviceType deviceType)
    {
        image.sprite = deviceType switch
        {
            InputManager.InputDeviceType.KeyboardMouse => keyboardIcon,
            InputManager.InputDeviceType.PlayStation => playStationIcon,
            InputManager.InputDeviceType.SwitchPro => switchProIcon,
            _ => image.sprite
        };
    }
}