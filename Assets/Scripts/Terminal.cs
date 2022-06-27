﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Terminal : Interactable
{
    public bool isUsed = false;
    private AudioSource dataAudio;
    public IADialogue IAD; //Richard
    public float DesactiverTPS = 0; //Richard
    public bool desactiverterminal = false;


    public void Start()
    {
        dataAudio = GetComponent<AudioSource>();
    }

    public void Update() //Richard
    {
        if (IAD.TerminalActive)
        {
            desactiverterminal = true;
            DesactiverTPS = DesactiverTPS + Time.deltaTime;
        }

        if (DesactiverTPS >= 13)
        {
            DesactiverTPS = 13;
            IAD.TerminalActive = false;
            desactiverterminal = false;
        }
    }

    public override void Interact(bool value)
    {
       /* // -- Display ou non mon UI de terminal
        UIManager.uiManager?.DisplayTerminalMenu(value);

        StatesPlayer.statesPlayer.isInteractTerminal = value; // -- Si mon joueur interargis avec un terminal
        StatesPlayer.statesPlayer.canMoove = !value; // -- Si mon joueur peut ou non bouger
        StatesPlayer.statesPlayer.canLookAround = !value; // -- Si mon joueur peut regarder autour de lui ou non
        isUsed = value; */

        if (!desactiverterminal) //Richard
        {
            // -- Display ou non mon UI de terminal
            UIManager.uiManager?.DisplayTerminalMenu(value);

            StatesPlayer.statesPlayer.isInteractTerminal = value; // -- Si mon joueur interargis avec un terminal
            StatesPlayer.statesPlayer.canMoove = !value; // -- Si mon joueur peut ou non bouger
            StatesPlayer.statesPlayer.canLookAround = !value; // -- Si mon joueur peut regarder autour de lui ou non
            isUsed = value;
        }
    }

    public void PlayData()
    {
        if (isUsed)
        {
            dataAudio.Play(0);
        }
    }
}