using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Stockable : Interactable
{
    public override void Interact(bool value)
    {
        base.Interact(value);
        // -- Objets qui peuvent être stocké ( piles par exemple )
    }
}
