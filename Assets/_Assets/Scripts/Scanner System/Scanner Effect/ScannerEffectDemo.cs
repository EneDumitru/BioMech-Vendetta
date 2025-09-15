using UnityEngine;
using System.Collections;
using System;
using EasyGameStudio.scanner;
using System.Collections.Generic;

[ExecuteInEditMode]
public class ScannerEffectDemo : MonoBehaviour
{
	public Transform ScannerOrigin;
	public float ScanDistance;
	public float timer;
	public Scanner_control scannerPrefab;

	// Demo Code
	bool _scanning;
	public List<Scannable> _scannables = new List<Scannable>();

	public static Action<Vector3> OnScan;
	public static Action<Scannable> OnAddScanable;
	public static Action<Scannable> OnRemoveScannable;


	void OnEnable()
	{
		OnScan = Scan;
		OnAddScanable = AddScanable;
		OnRemoveScannable = RemoveScannable;
	}

	private void OnDisable()
    {
		OnScan = null;
		OnAddScanable = null;
		OnRemoveScannable = null;
	}

	private void Scan(Vector3 scanOrigin)
    {
        if (_scanning || Time.timeScale == 0) return;

		_scanning = true;
		ScanDistance = 0;
		timer = 0;
		ScannerOrigin.position = scanOrigin;
		Instantiate(scannerPrefab, scanOrigin, Quaternion.identity);
        PS5TrophyManager.Instance.IncreaseProgressStat(TrophyEvents.OnScannerUsed, TrophyParams.ScannerUsed, TrophyID.FAITHFUL_SCANNER);
    }

    private void AddScanable(Scannable _scannable)
    {
        if (!_scannables.Contains(_scannable))
        {
			_scannables.Add(_scannable);
		}
	}

	private void RemoveScannable(Scannable _scannable)
	{
		if (_scannables.Contains(_scannable))
		{
			_scannables.Remove(_scannable);
		}
	}

	void Update()
	{
		if (_scanning && timer < 5f)
		{
			ScanDistance += Time.deltaTime * scannerPrefab.speed;
			timer += Time.deltaTime;

			foreach (Scannable s in _scannables)
			{
				if (Vector3.Distance(ScannerOrigin.position, s.transform.position) <= ScanDistance)
					s.Ping();
			}

			if (timer >= 5f)
			{
				_scanning = false;
				timer = 0f;
			}
		}
	}
}
