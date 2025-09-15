using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AvatarChanger : MonoBehaviour
{
    public Avatar avatarMenu;
    public Avatar avatarCustomize;
    private Animator animator;

    private void Awake()
    {
        animator = GetComponent<Animator>();
    }

    public void SetAvatarMenu()
    {
        animator.avatar = avatarMenu;
    }

    public void SetAvatarCustomize() 
    {
        animator.avatar = avatarCustomize;
    }
}
