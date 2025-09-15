using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class FPS_Counter : MonoBehaviour
{
	private TMP_Text fpsText;
	string label = "";
	float count;

    private void Awake()
    {
		fpsText = GetComponent<TMP_Text>();
    }

    IEnumerator Start()
	{
		GUI.depth = 2;
		while (true)
		{
			if (Time.timeScale == 1)
			{
				yield return new WaitForSeconds(0.1f);
				count = (1 / Time.deltaTime);
				label = "FPS: " + (Mathf.Round(count));
			}
			else
			{
				label = "Pause";
			}
			yield return new WaitForSeconds(0.5f);
			fpsText.text = label;
		}
	}
}
