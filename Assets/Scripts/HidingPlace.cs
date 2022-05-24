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



    public void Awake()
    {
        hideColl = GetComponent<BoxCollider>();
        hideColls = GetComponentsInChildren<BoxCollider>();
        personnage = GameObject.Find("Personnage");
        player = personnage.GetComponent<Player>();
    }

    public override void Interact(bool value)
    {
        StatesPlayer.statesPlayer.isHiding = value; // -- Si mon joueur interargi avec le collider
        Hide();
    }

    public void Hide()
    {
        if (StatesPlayer.statesPlayer.isHiding == true && playerHide == false)
        {
            StartCoroutine(HideAnimation());
        }

        // -- Si ne fonctionne pas à cause du collider alors, on mettra un Input spécialement pour permettre au joueur de sortir de sa cachette
        if (Input.GetKey(KeysAssignation.keysAssign.interactionKey) && playerHide == true)
        {
            StartCoroutine(UnHide());
        }
    }

    public void Update()
    {
        IsHiding();
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
        player.anim.Play("casier");

        yield return new WaitForSeconds(1.2f);

        // -- Step1: On l'empeche de bouger
        StatesPlayer.statesPlayer.canMoove = false;

        // -- Step2: On save la position du joueur
        lastPos = new Vector3(player.transform.position.x, player.transform.position.y, player.transform.position.z);


        // -- Step3: On patiente 2 secondes, via une coroutine ( temps de l'animation )
        yield return new WaitForSeconds(2f);

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
        yield return new WaitForSeconds(2f);

        player.anim.enabled = true;


        // -- Inter Step: On désactive le collider du joueur
        hideColl.enabled = true;
        foreach (var collcomp in hideColls)
        {
            collcomp.enabled = true;
        }

        // On cache le texte pour sortir
        player.hidingText.SetActive(false);

        // -- Step2: Le joueur se re tp à sa dernière position enregistré
        player.transform.position = lastPos;

        // -- Step3: On indique que le joueur n'est plus caché
        StatesPlayer.statesPlayer.isHiding = false;
        playerHide = false;

        // -- Step4:  Le joueur peut de nouveau bouger 
        StatesPlayer.statesPlayer.canMoove = true;
    }
}