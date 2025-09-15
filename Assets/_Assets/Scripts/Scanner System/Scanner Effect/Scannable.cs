using UnityEngine;
using System.Collections;

public class Scannable : MonoBehaviour
{
    public Target target;

    private void Start()
    {
        target.enabled = false;

        if (target.indicatorIcon == IndicatorIcon.Zombie || target.indicatorIcon == IndicatorIcon.Boss ||
            target.indicatorIcon == IndicatorIcon.Ammo || target.indicatorIcon == IndicatorIcon.Health)
        {
            ScannerEffectDemo.OnAddScanable?.Invoke(this);
        }
    }

    private void OnDisable()
    {
        if (target.indicatorIcon == IndicatorIcon.Zombie || target.indicatorIcon == IndicatorIcon.Boss ||
            target.indicatorIcon == IndicatorIcon.Ammo || target.indicatorIcon == IndicatorIcon.Health)
        {
            ScannerEffectDemo.OnRemoveScannable?.Invoke(this);
        }
    }


    private bool hasPinged;

    public void Ping()
    {
        if (!target.enabled && !hasPinged)
        {
            target.enabled = true;
            Invoke(nameof(DisableIndicator), 5f);
        }
    }

    private void DisableIndicator()
    {
        target.enabled = false;
    }
}