using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

// -- Nécessite le composant états du joueur
[RequireComponent(typeof(StatesPlayer))]
// -- Nécessite le composant keys assignation
[RequireComponent(typeof(KeysAssignation))]
public class Player : MonoBehaviour
{
    #region Variables
    StatesPlayer statesPlayer;
    KeysAssignation keysAssign;

    private Rigidbody rb;
    public Camera visionJoueur; // -- Vue du joueur
    public CapsuleCollider caps; // -- Capsule de mon personnage
    public CamChanger surveillance;
    public Slider slider;
    private Injection inject;
    private Rbts robotSounded;
    public PauseManager pausemenu;


    public LayerMask interactableLayer; // -- GameObjet pouvant interargir
    public LayerMask Ennemi;
    public LayerMask Wall;


    public Interactable lastInteractable = null; // -- Dernier GameObjet avec lequel je pouvais interargir
    public Interactable lastUsedInteractable = null; // -- Dernier GameObjet avec lequel j'ai interargis
    public Interactable currentInteractable = null; // -- GameObjet avec lequel j'interargis


    public int tirMax = 15; // -- Puissance de tir maximum que l'on ne peut pas dépasser
    public int currentWeapon;


    public bool isCrouched = false; // -- Si player accroupis
    public bool tryInteract = false; // -- Si j'essaye de rentrer en interaction
    private bool isWalking = false;
    private bool cheatBool = false; // -- Si mon panel de cheat est ouvert


    private Vector2 vector2;
    [Tooltip("Les armes du joueur")]
    public Transform[] weapons;
    public Transform raylauncher;

    public GameObject panelMort;
    public GameObject returnToCam;
    public GameObject panelCheat;
    public GameObject uiTazer;
    public GameObject cuve;
    public GameObject loadingScreen;
    public GameObject hidingText;
    public GameObject imageContour;
    public GameObject sliderObjet;

    public Slider sensiSlider;
    private Slider puissanceSlider;

    public float speedPivot = 100f;
    public float maxAnglePivot = 15f;
    private float currentAnglePivot = 0f;
    [Tooltip("Distance de propagation du son")]
    public float radius = 4f;
    private float tir = 1f; // -- Puissance du tir d'objets qui augmente avec le temps
    public float playerStrenght; // -- Force de base du joueur lors du lancer d'objets
    [Tooltip("distance zone d'interaction")]
    public float distance = 3f;
    public float offsetX;
    public float rotationSpeedX = 20f; // -- Gère ma vitesse de rotation G/D
    public float rotationSpeedY = 90f; // -- Gère ma vitesse de rotation H/B
    public float persoSpeed = 1f; // -- Souris sensibilité
    private float speedmin =  0.1f;
    private float speedmax =  2f;

    [Range(0f, 0.1f)]
    public float vitesse = 0.1f; // -- Au dessus de 0.1f, le joueur peut traverser le mur


    public Animator anim;
    #endregion


    private void Awake()
    {
        FirstInitialisation();
    }

    private void Start()
    {
        SecondInitialisation();
    }

    public void Update()
    {
        Movement();

        LookAround();

        PlayerInteract();

        TerminalInteraction();

        PlayerThrowObject();

        Weapons();

        ShowTazer();

        PuissanceSlider();

        HoldThrowable();

        InjectionInteraction();

        CheatMenu();

        MouseSensitivity();
    }

    private void FixedUpdate()
    {
        WaitForInteract();
    }


    #region Initialisation
    public void FirstInitialisation()
    {
        loadingScreen.SetActive(true);
        panelMort.SetActive(false);
        panelCheat.SetActive(false);
        hidingText.SetActive(false);

        sliderObjet.SetActive(false);
        puissanceSlider = sliderObjet.GetComponent<Slider>();
        puissanceSlider.minValue = 0;
        puissanceSlider.maxValue = tirMax;

        keysAssign = GetComponent<KeysAssignation>();
        statesPlayer = GetComponent<StatesPlayer>();
        statesPlayer.isInteractTerminal = false; // -- Etat du joueur, est en train d'interargir avec un terminal
        statesPlayer.canMoove = true; // -- Etat du joueur, peut bouger
        statesPlayer.canLookAround = true; // --Etat du joueur, peut regarder autour de lui

        // -- Retirer les caméras
        surveillance.cameraMedic.enabled = false;
        surveillance.cameraHub.enabled = false;

        visionJoueur = GetComponentInChildren<Camera>();
        caps = GetComponent<CapsuleCollider>();
        inject = cuve.GetComponent<Injection>();
    }

