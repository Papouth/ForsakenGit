using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LarbinVue : MonoBehaviour
{
    public Rbts robots;
    public bool canSeePlayer;

    public LayerMask zone;
    public Player player;
    public bool playerSlowedDown;

    private AudioSource detectSound;
    public GameObject rayonLaser;


    private void Start()
    {
        robots = gameObject.GetComponentInParent<Rbts>();
        canSeePlayer = false;
        playerSlowedDown = false;
        robots.emissifMat.SetColor("_BaseColor", robots.safe);
        robots.emissifMat.SetColor("_EmissiveColor", robots.safe);
        detectSound = GetComponent<AudioSource>();
        player.imageContour.SetActive(false);
        rayonLaser.SetActive(false);
        detectSound.loop = true;
    }

    public void OnTriggerEnter(Collider other)
    {
        if (!robots.isFreeze)
        {
            if (other.CompareTag("Player") && !StatesPlayer.statesPlayer.isHiding)
            {
                RaycastHit hitJoueur;
                //Debug.DrawRay(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, Color.green);


                if (Physics.Raycast(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, out hitJoueur, 40f, ~zone)) // on détecte tout sauf le layer zone
                {
                    if (hitJoueur.collider.gameObject.layer == 7)
                    {
                        return;
                    }
                    else if (hitJoueur.collider.CompareTag("Player"))
                    {
                        canSeePlayer = true;

                        detectSound.Play(0);

                        robots.emissifMat.SetColor("_BaseColor", robots.danger);
                        robots.emissifMat.SetColor("_EmissiveColor", robots.danger);

                        player.isSee = true;


                        // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                        robots.monRobot.SetDestination(other.transform.position);
                        // -- Je lance l'alerte à mon robot BOSS
                        Boss.CallMe(other.transform);

                        // -- RALENTISSEMENT
                        float distance = Vector3.Distance(player.raylauncher.transform.position, robots.transform.GetChild(0).position);

                        if (distance < 4.5f)
                        {
                            // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                            StartCoroutine(RalentissementJoueur());
                        }
                    }
                }
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (!robots.isFreeze)
        {
            if (other.CompareTag("Player") && !StatesPlayer.statesPlayer.isHiding)
            {
                RaycastHit hit;
                //Debug.DrawRay(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, Color.green);

                if (Physics.Raycast(robots.transform.GetChild(0).position, player.raylauncher.transform.position - robots.transform.GetChild(0).position, out hit, 40f, ~zone)) // on détecte tout sauf le layer zone
                {
                    if (hit.collider.gameObject.layer == 7)
                    {
                        return;
                    }
                    else if (hit.collider.CompareTag("Player"))
                    {
                        canSeePlayer = true;

                        robots.emissifMat.SetColor("_BaseColor", robots.danger);
                        robots.emissifMat.SetColor("_EmissiveColor", robots.danger);

                        player.isSee = true;

                        Boss.CallMe(other.transform);


                        robots.monRobot.SetDestination(other.transform.position);

                        // -- RALENTISSEMENT
                        float distance = Vector3.Distance(player.raylauncher.transform.position, robots.transform.GetChild(0).position);

                        if (distance < 4.5f)
                        {
                            // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                            StartCoroutine(RalentissementJoueur());
                        }
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

            // -- Debug.Log("je ne touche plus le joueur");
            detectSound.Stop();

            canSeePlayer = false;
        }
    }

    public void Update()
    {
        Debug.Log(canSeePlayer);

        if (StatesPlayer.statesPlayer.isHiding)
        {
            Debug.Log("bug viens de se cacher");

            robots.emissifMat.SetColor("_BaseColor", robots.safe);
            robots.emissifMat.SetColor("_EmissiveColor", robots.safe);

            // -- Debug.Log("je ne touche plus le joueur");
            canSeePlayer = false;
        }

        if (robots.isFreeze)
        {
            Stun();
        }
        else if (!robots.isFreeze)
        {
            rayonLaser.SetActive(true);
            robots.sparks.SetActive(false);
        }
    }

    public void Stun()
    {
        // -- On enlève l'indication de menace visuel
        robots.emissifMat.SetColor("_BaseColor", robots.safe);
        robots.emissifMat.SetColor("_EmissiveColor", robots.safe);

        canSeePlayer = false;
        playerSlowedDown = false;
        rayonLaser.SetActive(false);


        if (!player.isCrouched)
        {
            player.vitesse = 0.11f;
        }
        else if (player.isCrouched)
        {
            player.vitesse = 0.05f;
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
                player.vitesse = 0.11f; // 0.1


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
}