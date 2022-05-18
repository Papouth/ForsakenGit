using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class UIManager : MonoBehaviour
{
    public static UIManager uiManager;
    [Tooltip("actuellement le Terminal text")]
    public TextMeshProUGUI interactionText;
    [Tooltip("Le panel d'UI de l'interface du terminal")]
    public GameObject terminalInterface;
    [Tooltip("Le slider d'UI de l'interface d'injection")]
    public GameObject sliderInjection;


    private void Awake()
    {
        if (uiManager != null)
        {
            Destroy(gameObject);
            return;
        }

        uiManager = this;
        DisplayTerminalMenu(false);
    }

    public void DisplayInteractionText(bool value, string text = "")
    {
        // -- Texte d'interaction d'objet
        if(interactionText)
        {
            interactionText.text = text;
            interactionText.enabled = value;
        }
    }

    public void DisplayTerminalMenu(bool value)
    {
        // -- Montrer l'UI de mon terminal
        if(terminalInterface)
        {
            terminalInterface.SetActive(value);
        }
    }

    public void DisplayInjectionSlider(bool value)
    {
        // -- Montrer le slider de ma cuve
        if(sliderInjection)
        {
            sliderInjection.SetActive(value);
        }
    }
}