using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LarbinVue : MonoBehaviour
{
    public Rbts robots;
    public bool canSeePlayer;

    public LayerMask Wall;
    public Player player;
    public bool playerSlowedDown;

    private AudioSource detectSound;


    private void Start()
    {
        robots = gameObject.GetComponentInParent<Rbts>();
        canSeePlayer = false;
        playerSlowedDown = false;
        robots.emissifMat.SetColor("_BaseColor", robots.safe);
        robots.emissifMat.SetColor("_EmissiveColor", robots.safe);
        detectSound = GetComponent<AudioSource>();
    }


    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (!StatesPlayer.statesPlayer.isHiding)
            {
                RaycastHit hitJoueur;
                // -- Debug.DrawRay(robotLarbin.transform.position, other.transform.position - robotLarbin.transform.position, Color.green);


                if (Physics.Raycast(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, out hitJoueur, 40f, Wall))
                {
                    // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                    return;
                }
                else if (Physics.Raycast(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, out hitJoueur, 40f))
                {
                    canSeePlayer = true;

                    detectSound.Play(0);

                    robots.emissifMat.SetColor("_BaseColor", robots.danger);
                    robots.emissifMat.SetColor("_EmissiveColor", robots.danger);

                    player.imageContour.SetActive(true);


                    // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                    // -- Debug.Log("Je vois le joueur");
                    robots.monRobot.SetDestination(other.transform.position);
                    // -- Je lance l'alerte à mon robot BOSS
                    Boss.CallMe(other.transform);

                    // -- RALENTISSEMENT
                    float distance = Vector3.Distance(player.raylauncher.transform.position, robots.transform.GetChild(0).position);

                    if (distance < 4.5f) // old = 3.5f
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
                    }
                }
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            if (!StatesPlayer.statesPlayer.isHiding)
            {
                detectSound.Play(0);

                robots.emissifMat.SetColor("_BaseColor", robots.danger); // ICI pour test
                robots.emissifMat.SetColor("_EmissiveColor", robots.danger);
                player.imageContour.SetActive(true);
                Boss.CallMe(other.transform);

                // -- Debug.Log("Je vois toujours");
                if (!robots.isFreeze)
                {
                    robots.monRobot.SetDestination(other.transform.position);


                    // -- RALENTISSEMENT
                    float distance = Vector3.Distance(player.raylauncher.transform.position, robots.transform.GetChild(0).position);

                    if (distance < 4.5f) // old = 3.5f
                    {
                        // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                        StartCoroutine(RalentissementJoueur());
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
            robots.emissifMat.SetColor("_BaseColor", robots.safe);
            robots.emissifMat.SetColor("_EmissiveColor", robots.safe);
            // -- Shake Camera
            player.imageContour.SetActive(false);

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


                //Debug.Log("joueur ralentit");
                // -- Step 1: Slow the Player
                player.vitesse = 0.06f;


                // -- Step 2: Time when player is slowed down
                yield return new WaitForSeconds(3.5f);


                // -- Step 3: Speed Player Reset
                player.vitesse = 0.1f;


                // -- Step 4: Time Before Player can be Re Slowed down
                yield return new WaitForSeconds(3f);

                playerSlowedDown = false;
            }
            else if (player.isCrouched == true)
            {
                playerSlowedDown = true;

                // -- Step 1: Slow the Player
                player.vitesse = 0.035f;


                // -- Step 2: Time when player is slowed down
                yield return new WaitForSeconds(3.5f);


                // -- Step 3: Speed Player Reset
                player.vitesse = 0.05f;


                // -- Step 4: Time Before Player can be Re Slowed down
                yield return new WaitForSeconds(3f);

                playerSlowedDown = false;
            }
        }
    }

    public void LarbinGoToPlayer()
    {
        if (canSeePlayer)
        {
            // -- Debug.Log("je te suis");
            robots.monRobot.SetDestination(transform.position);
        }
    }
}