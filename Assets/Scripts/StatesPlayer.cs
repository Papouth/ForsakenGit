using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class StatesPlayer : MonoBehaviour
{
    public static StatesPlayer statesPlayer; // -- Les états de mon joueur

    private void Awake()
    {
        if (statesPlayer)
        {
            Destroy(gameObject);
            return;
        }
        statesPlayer = this;
    }

    public bool isInteractTerminal = false; // -- Interaction avec terminal
    public bool isInteractObject = false; // -- Interaction avec Objet
    public bool isStopingInjection = false; // -- Stop l'injection
    public Transform rightHand; // -- Ma main droite
    public bool canMoove = true; // -- Peut bouger
    public bool isCrouch = false; // -- Est accroupis

    public bool isHiding = false; // -- Si mon joueur se cache
    public bool canLookAround = false; // -- Si mon joueur peut regarder autour de lui

    public bool isHoldingTazer = false; // -- Si j'ai mon tazer visible en main
    public bool tazerInInventory = false; // -- Si j'ai ramasser mon tazer
    public bool canPickItem = false; // -- Si je peux ramasser un objet
    public bool isHoldingThrowableItem = false; // -- Si j'ai un objet lançable en main
    public bool isDead = false; // -- Savoir si le joueur est mort
}