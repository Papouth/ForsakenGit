using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class KeysAssignation : MonoBehaviour
{
    public static KeysAssignation keysAssign; // -- Pouvoir choisir ses touches

    public KeyCode interactionKey; 
    public KeyCode escapeKey;
    public KeyCode handKey;
    public KeyCode tazerKey;
    public KeyCode cheatMenuKey;
    public KeyCode crouchKey;
    public KeyCode leanLeftKey;
    public KeyCode leanRightKey;
    public KeyCode pauseKey;



    public void Awake()
    {
        if (keysAssign)
        {
            Destroy(gameObject);
            return;
        }
        keysAssign = this;
    }

    public void Start()
    {
        DefaultKeysAssignation();
    }


    public void DefaultKeysAssignation()
    {
        interactionKey = KeyCode.F;
        escapeKey = KeyCode.Escape;
        handKey = KeyCode.Alpha1;
        tazerKey = KeyCode.Alpha2;
        cheatMenuKey = KeyCode.F11;
        crouchKey = KeyCode.LeftControl;
        leanLeftKey = KeyCode.A;
        leanRightKey = KeyCode.E;
        pauseKey = KeyCode.P;
    }
}
