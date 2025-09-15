using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PS5LogHelper
{
    /// <summary>
    /// Log a message tagged with [UNTIY LOG]
    /// </summary>
    public static void LogTaggedMessage(string message)
    {
        Debug.LogError($"[UNITY LOG] {message}");
    }
}
