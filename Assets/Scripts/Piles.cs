using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class Piles : Stockable
{
    public override void Interact(bool value)
    {
        base.Interact(value);

        Destroy(gameObject);

        // -- Lorsque je récupère une pile, je la détruit dans ma scène et j'en rajoute une à mon nombre de piles
        Inventaire.inventaire.nbrPiles++;
        
        // -- Rajouter dans mon inventaire 3 charges
        Inventaire.inventaire.currentPilesCapacity += 3;

        Debug.Log("Ceci est mon nombre de charges" + Inventaire.inventaire.currentPilesCapacity);
    }
}