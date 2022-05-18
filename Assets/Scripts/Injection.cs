using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Injection : Interactable
{
    public bool isStoping = false;


    public override void Interact(bool value)
    {
        // -- Display ou non mon UI de sliderInjection
        UIManager.uiManager?.DisplayInjectionSlider(value);


        StatesPlayer.statesPlayer.isStopingInjection = value; // -- Si mon joueur contre l'injection
        StatesPlayer.statesPlayer.canMoove = !value; // -- Si mon joueur peut ou non bouger
        isStoping = value;
    }
}
