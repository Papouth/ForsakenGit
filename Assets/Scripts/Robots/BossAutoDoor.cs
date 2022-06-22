using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAutoDoor : MonoBehaviour
{
    private Door maPorte;
    private AudioSource bossDoorSound;


    private void Start()
    {
        maPorte = GetComponent<Door>();
        bossDoorSound = GetComponent<AudioSource>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Boss"))
        {
            if (!maPorte.doorOpen)
            {
                bossDoorSound.Play(0);
                // -- Ma porte est fermée donc je l'ouvre
                GetComponent<Animator>().SetBool("OpenBoss", true);
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Boss"))
        {
            if (!maPorte.doorOpen)
            {
                bossDoorSound.Play(0);
                // -- Ma porte est fermée donc je la referme derrière moi
                GetComponent<Animator>().SetBool("OpenBoss", false);
            }
        }
    }
}