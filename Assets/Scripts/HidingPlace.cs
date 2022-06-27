using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HidingPlace : Interactable
{
    public Player player;
    private Collider hideColl;
    private Collider[] hideColls;
    private GameObject personnage;

    public Transform tpIn; // 2
    [Tooltip("Là où sera tp le joueur")]
    public Transform playerTp; //3
    public Transform tpOut; // 4

    //private Vector3 lastPos;
    public bool playerHide = false; // permet de dire au robot qu'il ne peux pas entendre ni voir le joueur
    private bool escPressed;
    public Animator animPorteCuve;//Bryan
    public Animator animCasierPorte;//Bryan
    private AudioSource cachetteSound;
    public AudioClip ouverture;
    public AudioClip fermeture;


    public void Awake()
    {
        hideColl = GetComponent<BoxCollider>();
        hideColls = GetComponentsInChildren<BoxCollider>();
        personnage = GameObject.Find("Personnage");
        player = personnage.GetComponent<Player>();
        cachetteSound = GetComponent<AudioSource>();

        escPressed = false;
    }

    public override void Interact(bool value)
    {
        StatesPlayer.statesPlayer.isHiding = value; // -- Si mon joueur interargi avec le collider
        Hide();

        if (!escPressed)
        {
            StatesPlayer.statesPlayer.isHiding = value; // -- Si mon joueur interargi avec le collider
            Hide();
        }
        else if (escPressed)
        {
            StatesPlayer.statesPlayer.isHiding = value; // -- On met la valeur opposé pour ne pas avoir a réappuyer une seconde fois sur la touche d'interaction | value = pour l'editor et !value = pour la build
            Hide();
            escPressed = false;
        }
    }

    public void Hide()
    {
        if (StatesPlayer.statesPlayer.isHiding && !playerHide)
        {
            StartCoroutine(HideAnimation());
        }
        
        if (Input.GetKey(KeysAssignation.keysAssign.interactionKey) && playerHide)
        {
            StartCoroutine(UnHide());
        }
    }

    public void Exitplace()
    {
        // -- Permet d'appuyer sur échap pour quitter sa cachette
        if (Input.GetKey(KeysAssignation.keysAssign.escapeKey) && playerHide)
        {
            escPressed = true;
            StatesPlayer.statesPlayer.isHiding = false;
            StartCoroutine(UnHide());
        }
    }

    public void Update()
    {
        IsHiding();

        Exitplace();
    }

    public void IsHiding()
    {
        if (playerHide)
        {
            StatesPlayer.statesPlayer.canMoove = false;
        }
    }

    public IEnumerator HideAnimation()
    {
        // -- Step1: On l'empeche de bouger
        StatesPlayer.statesPlayer.canMoove = false;
        StatesPlayer.statesPlayer.canLookAround = false;


        if (gameObject.CompareTag("cuve"))
        {
            player.anim.Play("cuveCryo");
            cachetteSound.PlayOneShot(ouverture);


            player.transform.localPosition = tpIn.position; 
            player.transform.rotation = Quaternion.Euler(0f, 90f, 0f);

            animPorteCuve.SetTrigger("Trigger");

            yield return new WaitForSeconds(3.2f);
        }
        // -- Sinon il joue l'anim du casier
        else
        {
            animCasierPorte.SetTrigger("CasierInteract");

            hideColl.enabled = false;
            foreach (var collcomp in hideColls)
            {
                collcomp.enabled = false;
            }

            // -- Tp du joueur devant le casier 
            tpIn = transform.GetChild(2);
            player.transform.position = tpIn.position;
            player.transform.rotation = tpIn.rotation;

            player.anim.Play("ouvrirCasier");
        }

        // -- Step3: On patiente 2 secondes, via une coroutine ( temps de l'animation )
        yield return new WaitForSeconds(1.8f);

        player.anim.enabled = false;

        StatesPlayer.statesPlayer.canLookAround = true;

        // -- Inter Step: On désactive le collider du joueur
        hideColl.enabled = false;
        foreach (var collcomp in hideColls)
        {
            collcomp.enabled = false;
        }

        // -- On replace la vue du joueurpour être face à la vitre / aux grilles
        if (gameObject.CompareTag("cuve"))
        {
            player.transform.position = playerTp.position;
            player.transform.rotation = Quaternion.Euler(0f, -90f, 0f);
        }
        else
        {
            // -- Tp du joueur à l'intérieur du casier avec une bonne orientation
            playerTp = transform.GetChild(3);
            player.transform.position = playerTp.position;
            player.transform.rotation = playerTp.rotation;
        }

        // -- Step5: On indique que le joueur est bien caché
        playerHide = true;

        // On affiche le texte pour sortir
        player.hidingText.SetActive(true);
    }


    public IEnumerator UnHide()
    {
        player.anim.enabled = true;
        StatesPlayer.statesPlayer.canLookAround = false;


        // -- Si l'objet a le tag cuve, le player joue l'anim sortie cuve cryo
        if (gameObject.CompareTag("cuve"))
        {
            player.anim.Play("sortiCuveCryo");
            cachetteSound.PlayOneShot(fermeture);


            player.transform.position = tpOut.position;
            player.transform.rotation = Quaternion.Euler(0f, -90f, 0f);

            animPorteCuve.SetTrigger("Trigger");
        }
        // -- Sinon il joue l'anim sortie casier
        else
        {
            player.anim.Play("sortiCasier");

            // -- Tp du joueur à l'extérieur du casier avec une bonne orientation
            tpOut = transform.GetChild(4);
            player.transform.position = tpOut.position;
            player.transform.rotation = tpOut.rotation;

            animCasierPorte.SetTrigger("CasierInteract");
        }

        // -- On cache le texte pour sortir
        player.hidingText.SetActive(false);

        // -- Step3: On indique que le joueur n'est plus caché
        StatesPlayer.statesPlayer.isHiding = false;
        playerHide = false;

        yield return new WaitForSeconds(2f);


        // -- Step4:  Le joueur attend le temps de l'animation avant de pouvoir de nouveau marcher et bouger
        StatesPlayer.statesPlayer.canMoove = true;
        StatesPlayer.statesPlayer.canLookAround = true;


        // -- Inter Step: On désactive le collider du joueur
        hideColl.enabled = true;
        foreach (var collcomp in hideColls)
        {
            collcomp.enabled = true;
        }
    }
}