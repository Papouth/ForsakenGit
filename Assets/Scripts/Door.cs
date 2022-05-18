using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Door : MonoBehaviour
{
    [Tooltip("terminal qui ouvre la porte")]
    public Terminal terminal;

    public void OpenDoors()
    {
        if (terminal.isUsed)
        {
            GetComponent<Animator>().SetBool("Open", true);  
        }
    }
}