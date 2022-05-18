using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossVue : MonoBehaviour
{
    public bool canSeePlayer;

    public LayerMask Wall;
    public Player player;
    public Boss boss;

    public bool playerSlowedDown = false;



    private void Start()
    {
        boss = gameObject.GetComponentInParent<Boss>();
        canSeePlayer = false;
        playerSlowedDown = false;
    }


    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            canSeePlayer = true;


            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoss.transform.position, other.transform.position - robotBoss.transform.position, Color.green);


            if (Physics.Raycast(boss.transform.position, other.transform.position - boss.transform.position, out hitJoueur, 50f, Wall))
            {
                // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                return;
            }
            else if (Physics.Raycast(boss.transform.position, other.transform.position - boss.transform.position, out hitJoueur, 50f))
            {
                // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                // -- Debug.Log("Je vois le joueur");
                Boss.CallMe(other.transform);
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoss.transform.position, other.transform.position - robotBoss.transform.position, Color.green);


            if (Physics.Raycast(boss.transform.position, other.transform.position - boss.transform.position, out hitJoueur, 50f, Wall))
            {
                // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                return;
            }
            else if (Physics.Raycast(boss.transform.position, other.transform.position - boss.transform.position, out hitJoueur, 50f))
            {
                // -- Debug.Log("Je vois toujours");
                Boss.CallMe(other.transform);

                // -- TUER LE JOUEUR
                float distance = Vector3.Distance(other.transform.position, boss.transform.position);

                if (distance < 6.5f)
                {
                    // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                    StartCoroutine(RalentissementJoueur());
                }

                if (distance < 3.5f)
                {
                    // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                    // -- ALORS ON TUE LE JOUEUR
                    player.Dead();
                }
            }
        }
    }

    public void OnTriggerExit(Collider other)
    {
        // -- Je ne touche plus le joueur
        if (other.CompareTag("Player"))
        {
            // -- Debug.Log("je ne touche plus le joueur");
            canSeePlayer = false;
        }
    }

    private IEnumerator RalentissementJoueur()
    {
        if (playerSlowedDown == false)
        {
            if (player.isCrouched == false)
            {
                playerSlowedDown = true;

                // -- Step 1: Slow the Player
                player.vitesse = 0.075f;


                // -- Step 2: Time when player is slowed down
                yield return new WaitForSeconds(4.5f);


                // -- Step 3: Speed Player Reset
                player.vitesse = 0.1f;


                // -- Step 4: Time Before Player can be Re Slowed down
                yield return new WaitForSeconds(2.5f);

                playerSlowedDown = false;
            }
            else if (player.isCrouched == true)
            {
                playerSlowedDown = true;

                // -- Step 1: Slow the Player
                player.vitesse = 0.035f;


                // -- Step 2: Time when player is slowed down
                yield return new WaitForSeconds(4.5f);


                // -- Step 3: Speed Player Reset
                player.vitesse = 0.05f;


                // -- Step 4: Time Before Player can be Re Slowed down
                yield return new WaitForSeconds(2.5f);

                playerSlowedDown = false;
            }
        }
    }
}