using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Door : MonoBehaviour
{
    [Tooltip("terminal qui ouvre la porte")]
    public Terminal terminal;
    public bool doorOpen;

    private AudioSource doorSound;

    private void Start()
    {
        doorOpen = false;
        doorSound = GetComponent<AudioSource>();
    }

    public void OpenDoors()
    {
        if (terminal.isUsed)
        {
            if (!doorOpen)
            {
                doorSound.Play(0);
            }
            GetComponent<Animator>().SetBool("Open", true);
            doorOpen = true;
        }
    }
}