    public void SecondInitialisation()
    {
        persoSpeed = 1f;
        sensiSlider.value = persoSpeed;
        sensiSlider.maxValue = speedmax;
        sensiSlider.minValue = speedmin;

        // récupérer l'animation
        anim = GetComponent<Animator>();
        imageContour.SetActive(false);

        // -- Pour Simuler mort joueur pour le moment
        Time.timeScale = 1;

        isCrouched = false;

        rb = GetComponent<Rigidbody>();
        Cursor.lockState = CursorLockMode.Locked; // -- La souris n'est plus affiché sur l'écran
        Cursor.visible = false;

        // l'arme de base sont les mains par défaut
        currentWeapon = 0;
        statesPlayer.tazerInInventory = false;
        loadingScreen.SetActive(false);
    }

    #endregion


    #region Player Movement
    public void Movement()
    {
        if (statesPlayer.canMoove)
        {
            Lean();

            // -- Accroupis
            if (Input.GetKeyDown(keysAssign.crouchKey))
            {
                Crouch();
            }
        }
    }

    public void PlayerDeplacement()
    {
        if (statesPlayer.canMoove)
        {
            // -- Etat du joueur peut bouger
            rb.MovePosition(transform.position + transform.forward * Input.GetAxis("Vertical") * vitesse + transform.right * Input.GetAxis("Horizontal") * vitesse);
            vector2 = new Vector2(Input.GetAxis("Vertical"), Input.GetAxis("Horizontal"));

            if (vector2.magnitude > 0)
            {
                //anim de marche
                isWalking = true;
                //anim.Play("Idlemouvemantmain");

                anim.SetBool("Move", true);
            }
            else
            {
                //anim d'idle
                isWalking = false;
                //anim.Play("Idle");

                anim.SetBool("Move", false);
            }
        }
    }

    public void Crouch()
    {
        if (statesPlayer.isCrouch)
        {
            anim.enabled = false;
            vitesse = 0.1f; // vitesse de mon joueur
            isCrouched = false; // check si est accroupis

            caps.height = 4;
            StartCoroutine(AnimCrouch());
        }
        else
        {
            anim.enabled = false;
            // Crouch
            isCrouched = true; // check si est accroupis

            caps.height = 1.5f;

            vitesse = 0.05f; // vitesse de mon joueur
            StartCoroutine(AnimCrouch());
        }

        statesPlayer.isCrouch = !statesPlayer.isCrouch;
    }

    private IEnumerator AnimCrouch()
    {
        yield return new WaitForSeconds(0.39f);
        anim.enabled = true;
    }

    public void Lean()
    {
        if (Input.GetKey(keysAssign.leanLeftKey))
        {
            // -- LEFT
            currentAnglePivot += speedPivot * Time.deltaTime;
            currentAnglePivot = Mathf.Clamp(currentAnglePivot, -maxAnglePivot, maxAnglePivot);
            transform.rotation = Quaternion.Euler(0, transform.localRotation.eulerAngles.y, currentAnglePivot);

            // (ma valeur de rotation actuel sur X, ma valeur de rotation actuel sur Y, currentAnglePivot)
        }
        else if (Input.GetKey(keysAssign.leanRightKey))
        {
            // -- RIGHT
            currentAnglePivot -= speedPivot * Time.deltaTime;
            currentAnglePivot = Mathf.Clamp(currentAnglePivot, -maxAnglePivot, maxAnglePivot);
            transform.rotation = Quaternion.Euler(0, transform.localRotation.eulerAngles.y, currentAnglePivot);

            // (ma valeur de rotation actuel sur X, ma valeur de rotation actuel sur Y, currentAnglePivot)
        }
        else
        {
            // -- Si pas de touche enfoncer, alors on reste droit

            // reset en Z
            currentAnglePivot = 0f;
            transform.rotation = Quaternion.Euler(0, transform.localRotation.eulerAngles.y, currentAnglePivot);
            // (ma valeur de rotation actuel sur X, ma valeur de rotation actuel sur Y, currentAnglePivot)
        }
    }

    public void LookAround()
    {
        if (statesPlayer.canLookAround)
        {
            float yAxis = Input.GetAxis("Mouse Y");
            visionJoueur.transform.Rotate(Vector3.right * yAxis * rotationSpeedY * persoSpeed * Time.deltaTime, Space.Self);

            Quaternion localRotationBase = visionJoueur.transform.localRotation;
            localRotationBase.x = Mathf.Clamp(localRotationBase.x, -0.5f, 0.5f);
            visionJoueur.transform.localRotation = localRotationBase;

            transform.Rotate(Vector3.up * Input.GetAxis("Mouse X") * rotationSpeedX * persoSpeed * Time.deltaTime, Space.Self);
        }
    }

