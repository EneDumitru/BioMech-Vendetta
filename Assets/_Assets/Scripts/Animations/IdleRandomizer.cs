using System;
using UnityEngine;
using Random = UnityEngine.Random;

namespace _Assets.Scripts.Animations
{
    public class IdleRandomizer : MonoBehaviour
    {
        public Animator animator;
        public AnimationClip[] idleClips; // Assign 10 clips in Inspector
        public bool isActive;

        private AnimatorOverrideController overrideController;
        private int lastIndex = -1;
        private float timer = 0f;
        private float currentClipLength = 1f;

        void Awake()
        {
            overrideController = new AnimatorOverrideController(animator.runtimeAnimatorController);
            animator.runtimeAnimatorController = overrideController;
        }

        public void ChangeState(bool active)
        {
            isActive = active;
            if (active)
            {
                if (overrideController == null)
                {
                    overrideController = new AnimatorOverrideController(animator.runtimeAnimatorController);
                    animator.runtimeAnimatorController = overrideController;
                }
                PlayRandomIdle();
            }
        }

        void Update()
        {
            if (!isActive) return;

            timer += Time.deltaTime;
            if (timer >= currentClipLength)
            {
                PlayRandomIdle();
            }
        }

        public void PlayRandomIdle()
        {
            int newIndex;
            do
            {
                newIndex = Random.Range(0, idleClips.Length);
            } while (newIndex == lastIndex);

            lastIndex = newIndex;
            AnimationClip selectedClip = idleClips[newIndex];

            overrideController["Idle"] = selectedClip; // Replace the clip in Animator
            animator.Play("Idle", 0, 0f); // Restart from beginning

            currentClipLength = selectedClip.length;
            timer = 0f;
        }
    }
}