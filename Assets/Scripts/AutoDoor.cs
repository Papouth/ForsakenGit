using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoDoor : MonoBehaviour
{
    private Animator animDoor;
    private AudioSource autoSound;
    public AudioClip openDoor;
    public AudioClip closeDoor;

    private void Start()
    {
        animDoor = GetComponent<Animator>();
        autoSound = GetComponent<AudioSource>();
    }

    private void OnTriggerEnter(Collider other)
    {
        autoSound.PlayOneShot(openDoor);
        animDoor.SetBool("Open", true);
    }

    private void OnTriggerExit(Collider other)
    {
        autoSound.PlayOneShot(closeDoor);
        animDoor.SetBool("Open", false);
    }
}