    public void MouseSensitivity()
    {
        persoSpeed = sensiSlider.value;
    }

    public void PlayerSendSound()
    {
        if (!isCrouched)
        {
            // -- A chaque fois que le joueur touche le sol il fait un OverlapShere, et si dans la zone se trouve un ennemi, il le détecte
            Collider[] hitColliders = Physics.OverlapSphere(transform.position, radius, Ennemi);


            foreach (var colliderHit in hitColliders)
            {
                // -- J'envoi un raycast de mon joueur vers mes ennemis touché pour calculer la distance qui les séparent
                RaycastHit hitRobot;

                //Debug.DrawRay(raylauncher.transform.position, colliderHit.transform.GetChild(0).position - raylauncher.transform.position, Color.blue);
                if (Physics.Raycast(raylauncher.transform.position, colliderHit.transform.GetChild(0).position - raylauncher.transform.position, out hitRobot, 12f, Wall))
                {
                    // -- Si il y a un mur alors robot n'entend pas et continue sa ronde
                    if (colliderHit.CompareTag("RobotLarbin"))
                    {
                        robotSounded = colliderHit.GetComponent<Rbts>();
                        robotSounded.emissifMat.SetColor("_BaseColor", robotSounded.safe);
                        robotSounded.emissifMat.SetColor("_EmissiveColor", robotSounded.safe);
                    }
                    return;
                }
                else if (Physics.Raycast(raylauncher.transform.position, colliderHit.transform.GetChild(0).position - raylauncher.transform.position, out hitRobot, 12f))
                {
                    Interactable interact = hitRobot.transform.GetComponent<Interactable>();
                    if (interact)
                    {
                            //Debug.Log("j'ai entendu un bruit");
                        if (colliderHit.CompareTag("RobotLarbin"))
                        {
                            robotSounded = colliderHit.GetComponent<Rbts>();
                            robotSounded.emissifMat.SetColor("_BaseColor", robotSounded.danger);
                            robotSounded.emissifMat.SetColor("_EmissiveColor", robotSounded.danger);
                        }

                        interact.Interact(transform);
                    }
                }
            }

            if (hitColliders.Length == 0)
            {
                imageContour.SetActive(false);
            }
        }
    }
    #endregion


    #region Player Interaction
    public void PlayerInteract()
    {
        // -- Si j'appuie sur ma touche d'interaction et que je n'ai pas en main le tazer
        if (Input.GetKeyDown(keysAssign.interactionKey)) // !statesPlayer.isHoldingTazer
        {
            // Si je n'ai pas d'objet lançable
            if (currentInteractable && !statesPlayer.isHoldingThrowableItem)
            {
                currentInteractable.Interact(false);
                currentInteractable = null;


                // bouton return en false
                returnToCam.SetActive(false);
            }
            // Si j'ai un object lançable et que j'interargis avec un terminal
            else if (currentInteractable && statesPlayer.isHoldingThrowableItem && statesPlayer.isInteractTerminal || statesPlayer.isHiding)
            {
                currentInteractable.Interact(false);
                currentInteractable = null;


                // bouton return en false
                returnToCam.SetActive(false);
            }
            else
            {
                // -- Essaye d'interargir
                tryInteract = true;
            }
        }
        else if (Input.GetKeyDown(keysAssign.escapeKey) && !surveillance.onCam)
        {
            if (currentInteractable && statesPlayer.isInteractTerminal || statesPlayer.isHiding)
            {
                currentInteractable.Interact(false);
                currentInteractable = null;


                // bouton return en false
                returnToCam.SetActive(false);
            }
        }
    }

    public void TerminalInteraction()
    {
        // -- Si on a un panel d'ouvert alors on affiche la souris, et si le panel est fermé alors on recache la souris
        if (statesPlayer.isInteractTerminal)
        {
            // -- Mettre les caméras
            surveillance.cameraMedic.enabled = true;
            surveillance.cameraHub.enabled = true;

            // -- Déplacer le joueur en face du terminal pour réaliser parfaitement l'animation
            // transform.position = playerTp.position; // playerTp = le transform ou doit se mettre mon joueur (ne pas oublier de faire la rotation)
            //transform.parent = StatesPlayer.statesPlayer.rightHand;
            //transform.localPosition = Vector3.zero;
            //transform.localRotation = Quaternion.identity;


            anim.SetTrigger("terminal");

            statesPlayer.canMoove = false;
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;

            // -- Si on est sur les caméras permet de retourner au menu des caméras         
            if (Input.GetKey(keysAssign.escapeKey) && surveillance.onCam)
            {
                anim.enabled = true;
                surveillance.ReturnToCamButton();
            }
        }
        else
        {
            // -- Retirer les caméras
            surveillance.cameraMedic.enabled = false;
            surveillance.cameraHub.enabled = false;


            anim.ResetTrigger("terminal");
            // On remet a 1 le depth de la camera du joueur
            visionJoueur.depth = 1;
        }
    }

