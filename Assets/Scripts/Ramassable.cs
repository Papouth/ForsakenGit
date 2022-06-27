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
    private SphereCollider sphereCol;

    public bool isGrounded = false; // -- Si l'objet touche le sol, un mur ou un objet
    public bool haveBeenDrop = false; // -- A été laché
    public bool launchable = true; // -- Pour mes objets qui peuvent être lancé

    public Renderer rend;
    public Shader normalShader;
    public Shader interactShader;

    private AudioSource objetSound;
    public AudioClip colSound;
    public AudioClip pickup;



    public void Start()
    {
        // -- Les objets ne doivent absolument pas avoir la variable en vrai, jusqu'à temps qu'on les prennent
        isGrounded = false;
        colObjet = GetComponent<Collider>();
        sphereCol = GetComponent<SphereCollider>();
        objetSound = GetComponent<AudioSource>();

        FindRenderer();
        normalShader = Shader.Find("HDRP/Lit");
        interactShader = Shader.Find("Shader Graphs/Outline");
        colSound = Resources.Load("projet objet jeter") as AudioClip;
        pickup = Resources.Load("pickup Objects") as AudioClip;
    }

    public void FindRenderer()
    {
        if (transform.childCount > 0)
        {
            rend = transform.GetComponentInChildren<Renderer>();
        }
        else if (transform.childCount == 0)
        {
            rend = GetComponent<Renderer>();
        }
    }

    public void OnCollisionEnter(Collision other)
    {
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
            if(!gameObject.CompareTag("Tazer"))
            {
                objetSound.PlayOneShot(colSound);
            }

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
            // -- On lance le son de ramassage
            objetSound.PlayOneShot(pickup);

            // -- Je place mon objet dans ma main droite
            transform.parent = StatesPlayer.statesPlayer.rightHand;
            transform.localPosition = Vector3.zero;
            transform.localRotation = Quaternion.identity; // reset la rotation de l'objet


            if (gameObject.CompareTag("Tablette"))
            {
                // -- S'il s'agit d'une tablette, prend la position en main ...
                transform.localPosition = new Vector3(-0.00015f, 0.00545f, -0.00164f);
                transform.localRotation = Quaternion.Euler(-64.358f, -194.943f, -39.939f);
            }
            else if (gameObject.CompareTag("Clé"))
            {
                // -- S'il s'agit d'une clé a molette, prend la position en main ...
                transform.localPosition = new Vector3(-0.00075f, 0.00069f, 0.00061f);
                transform.localRotation = Quaternion.Euler(179.945f, 32.11099f, 29.951f);
            }
            else if (gameObject.CompareTag("Marteau"))
            {
                // -- S'il s'agit d'un marteau, prend la position en main ...
                transform.localPosition = new Vector3(-0.00067f, 0.00052f, 0.0005f);
                transform.localRotation = Quaternion.Euler(182.324f, 58.664f, 22.164f);
            }
            else if (gameObject.CompareTag("Chalumeau"))
            {
                // -- S'il s'agit d'un chalumeau, prend la position en main ...
                transform.localPosition = new Vector3(-0.000784f, 0.000621f, 0.000504f);
                transform.localRotation = Quaternion.Euler(-44.429f, -67.592f, 88.24f);
            }

            rb.isKinematic = true; // -- Le rigidbody de mon objet passe en kinematic pour qu'il ne bouge pas

            // -- Je désactive le collider de mon objet quand je l'ai en main
            colObjet.enabled = false;
            sphereCol.enabled = false;

            // mettre l'objet sans le contour
            rend.material.shader = normalShader;


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
        transform.parent = null; // erreur ici relier avec le script pickup tazer
        rb.isKinematic = false;
        haveBeenDrop = true;

        // -- Remettre le collider de mon objet lançable
        colObjet.enabled = true;
        sphereCol.enabled = true;

        // mettre l'objet sans le contour
        rend.material.shader = interactShader;

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