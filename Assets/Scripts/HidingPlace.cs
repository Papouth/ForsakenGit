using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HidingPlace : Interactable
{
    public Player player;
    private Collider hideColl;
    private Collider[] hideColls;
    private GameObject personnage;

    [Tooltip("Là où sera tp le joueur")]
    public Transform playerTp;
    private Vector3 lastPos;
    public bool playerHide = false; // permet de dire au robot qu'il ne peux pas entendre ni voir le joueur
    private bool escPressed;
    public Animator animPorteCuve;//Bryan


    public void Awake()
    {
        hideColl = GetComponent<BoxCollider>();
        hideColls = GetComponentsInChildren<BoxCollider>();
        personnage = GameObject.Find("Personnage");
        player = personnage.GetComponent<Player>();

        escPressed = false;
    }

    public override void Interact(bool value)
    {
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
        //si l'objet a le tag cuve le player joue l'anim de la cuve
        if(gameObject.CompareTag("cuve"))
        {
            player.anim.Play("cuveCryo");
            animPorteCuve.SetTrigger("Trigger");//Bryan
        }
        //si non il joue l'anim du casier
        else
        {
            player.anim.Play("ouvrirCasier");
        }

        yield return new WaitForSeconds(1.2f);

        // -- Step1: On l'empeche de bouger
        StatesPlayer.statesPlayer.canMoove = false;

        // -- Step2: On save la position du joueur
        lastPos = new Vector3(player.transform.position.x, player.transform.position.y, player.transform.position.z);


        // -- Step3: On patiente 2 secondes, via une coroutine ( temps de l'animation )
        yield return new WaitForSeconds(2.2f);

        // On affiche le texte pour sortir
        player.hidingText.SetActive(true);

        player.anim.enabled = false;


        // -- Inter Step: On désactive le collider du joueur
        hideColl.enabled = false;
        foreach (var collcomp in hideColls)
        {
            collcomp.enabled = false;
        }


        // -- Step4: On TP le joueur sur le point de tp à l'intérieur de la cachette
        player.transform.position = playerTp.position;

        // -- Step5: On indique que le joueur est bien caché
        playerHide = true;
    }


    public IEnumerator UnHide()
    {
        // -- Step1: Le joueur patiente 2 sec ( animation )
        //yield return new WaitForSeconds(2f);

        player.anim.enabled = true;
        

        //si l'objet a le tag cuve le player joue l'anim sortie cuve cryo
        if(gameObject.CompareTag("cuve"))
        {
            player.anim.Play("sortiCuveCryo");
            animPorteCuve.SetTrigger("Trigger");//Bryan
        }
        //si non il joue l'anim sortie casier
        else
        {
            player.anim.Play("sortiCasier");//modifBryan
        }

        // On cache le texte pour sortir
        player.hidingText.SetActive(false);

        // -- Step2: Le joueur se re tp à sa dernière position enregistré
         //if(!gameObject.CompareTag("cuve")){modifBryan
           // player.transform.position = lastPos;modifBryan
        //}

        // -- Step3: On indique que le joueur n'est plus caché
        StatesPlayer.statesPlayer.isHiding = false;
        playerHide = false;

        // -- Step4:  Le joueur peut de nouveau bouger 
        StatesPlayer.statesPlayer.canMoove = true; // attendre le temps de l'animation avant de pouvoir de nouveau marcher, donc certainement le décaler après le waitforseconds

        yield return new WaitForSeconds(2);

        // -- Inter Step: On désactive le collider du joueur
        hideColl.enabled = true;
        foreach (var collcomp in hideColls)
        {
            collcomp.enabled = true;
        }
    }
}