    public void InjectionInteraction()
    {
        if (statesPlayer.isStopingInjection)
        {
            if (slider.value < slider.maxValue)
            {
                anim.SetTrigger("terminal");
                // -- valeur si on sort le jeu : slider.value += Time.time * 0.04f;
                slider.value += Time.time * 0.18f; // vitesse pour le jury = 0.32f

                // -- Call le robot boss quand y'aura le son
            }
            else if (slider.value >= slider.maxValue)
            {
                anim.ResetTrigger("terminal");
                // Si temps écouler et que joueur n'a pas stopper l'injection -> anim de la cuve qui se vide du liquide
                Destroy(inject);
                Destroy(slider.gameObject);
                statesPlayer.isStopingInjection = false;
            }
        }
    }

    public void Weapons()
    {
        if (Input.GetKeyDown(keysAssign.handKey) || Input.GetAxis("Mouse ScrollWheel") > 0)
        {
            // Mains
            statesPlayer.isHoldingTazer = false;


            // -- Anim des mains
            if (statesPlayer.canMoove)
            {
                anim.SetBool("Taser", false);
                anim.SetTrigger("hand");
            }

            // Peut ramasser des objets
            statesPlayer.canPickItem = true;
        }

        if (Input.GetKeyDown(keysAssign.tazerKey) || Input.GetAxis("Mouse ScrollWheel") < 0 && statesPlayer.tazerInInventory)
        {
            // Tazer
            statesPlayer.isHoldingTazer = true;


            // -- Anim du taser
            if (statesPlayer.canMoove)
            {
                anim.ResetTrigger("hand");
                anim.SetBool("Taser", true);
            }

            // Ne peut pas ramasser d'objets
            statesPlayer.canPickItem = false;
        }
    }

    public void ChangeWeapons(int num)
    {
        currentWeapon = num;

        for (int i = 0; i < weapons.Length; i++)
        {
            if (i == num)
            {
                weapons[i].gameObject.SetActive(true);
            }
            else
            {
                weapons[i].gameObject.SetActive(false);
            } 
        }
    }

    public void ShowTazer()
    {
        if (statesPlayer.isHoldingTazer == true)
        {
            ChangeWeapons(1);
            uiTazer.SetActive(true);
            sliderObjet.SetActive(false);
        }
        else if (statesPlayer.isHoldingTazer == false)
        {
            ChangeWeapons(0);
            uiTazer.SetActive(false);
        }
    }

    public void HoldThrowable()
    {
        if (statesPlayer.isHoldingThrowableItem)
        {
            anim.SetBool("Ramasser", true);
            if (statesPlayer.rightHand.GetChild(0).CompareTag("Boite"))
            {
                
            }
            else if (statesPlayer.rightHand.GetChild(0).CompareTag("Clé"))
            {

            }
            else if (statesPlayer.rightHand.GetChild(0).CompareTag("Marteau"))
            {

            }
            else if (statesPlayer.rightHand.GetChild(0).CompareTag("Chalumeau"))
            {

            }
            else if (statesPlayer.rightHand.GetChild(0).CompareTag("Tablette"))
            {

            }
        }
    }

    public void PlayerThrowObject()
    {
        if (ActionManager.OnLaunchObject != null)
        {
            if (Input.GetMouseButton(0) && !statesPlayer.isHoldingTazer && !statesPlayer.isInteractTerminal)
            {
                // -- J'affiche ma barre de puissance pour le lancer de mon objet 
                sliderObjet.SetActive(true);

                // -- Variable pour multiplier la puissance de lancer de mon objet 
                tir += Time.deltaTime * playerStrenght;
                if (tir >= tirMax)
                {
                    tir = tirMax;
                }
                statesPlayer.isHoldingThrowableItem = false;
            }
            if (Input.GetMouseButtonUp(0) && !statesPlayer.isHoldingTazer && !statesPlayer.isInteractTerminal)
            {
                // -- Player throw object -> anim
                ActionManager.OnLaunchObject(visionJoueur.transform.forward * tir);
                currentInteractable.Interact(false);
                currentInteractable = null;
                tir = 0;
                statesPlayer.isHoldingThrowableItem = false;

                // -- Je cache ma barre de puissance
                sliderObjet.SetActive(false);
            }
        }
    }

