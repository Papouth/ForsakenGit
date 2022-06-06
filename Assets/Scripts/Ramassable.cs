using System.Collections;
using UnityEditor;
using UnityEngine;

public class Ramassable : Interactable
{
    [Tooltip("Distance Propagation du Son de l'objet")]
    public float radius = 14f; // -- Zone de propagation du son

    public LayerMask Ennemi;
    public LayerMask Wall;

    public Rbts robots;
    public Boss boss;
    public Boule boule;

    public Collider colObjet;
    public Rigidbody rb;

    public bool isGrounded = false; // -- Si l'objet touche le sol, un mur ou un objet
    public bool haveBeenDrop = false; // -- A été laché
    public bool launchable = true; // -- Pour mes objets qui peuvent être lancé



    public void Start()
    {
        // -- Les objets ne doivent absolument pas avoir la variable en vrai, jusqu'à temps qu'on les prennent
        isGrounded = false;
        colObjet = GetComponent<Collider>();
    }

    public void OnCollisionEnter(Collision other)
    {
        // -- Quand on rentre en contact on émet le bruit du matériaux avec lequel on est rentré en collision [amélioration]

        isGrounded = true;

        if (Time.timeSinceLevelLoad < 3f)
        {
            return;
        }
        if (isGrounded)
        {
            sendSound();
        }
    }

    public void OnCollisionExit(Collision other)
    {
        isGrounded = false;
    }

    public void sendSound()
    {
        #region Instruction
        // -- On met un OverlapSphere (pendant X secondes) quand un objet touche le sol
        // -- On check ensuite si je hit un ennemi avec mon OverlapSphere >>> Utilisation de layer sur mon overlapshere nom du layer : Ennemi
        // -- Si je hit un ennemi -> j'envoi un raycast de mon objet vers mon ennemis touché pour calculer la distance qui les séparent

        // -- Selon la distance, mon float de détection augmente ou diminue
        // -- Si mon float de détection est au dessus d'un certain seuil on effectue l'action qui s'y rapporte

        // -- LE ROBOT DETECTE OU NE DETECTE PAS, PAS DE DEMIE MESURE

        // -- Après 5 secondes par exemple, si le robot ne trouve rien (vision + audio)
        // -- Il reprend sa course vers son prochain waypoint
        #endregion

        // -- Lorsque mon objet touche le sol, alors je le définit comme la position d'impact pour calculer la distance qui le sépare de mon robot 
        // -- Si l'objet est "grounded" alors on va envoyé un check de position en passant par le navmesh


        if (isGrounded)
        {
            // -- A chaque fois que l'objet touche le sol il fait un OverlapShere, et si dans la zone se trouve un ennemi, il le détecte
            Collider[] hitColliders = Physics.OverlapSphere(transform.position, radius, Ennemi);


            foreach (var colliderHit in hitColliders)
            {

                RaycastHit hitRobot;

                // -- Debug.DrawRay(transform.position, colliderHit.transform.position - transform.position, Color.green);
                if (Physics.Raycast(transform.position, colliderHit.transform.position - transform.position, out hitRobot, 12f, Wall))
                {
                    // -- Si il y a un mur alors robot n'entend pas et continue sa ronde
                    return;
                }
                else if (Physics.Raycast(transform.position, colliderHit.transform.position - transform.position, out hitRobot, 12f))
                {
                    #region Robots

                    if (colliderHit.transform.GetComponent<Rbts>() != null)
                    {
                        robots = colliderHit.GetComponent<Rbts>();
                        robots.GoToObjectDetected(transform.position);

                        robots.monRobot.SetDestination(transform.position);


                        Boss.CallMe(transform);
                    }

                    #endregion

                    #region Boule

                    if (colliderHit.transform.GetComponent<Boule>() != null)
                    {
                        boule = colliderHit.GetComponent<Boule>();

                        // -- On lance un scan de la zone
                        boule.Scan();
                    }

                    #endregion
                }
            }
        }
    }


    private void OnDrawGizmos()
    {
        if (isGrounded)
        {
            // -- Je dessine ma sphère dans ma scène 
            Gizmos.color = Color.white;
            Gizmos.DrawWireSphere(transform.position, radius);
        }
    }

    public override void Interact(bool value)
    {
        base.Interact(value);
        // -- Etat de mon joueur quand il interargit avec un objet
        StatesPlayer.statesPlayer.isInteractObject = value;

        if (value)
        {
            Ramasser();
        }
        else
        {
            Poser();
        }
    }

    void Ramasser()
    {
        // -- On active le Rigidbody ICI | permet d'optimiser les rigidbodys dans la scène
        if (!gameObject.GetComponent<Rigidbody>())
        {
            gameObject.AddComponent<Rigidbody>();
            rb = gameObject.GetComponent<Rigidbody>();
            rb.drag = 1f; // ne pas faire rouler l'objet
            rb.collisionDetectionMode = CollisionDetectionMode.ContinuousDynamic; // éviter que les objets passent au travers du sol
        }

        if (!StatesPlayer.statesPlayer.isHoldingThrowableItem)
        {
            // -- Je place mon objet dans ma main droite
            transform.parent = StatesPlayer.statesPlayer.rightHand;
            transform.localPosition = Vector3.zero;
            transform.localRotation = Quaternion.identity; // reset la rotation de l'objet -> donner un tag a chaque objet lançable et selon ça on met la rotation autrement + sa position
            rb.isKinematic = true; // -- Le rigidbody de mon objet passe en kinematic pour qu'il ne bouge pas

            // -- Je désactive le collider de mon objet quand je l'ai en main
            colObjet.enabled = false;


            if (StatesPlayer.statesPlayer.rightHand)
            {
                isGrounded = false;
            }

            if (launchable)
            {
                // -- Si mon objet est lançable, on lui rajoute la possibilité de le lancé
                ActionManager.OnLaunchObject += Launch;
                StatesPlayer.statesPlayer.isHoldingThrowableItem = true;
            }
        }
    }

    void Poser()
    {
        // -- Lorsque je pose mon objet, je le détache du parent ( main ), j'enlève mon isKinematic pour le soumettre de nouveau à la gravité, et je passe ma variable de drop en vraie
        transform.parent = null;
        rb.isKinematic = false;
        haveBeenDrop = true;

        // -- Remettre le collider de mon objet lançable
        colObjet.enabled = true;

        // -- Coroutine tt les 2 secs
        StartCoroutine(RigidbodySleep());
    }

    private IEnumerator RigidbodySleep()
    {
        yield return new WaitForSeconds(4f);
        if (rb.IsSleeping())
        {
            // -- Si mon rigidbody est inactif et que mon objet touche le sol 
            if (isGrounded)
            {
                // -- Alors j'enlève le rigidbody
                Destroy(rb);
            }
        }
    }

    private void LateUpdate()
    {
        if (launchable && haveBeenDrop)
        {
            // -- Si mon objet est lançable, on lui enlève le possibilité d'être lancé
            ActionManager.OnLaunchObject -= Launch;
        }
        // -- A été drop repasse en faux 
        haveBeenDrop = false;
    }

    void Launch(Vector3 puissance)
    {
        // -- Debug.Log(puissance);
        Poser();

        rb.AddForce(puissance, ForceMode.Impulse);
    }
}