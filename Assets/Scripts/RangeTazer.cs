using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class RangeTazer : MonoBehaviour
{
    public Rbts leRobot;
    public Player player;


    public void Start()
    {
        player = GetComponentInParent<Player>();
    }

    public void OnTriggerStay(Collider other)
    {
        // -- Si j'appuie sur clic gauche +  que j'ai assez de charges + que j'ai le tazer en main
        if (other.gameObject.CompareTag("RobotLarbin") && Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity > 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            // -- Lancer l'animation d'attaque du taser
            player.anim.SetTrigger("attack");

            // PASSE 5 FOIS DEDANS !!!!!!!!!!!!!!!!

            // -- On tir sur le robot
            Inventaire.inventaire.currentPilesCapacity -= 1;
            //Debug.Log("il me reste : " + Inventaire.inventaire.currentPilesCapacity + " munitions");


            // on immobilise le robot en question
            leRobot = other.GetComponent<Rbts>();

            StartCoroutine(Freeze());

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

    public void Update()
    {
        Taze();
    }

    public void Taze()
    {
        // -- Pas de robot + j'appuie sur clic gauche + j'ai assez de charges + j'ai le tazer en main
        if (Input.GetMouseButtonDown(0) && Inventaire.inventaire.currentPilesCapacity > 0 && StatesPlayer.statesPlayer.isHoldingTazer)
        {
            player.anim.SetTrigger("attack");

            Inventaire.inventaire.currentPilesCapacity -= 1;
            //Debug.Log("il me reste : " + Inventaire.inventaire.currentPilesCapacity + " charges");
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
        // inverser

        // -> Remettre l'anim de marche du robot
        leRobot.GetComponent<Animator>().enabled = true;

        // on désactive le spark
        leRobot.sparks.SetActive(false);

        leRobot.isFreeze = false;
        leRobot.GetComponent<NavMeshAgent>().enabled = true;
    }
}