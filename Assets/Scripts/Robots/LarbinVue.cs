using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LarbinVue : MonoBehaviour
{
    public Rbts robots;
    public bool canSeePlayer;

    public LayerMask Wall;
    public Player player;
    public bool playerSlowedDown = false;


    private void Start()
    {
        robots = gameObject.GetComponentInParent<Rbts>();
        canSeePlayer = false;
        playerSlowedDown = false;
    }

    public void Update()
    {
        ColorCheck();
    }

    public void ColorCheck()
    {
        if (!player.imageContour)
        {
            Debug.Log("pas de contour alors safe");
            robots.emissifMat.SetColor("_BaseColor", robots.safe);
        }
        else if (player.imageContour)
        {
            Debug.Log("contour donc danger");
        }
    }

    public void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            canSeePlayer = true;
            robots.emissifMat.SetColor("_BaseColor", robots.danger);
            // -- Shake Camera
            player.imageContour.SetActive(true);



            RaycastHit hitJoueur;
            // -- Debug.DrawRay(robotLarbin.transform.position, other.transform.position - robotLarbin.transform.position, Color.green);


            if (Physics.Raycast(robots.transform.position, other.transform.position - robots.transform.position, out hitJoueur, 40f, Wall))
            {
                // -- S'il y a un mur alors robot ne vois pas et continue sa ronde
                return;
            }
            else if (Physics.Raycast(robots.transform.position, other.transform.position - robots.transform.position, out hitJoueur, 40f))
            {
                // -- S'il n'y a pas de mur, alors le robot vois correctement le joueur et se dirige vers lui

                // -- Debug.Log("Je vois le joueur");
                robots.monRobot.SetDestination(other.transform.position);
                // -- Je lance l'alerte à mon robot BOSS
                Boss.CallMe(other.transform);


                // -- RALENTISSEMENT
                float distance = Vector3.Distance(other.transform.position, robots.transform.position);

                if (distance < 4.5f) // old = 3.5f
                {
                    // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                    StartCoroutine(RalentissementJoueur());
                }
            }
        }
    }

    public void OnTriggerStay(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            robots.emissifMat.SetColor("_BaseColor", robots.danger);
            player.imageContour.SetActive(true);


            // -- Debug.Log("Je vois toujours");
            if (!robots.isFreeze)
            {
                robots.monRobot.SetDestination(other.transform.position);


                // -- RALENTISSEMENT
                float distance = Vector3.Distance(other.transform.position, robots.transform.position);

                if (distance < 4.5f) // old = 3.5f
                {
                    // -- Debug.Log("la distance entre le joueur et le robot = " + distance);
                    StartCoroutine(RalentissementJoueur());
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