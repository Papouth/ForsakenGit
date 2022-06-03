using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class RangeTazer : MonoBehaviour
{
    public Rbts leRobot;
    public Player player;
    public bool tazing = false;


    public void Start()
    {
        player = GetComponentInParent<Player>();
    }

    public void Update()
    {
        Taze();
    }


    public void OnTriggerStay(Collider other)
    {
        // -- Si j'appuie sur clic gauche +  que j'ai assez de charges + que j'ai le tazer en main
        if (other.gameObject.CompareTag("RobotLarbin") && Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity > 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            leRobot = other.GetComponent<Rbts>();


            if (!tazing)
            {
                tazing = true;
                // -- Lancer l'animation d'attaque du taser
                player.anim.SetTrigger("attack");

                // -- Perte d'une charge automatiquement pour chaque tir de tazer

                // -- On immobilise le robot en question
                //leRobot = other.GetComponent<Rbts>();

                StartCoroutine(Freeze());
            }
        }
        else if (other.gameObject.CompareTag("RobotLarbin") && Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity <= 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            // bruit pas assez de mun
            player.anim.ResetTrigger("attack");
            player.anim.enabled = true;
        }
        else
        {
            player.anim.ResetTrigger("attack");
        }
    }

    
    public void OnTriggerExit(Collider other)
    {
        if(other.gameObject.CompareTag("RobotLarbin"))
        {
            leRobot = null;
        }
    }

    public void Taze()
    {
        // -- Pas de robot + j'appuie sur clic gauche + j'ai assez de charges + j'ai le tazer en main
        if (Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity > 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            player.anim.SetTrigger("attack");

            // A chaque tir de mon tazer, je perd une charge
            Inventaire.inventaire.currentPilesCapacity -= 1;
        }

        // -- Si j'appuie sur clic gauche + je N'AI PAS assez de charges + j'ai mon tazer en main
        else if (Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity <= 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            // -- Son qui fait comprendre que plus de charges restantes
            player.anim.SetTrigger("attack");
        }
    }

    private IEnumerator Freeze()
    {
        // -> Arrêter l'anim de marche du robot
        leRobot.GetComponent<Animator>().enabled = false;

        // on active le spark 
        leRobot.sparks.SetActive(true);

        leRobot.isFreeze = true;

        leRobot.GetComponent<NavMeshAgent>().enabled = false;

        yield return new WaitForSeconds(3f);

        leRobot.GetComponent<NavMeshAgent>().enabled = true;


        tazing = false;

        // -> Remettre l'anim de marche du robot
        leRobot.GetComponent<Animator>().enabled = true;

        // on désactive le spark
        leRobot.sparks.SetActive(false);

        leRobot.isFreeze = false;
        //leRobot.GetComponent<NavMeshAgent>().enabled = true;
    }
}