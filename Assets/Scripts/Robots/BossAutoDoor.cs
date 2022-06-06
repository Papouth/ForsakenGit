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
                // -- Ma porte est ferm�e donc je l'ouvre
                GetComponent<Animator>().SetBool("OpenBoss", true);
            }
            else if (maPorte.doorOpen)
            {
                // -- Ma porte est d�j� ouverte
            }
        }
    }

    private void OnTriggerExit(Collider other)
    {
        if(other.CompareTag("Boss"))
        {
            if (!maPorte.doorOpen)
            {
                // -- Ma porte est ferm�e donc je la referme derri�re moi
                GetComponent<Animator>().SetBool("OpenBoss", false);
            }
            else if (maPorte.doorOpen)
            {
                // -- Ma porte est d�j� ouverte donc je la laisse ouverte
            }
        }
    }
}