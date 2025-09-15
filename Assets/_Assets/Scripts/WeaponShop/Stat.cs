using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace _Assets.Scripts.WeaponShop
{
    public class Stat : MonoBehaviour
    {
        [SerializeField] private TMP_Text value;
        [SerializeField] private Image fillImage;
        [SerializeField] private bool minMaxInversed;
        [SerializeField] private float multiplier = 1f;
        [SerializeField] private Vector2 minMaxValue;

        public void SetData(float val)
        {
            if (minMaxInversed)
            {
                value.text = (multiplier - (val * multiplier)).ToString("F0");
                fillImage.fillAmount = minMaxValue.y - (val / minMaxValue.y);
            }
            else
            {
                value.text = (val * multiplier).ToString("F0");
                fillImage.fillAmount = val / minMaxValue.y;
            }
        }
    }
}