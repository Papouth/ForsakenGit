using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


public class Rbts : Interactable
{
    #region Variables
    [Tooltip("Mon Robot")]
    public NavMeshAgent monRobot;
    [Tooltip("Mon Parent du Secteur")]
    public GameObject monParentSecteur;
    [Tooltip("Mes WayPoints enfants du ParentSecteur")]
    public Transform[] wayPoints;
    public GameObject sparks;

    public Material emissifMat;
    public Color32 safe;
    public Color32 danger;

    private bool isWaitingAtObject = false;
    public int navP = 0;

    public bool isFreeze = false;
    public bool soundOn;
    public AudioSource walkSound;
    #endregion



    public virtual void Start()
    {
        monRobot = gameObject.GetComponent<NavMeshAgent>();
        
        // -- Prend mes wayPoints à partir de mon Parent De Secteur
        wayPoints = monParentSecteur.GetComponentsInChildren<Transform>();

        walkSound = GetComponent<AudioSource>();
        soundOn = true;

        BetterIndex();

        // j'attribue mes couleurs en fonction de la menace
        safe = new Color32(0, 190, 255, 255);
        danger = new Color32(255, 0, 0, 255);
    }

    public override void Interact(bool value)
    {

    }

    public override void Interact(Transform player)
    {
        GoToObjectDetected(player.position);
    }

    // virtual pour modifier le script pour le robot boule
    public virtual void GoToObjectDetected(Vector3 objectPosition)
    {
        if (!isFreeze)
        {
            isWaitingAtObject = true; // -- attend autour de l'objet en ON
            monRobot.SetDestination(objectPosition);// -- On met la destination du robot vers l'objet qui viens d'émettre du bruit
            StartCoroutine(WaitAtPosition()); // -- Le robot doit faire des " tour de garde" autour du son émis pour essayer de trouver d'ou ça proviens ou attend juste pour voir s'il y a le joueur ou non
        }
    }

    public IEnumerator WaitAtPosition()
    {
        // INSPECTION DE LA ZONE

        // -- On patiente 5 secondes avant de repartir sur notre parcours
        yield return new WaitForSeconds(5f);
        isWaitingAtObject = false;
    }

    public void BetterIndex()
    {
        navP = wayPoints.Length - 1;
        //Debug.Log("j'ai " + navP + " navpoints");
        gameObject.transform.position = monParentSecteur.transform.position;
    }

    public void Update()
    {
        if (!isFreeze)
        {
            if (!monRobot.pathPending && monRobot.remainingDistance < 2.5f)
            {
                RobotsMoove();
            }

            if (!soundOn)
            {
                walkSound.Play(0);
                soundOn = true;
            }
        }
        else if (isFreeze)
        {
            walkSound.Stop();
            soundOn = false;
        }

        if (StatesPlayer.statesPlayer.isDead)
        {
            walkSound.Stop();
        }
    }
    
    public void RobotsMoove()
    {
        if (!isFreeze)
        {
            // -- Tant que la valeur de navP est inférieur au nombre de navPoints dans ma liste + si aucun objet détecté
            if (!isWaitingAtObject)
            {
                navP++;

                // -- Debug.Log("mon nav point actuel est le " + (navP -1) + "ème");

                if (navP == wayPoints.Length)
                {
                    navP = 0;
                }
                monRobot.SetDestination(wayPoints[navP].transform.position);
            }
        }
    }
}