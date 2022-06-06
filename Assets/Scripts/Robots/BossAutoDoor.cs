using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossAutoDoor : MonoBehaviour
{
    private Door maPorte;


    private void Start()
    {
        maPorte = GetComponent<Door>();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Boss"))
        {
            if (!maPorte.doorOpen)
            {
                // -- Ma porte est fermée donc je l'ouvre
                GetComponent<Animator>().SetBool("OpenBoss", true);
            }
            else if (maPorte.doorOpen)
            {
                // -- Ma porte est déjà ouverte
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Boss"))
        {
            if (!maPorte.doorOpen)
            {
                // -- Ma porte est fermée donc je la referme derrière moi
                GetComponent<Animator>().SetBool("OpenBoss", false);
            }
            else if (maPorte.doorOpen)
            {
                // -- Ma porte est déjà ouverte donc je la laisse ouverte
            }
        }
    }
}