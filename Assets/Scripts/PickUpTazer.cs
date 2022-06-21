using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PickUpTazer : Ramassable
{
    [Tooltip("Le Tazer")]
    public GameObject monTazer;
    public UIManager ui;

    public void Awake()
    {
        monTazer = GameObject.FindGameObjectWithTag("Tazer");
    }

    public override void Interact(bool value)
    {
        base.Interact(value);

        if (value)
        {
            // on V�rifie dans StatesPlayer si tazer d�j� ramass� ou pas
            if (!StatesPlayer.statesPlayer.tazerInInventory)
            {
                // Si pas ramass�, on "ramasse" celui au sol en le d�truisant
                Destroy(gameObject);

                // On active ensuite dans state player tazer inventory = true (tazer r�cup�r�)
                StatesPlayer.statesPlayer.tazerInInventory = true;

                // Aussi on le montre en main avec StatesPlayer.statesPlayer.isHoldingTazer = true
                StatesPlayer.statesPlayer.isHoldingTazer = true;
            }
        }
    }
}