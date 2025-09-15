using UnityEngine;
using UnityEngine.EventSystems;

public class NavigationUI : MonoBehaviour
{
    [Header("Buttons")]
    public CustomButton startButton;
    public CustomButton[] customButtons;
    private GameObject lastObject;
    private bool isInitialized;



    private void Awake()
    {
        Init();
        lastObject = startButton.gameObject;
    }

    private void Start()
    {
        EventSystem.current.SetSelectedGameObject(lastObject);
        lastObject.GetComponent<CustomButton>().Select();
        isInitialized = true;
    }

    private void OnEnable()
    {
        if (isInitialized)
        {
            EventSystem.current.SetSelectedGameObject(lastObject);
            lastObject.GetComponent<CustomButton>().Select();
        }
    }

    private void OnDisable()
    {
        if (EventSystem.current)
        {
            if (EventSystem.current.currentSelectedGameObject)
            {
                lastObject = EventSystem.current.currentSelectedGameObject;
                lastObject.GetComponent<CustomButton>().DeactivateSelector();
            }
        }
       
    }


    private void Init()
    {
        int count = customButtons.Length;

        for (int i = 0; i < count; i++)
        {
            customButtons[i].Setup();
        }

        for (int i = 0; i < count; i++)
        {
            if (i == 0)
            {
                customButtons[i].SetupNavigation(null, customButtons[i + 1].button);
            }
            else if (i > 0 && i < count - 1)
            {
                customButtons[i].SetupNavigation(customButtons[i - 1].button, customButtons[i + 1].button);
            }
            else
            {
                customButtons[i].SetupNavigation(customButtons[i - 1].button, null);
            }
        }
    }

}
