using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Terminal : Interactable
{
    public bool isUsed = false;

    public override void Interact(bool value)
    {
        // -- Display ou non mon UI de terminal
        UIManager.uiManager?.DisplayTerminalMenu(value);

        StatesPlayer.statesPlayer.isInteractTerminal = value; // -- Si mon joueur interargis avec un terminal
        StatesPlayer.statesPlayer.canMoove = !value; // -- Si mon joueur peut ou non bouger
        StatesPlayer.statesPlayer.canLookAround = !value; // -- Si mon joueur peut regarder autour de lui ou non
        isUsed = value;
    }
}