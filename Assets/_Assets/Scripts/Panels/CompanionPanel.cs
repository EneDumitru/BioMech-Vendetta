using System;
using System.Collections;
using System.Collections.Generic;
using _Assets.Scripts.Companions;
using UnityEngine;
using UnityEngine.InputSystem;

namespace _Assets.Scripts.Panels
{
    public class CompanionPanel : Panel
    {
        [SerializeField] private CompanionData[] companions;
        [SerializeField] private CompanionCell cell;
        [SerializeField] private Transform container;

        private PlayerInput playerInput;
        private bool isInitialized;
        private List<CompanionCell> _cells = new();

        IEnumerator Start()
        {
            yield return new WaitUntil(() => InputManager.Instance != null);
            foreach (var companion in companions)
            {
                var newCell = Instantiate(cell, container);
                newCell.SetView(companion);
                _cells.Add(newCell);
            }
            
            isInitialized = true;
            SetActions();
        }
        
        private void SetActions()
        {
            playerInput.actions["Submit"].started += Submit_Started;
            playerInput.actions["Cancel"].started += GoBack_Started;
        }

        private void RemoveActions()
        {
            playerInput.actions["Submit"].started -= Submit_Started;
            playerInput.actions["Cancel"].started -= GoBack_Started;
        }
        
        private void Submit_Started(InputAction.CallbackContext obj)
        {
            AudioManager.Instance.Play("Change");
        }

        private void GoBack_Started(InputAction.CallbackContext obj)
        {
            PanelManager.OnGoBack?.Invoke();
        }

        private void OnEnable()
        {
            if (isInitialized)
            {
                SetActions();
            }
        }

        private void OnDisable()
        {
            RemoveActions();
        }
    }
}