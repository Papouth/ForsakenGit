using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BouleVue : MonoBehaviour
{
    public Boule boule;
    public bool canSeePlayer;

    public LayerMask Wall;
    public Player player;

    private AudioSource detectSound;



    private void Start()
    {
        boule = gameObject.GetComponentInParent<Boule>();
        canSeePlayer = false;

        detectSound = GetComponent<AudioSource>();
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            canSeePlayer = true;
            player.imageContour.SetActive(true);


            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoule.transform.position, other.transform.position - robotBoule.transform.position, Color.green);

            if (Physics.Raycast(boule.transform.position, other.transform.position - boule.transform.position, out hitJoueur, 15f, Wall))
            {
                // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                return;
            }
            else if (Physics.Raycast(boule.transform.position, other.transform.position - boule.transform.position, out hitJoueur, 15f))
            {
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

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            player.imageContour.SetActive(true);
            detectSound.Play(0);

            // -- Debug.Log("Je vois toujours");
            boule.monRobot.SetDestination(other.transform.position);
            Boss.CallMe(other.transform);
        }
    }

    public void OnTriggerExit(Collider other)
    {
        // -- Je ne touche plus le joueur
        if (other.CompareTag("Player"))
        {
            player.imageContour.SetActive(false);

            // -- Debug.Log("je ne touche plus le joueur");
            canSeePlayer = false;
        }
    }

    public void LarbinGoToPlayer()
    {
        if (canSeePlayer)
        {
            // -- Debug.Log("je te suis");
            boule.monRobot.SetDestination(transform.position);
        }
    }
}