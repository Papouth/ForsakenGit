using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class AutoDoor : MonoBehaviour
{
    private Animator animDoor;

    private void Start()
    {
        animDoor = GetComponent<Animator>();
    }

    private void OnTriggerEnter(Collider other)
    {
        animDoor.SetBool("Open", true);
    }

    private void OnTriggerExit(Collider other)
    {
        animDoor.SetBool("Open", false);
    }
}