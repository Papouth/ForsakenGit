using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BossVue : MonoBehaviour
{
    public bool canSeePlayer3;

    public LayerMask zone;
    public Player player;
    public Boss boss;

    public bool playerSlowedDown = false;

    private AudioSource detectSound;


    private void Start()
    {
        boss = gameObject.GetComponentInParent<Boss>();
        canSeePlayer3 = false;
        playerSlowedDown = false;
        detectSound = GetComponent<AudioSource>();
        detectSound.loop = true;
    }


    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player") && !StatesPlayer.statesPlayer.isHiding)
        {
            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoss.transform.position, other.transform.position - robotBoss.transform.position, Color.green);


            if (Physics.Raycast(boss.transform.GetChild(0).position, player.raylauncher.transform.position - boss.transform.GetChild(0).position, out hitJoueur, 50f, ~zone))
            {
                if (hitJoueur.collider.gameObject.layer == 7)
                {
                    return;
                }
                else if (hitJoueur.collider.CompareTag("Player"))
                {
                    // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                    canSeePlayer3 = true;
                    player.isSee = true;

                    // -- Debug.Log("Je vois le joueur");
                    Boss.CallMe(other.transform);

                    detectSound.Play(0);

                    float distance = Vector3.Distance(player.raylauncher.transform.position, boss.transform.GetChild(0).position);

                    if (distance < 8f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
                    }

                    if (distance < 5f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        // -- ALORS ON TUE LE JOUEUR
                        player.Dead();
                    }
                }
            }

            if (player.isCrouched)
            {
                if (other.gameObject.layer == 7)
                {
                    return;
                }
                else if (other.CompareTag("Player"))
                {
                    canSeePlayer3 = true;

                    detectSound.Play(0);

                    player.isSee = true;


                    // -- Je lance l'alerte à mon robot BOSS
                    Boss.CallMe(other.transform);

                    // -- RALENTISSEMENT
                    float distance = Vector3.Distance(player.transform.position, boss.transform.GetChild(0).position);

                    if (distance < 8f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
                    }

                    if (distance < 5f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        // -- ALORS ON TUE LE JOUEUR
                        player.Dead();
                    }
                }
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player") && !StatesPlayer.statesPlayer.isHiding)
        {
            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotBoss.transform.position, other.transform.position - robotBoss.transform.position, Color.green);


            if (Physics.Raycast(boss.transform.GetChild(0).position, player.raylauncher.transform.position - boss.transform.GetChild(0).position, out hitJoueur, 50f, ~zone))
            {
                if (hitJoueur.collider.gameObject.layer == 7)
                {
                    // il y a un mur
                    return;
                }
                else if (hitJoueur.collider.CompareTag("Player"))
                {
                    // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                    canSeePlayer3 = true;
                    player.isSee = true;

                    // -- Debug.Log("Je vois le joueur");
                    Boss.CallMe(other.transform);

                    float distance = Vector3.Distance(player.raylauncher.transform.position, boss.transform.GetChild(0).position);

                    if (distance < 8f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
                    }

                    if (distance < 5f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        // -- ALORS ON TUE LE JOUEUR
                        player.Dead();
                    }
                }
            }

            if (player.isCrouched)
            {
                if (other.gameObject.layer == 7)
                {
                    return;
                }
                else if (other.CompareTag("Player"))
                {
                    canSeePlayer3 = true;
                    player.isSee = true;

                    // -- Je lance l'alerte à mon robot BOSS
                    Boss.CallMe(other.transform);

                    // -- RALENTISSEMENT
                    float distance = Vector3.Distance(player.transform.position, boss.transform.GetChild(0).position);

                    if (distance < 8f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
                    }

                    if (distance < 5f)
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        // -- ALORS ON TUE LE JOUEUR
                        player.Dead();
                    }
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
            detectSound.Stop();
            canSeePlayer3 = false;
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
                player.vitesse = 0.055f;


                // -- Step 2: Time when player is slowed down
                yield return new WaitForSeconds(4.5f);


                // -- Step 3: Speed Player Reset
                player.vitesse = 0.11f; // 0.1


                // -- Step 4: Time Before Player can be Re Slowed down
                yield return new WaitForSeconds(2.5f);

                playerSlowedDown = false;
            }
            else if (player.isCrouched == true)
            {
                playerSlowedDown = true;

                // -- Step 1: Slow the Player
                player.vitesse = 0.03f;


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