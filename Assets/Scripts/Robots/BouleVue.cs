﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BouleVue : MonoBehaviour
{
    public Boule boule;
    public bool canSeePlayer2;
    public LayerMask zone;
    public Player player;

    private AudioSource detectSound;


    private void Start()
    {
        boule = gameObject.GetComponentInParent<Boule>();
        canSeePlayer2 = false;

        detectSound = GetComponent<AudioSource>();
        detectSound.loop = true;
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoule.transform.position, other.transform.position - robotBoule.transform.position, Color.green);

            if (Physics.Raycast(boule.transform.position, other.transform.position - boule.transform.position, out hitJoueur, 15f, ~zone))
            {
                if (hitJoueur.collider.gameObject.layer == 7)
                {
                    // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                    return;
                }
                else if (hitJoueur.collider.CompareTag("Player"))
                {
                    canSeePlayer2 = true;
                    player.isSee = true;

                    detectSound.Play(0);

                    // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                    // -- Debug.Log("Je vois le joueur");
                    boule.monRobot.SetDestination(other.transform.position);
                    boule.Scan();

                    // -- Je lance l'alerte à mon robot BOSS
                    Boss.CallMe(other.transform);
                }
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoule.transform.position, other.transform.position - robotBoule.transform.position, Color.green);

            if (Physics.Raycast(boule.transform.position, other.transform.position - boule.transform.position, out hitJoueur, 15f, ~zone))
            {
                if (hitJoueur.collider.gameObject.layer == 7)
                {
                    // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                    return;
                }
                else if (hitJoueur.collider.CompareTag("Player"))
                {
                    player.isSee = true;

                    // -- Debug.Log("Je vois toujours");
                    boule.monRobot.SetDestination(other.transform.position);
                    Boss.CallMe(other.transform);
                }
            }
        }
    }

    public void OnTriggerExit(Collider other)
    {
        // -- Je ne touche plus le joueur
        if (other.CompareTag("Player"))
        {
            detectSound.Stop();
            // -- Debug.Log("je ne touche plus le joueur");
            canSeePlayer2 = false;
        }
    }
}