    public void PuissanceSlider()
    {
        puissanceSlider.value = tir; 
    }

    public void WaitForInteract()
    {
        bool haveSeeInteractable = false;

        // -- Si état de mon joueur n'interargis pas avec un terminal
        if (!statesPlayer.isInteractTerminal)
        {
            RaycastHit interactableChecker;
            for (int i = -1; i < 2; i++) // -- Trois faux points placé dans l'espace avec "i"
            {
                Vector3 fakePos = visionJoueur.transform.TransformPoint(new Vector3(offsetX * i, 0, distance));
                Vector3 direction = Vector3.Normalize(fakePos - visionJoueur.transform.position);

                // -- mon LayerInteractable
                if (Physics.Raycast(visionJoueur.transform.position, direction, out interactableChecker, distance, interactableLayer))
                {
                    // -- Instance = objet avec lequel je peux interargir
                    Interactable instance = interactableChecker.transform.GetComponent<Interactable>();


                    if (instance)
                    {
                        if (tryInteract)
                        {
                            // -- Je peux interargir avec mon objet
                            instance.Interact(true);

                            if (!instance.isOnlyStockable)
                            {
                                currentInteractable = instance;
                            }
                        }
                        else
                        {
                            // -- On met le texte d'interaction 
                            instance.ShowText(true);
                        }

                        lastInteractable = instance;

                        haveSeeInteractable = true;
                    }
                    break;

                }
            }

            if (!haveSeeInteractable && lastInteractable)
            {
                // -- On enlève le texte d'interaction
                lastInteractable.ShowText(false);
                lastInteractable = null;
            }
        }

        PlayerDeplacement();
        tryInteract = false;
    }
    #endregion


    #region Player Collision
    public void OnCollisionEnter(Collision other)
    {
        if (Time.timeSinceLevelLoad < 3f)
        {
            return;
        }
        if (!isCrouched && isWalking == true)
        {
            PlayerSendSound();
        }
    }

    public void OnCollisionStay(Collision other)
    {
        if (Time.timeSinceLevelLoad < 3f)
        {
            return;
        }
        if (!isCrouched && isWalking == true)
        {
            PlayerSendSound();
        }
    }

    public void OnCollisionExit(Collision other)
    {
        if (Time.timeSinceLevelLoad < 3f)
        {
            return;
        }
        if (!isCrouched && isWalking == true)
        {
            Collider[] hitColliders = Physics.OverlapSphere(transform.position, radius, Ennemi);


            foreach (var colliderHit in hitColliders)
            {
                if (colliderHit.CompareTag("RobotLarbin"))
                {
                    robotSounded = colliderHit.GetComponent<Rbts>();
                    robotSounded.emissifMat.SetColor("_BaseColor", robotSounded.safe);
                    robotSounded.emissifMat.SetColor("_EmissiveColor", robotSounded.safe);
                    imageContour.SetActive(false);
                }
            }
        }
    }
    #endregion


    #region Other
    public void Dead()
    {
        // display txt vs etes mort
        panelMort.SetActive(true);
        sliderObjet.SetActive(false);
        Time.timeScale = 0;
    }

    public void CheatMenu()
    {
        if (!cheatBool && Input.GetKeyDown(keysAssign.cheatMenuKey))
        {
            panelCheat.SetActive(true);
            cheatBool = true;
        }
        else if (cheatBool && Input.GetKeyDown(keysAssign.cheatMenuKey))
        {
            panelCheat.SetActive(false);
            cheatBool = false;
        }

        // si pas de cheat on et pas de terminal et pas caché et ne stop pas injection
        if (!cheatBool && !statesPlayer.isInteractTerminal && !statesPlayer.isHiding && !statesPlayer.isStopingInjection && !pausemenu.isPaused)
        {
            Cursor.lockState = CursorLockMode.Locked;
            Cursor.visible = false;
            statesPlayer.canMoove = true;
            statesPlayer.canLookAround = true;
        }
        else if (cheatBool || statesPlayer.isInteractTerminal) // si je cheat OU que je suis sur un terminal
        {
            Cursor.lockState = CursorLockMode.None;
            Cursor.visible = true;
            statesPlayer.canMoove = false;
            statesPlayer.canLookAround = false;
        }
    }

    private void OnDrawGizmos()
    {
        if (!isCrouched)
        {
            // -- Je dessine ma sphère dans ma scène 
            Gizmos.color = Color.white;
            Gizmos.DrawWireSphere(transform.position, radius);
        }
    }
    #endregion
}