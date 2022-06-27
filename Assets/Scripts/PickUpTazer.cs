using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpTazer : Ramassable
{
    [Tooltip("Le Tazer")]
    public GameObject monTazer;
    public UIManager ui;
    private AudioSource taserSound;
    private MeshRenderer rendTaser;


    public void Awake()
    {
        monTazer = GameObject.FindGameObjectWithTag("Tazer");
        taserSound = GetComponent<AudioSource>();
        rendTaser = GetComponent<MeshRenderer>();
        rendTaser.enabled = true;
    }

    public override void Interact(bool value)
    {
        base.Interact(value);

        if (value)
        {
            // on V�rifie dans StatesPlayer si tazer d�j� ramass� ou pas
            if (!StatesPlayer.statesPlayer.tazerInInventory)
            {
                StartCoroutine(TaserSon());

                // On active ensuite dans state player tazer inventory = true (tazer r�cup�r�)
                StatesPlayer.statesPlayer.tazerInInventory = true;

                // Aussi on le montre en main avec StatesPlayer.statesPlayer.isHoldingTazer = true
                StatesPlayer.statesPlayer.isHoldingTazer = true;
            }
        }
    }

    private IEnumerator TaserSon()
    {
        rendTaser.enabled = false;
        // -- On lance le son de ramassage
        taserSound.Play(0);

        yield return new WaitForSeconds(1);

        // Si pas ramass�, on "ramasse" celui au sol en le d�truisant
        Destroy(gameObject);
    }
}