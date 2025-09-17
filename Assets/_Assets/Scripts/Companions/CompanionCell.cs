using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace _Assets.Scripts.Companions
{
    public class CompanionCell : MonoBehaviour
    {
        [SerializeField] private TMP_Text title;
        [SerializeField] private TMP_Text description;
        [SerializeField] private TMP_Text price;
        [SerializeField] private Image icon;

        public void SetView(CompanionData data)
        {
            title.text = data.name;
            description.text = data.description;
            price.text = data.price.ToString();
            icon.sprite = data.icon;
        }
    }
}