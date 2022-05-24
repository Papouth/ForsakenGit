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
    public Color32 dangerIndice;
    public Color32 safe;
    public Color32 danger;


    private bool isWaitingAtObject = false;
    private int navP = 0;

    public bool isFreeze = false;
    #endregion


    public virtual void Start()
    {
        monRobot = GetComponent<NavMeshAgent>();

        // -- Prend mes wayPoints à partir de mon Parent De Secteur
        wayPoints = monParentSecteur.GetComponentsInChildren<Transform>();

        FindIndex();

        // je prend la couleur sur mon material en question
        dangerIndice = emissifMat.color;

        // j'attribue mes couleurs en fonction de la menace
        safe = new Color32(0, 190, 255, 255);
        danger = new Color32(255, 0, 0, 255);

        // le robot commence avec un niveau de menace en safe
        dangerIndice = safe;
    }

    public override void Interact(bool value)
    {

    }

    public override void Interact(Transform player)
    {
        //base.Interact(player);
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

    public void FindIndex()
    {
        //-- Debug.Log("Etape 1");
        for (int i = 0; i < wayPoints.Length; i++)
        {
            //-- Debug.Log("Etape 2");
            navP = i;

            // -- On tp notre ennemi au premier point choisi
            this.gameObject.transform.position = monParentSecteur.transform.position;
        }
    }

    public virtual void Update()
    {
        // si robot pas immobiliser
        if (!isFreeze)
        {
            RobotsMoove();
        }
    }

    public void RobotsMoove()
    {
        // -- ETAPE 1 : FAIRE DEPLACER LE ROBOT JUSQU'AU PROCHAIN NAVPOINT
        // -- ETAPE 2 : LUI FAIRE CORRECTEMENT TOURNER VERS LE PROCHAIN POINT
        // -- ETAPE 3 : LE FAIRE BOUCLER

        // -- Tant que la valeur de navP est inférieur au nombre de navPoints dans ma liste + si aucun objet détecté
        if (!isWaitingAtObject)
        {
            if (monRobot.remainingDistance < 3)
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