using UnityEngine;

namespace Invector
{
    public class vHealthItem : MonoBehaviour
    {
        private bool isButtonPressed;
        [Tooltip("How much health will be recovery")]
        public float value;
        public string tagFilter = "Player";

        void OnTriggerEnter(Collider other)
        {
            if (other.gameObject.CompareTag(tagFilter))
            {
                Heal(other);
            }
        }
        void OnTriggerStay(Collider other)
        {
            if (other.gameObject.CompareTag(tagFilter))
            {
                Heal(other);
            }
        }
        private void OnTriggerExit(Collider other)
        {
            isButtonPressed = false;
        }
        public void PressButton()
        {
            isButtonPressed = true;
        }

        private void Heal(Collider other)
        {
            if (isButtonPressed)
            {
                // access the basic character information
                var healthController = other.GetComponent<vHealthController>();
                if (healthController != null)
                {

                    // heal only if the character's health isn't full
                    if (healthController.currentHealth < healthController.maxHealth)
                    {
                        // limit healing to the max health
                        healthController.AddHealth((int)value);
                        Destroy(gameObject);
                    }
                }
                isButtonPressed = false;
            }
        }
    }
}