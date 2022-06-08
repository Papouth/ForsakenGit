using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public abstract class Interactable : MonoBehaviour
{
    [Tooltip("Message affiché avant l'interaction")]
    [SerializeField]
    public string actionText; // -- Mon texte d'interaction

    [SerializeField]
    public bool isTerminal = false; // -- Est ce qu'il s'agit d'un terminal

    [SerializeField]
    public bool isOnlyStockable = false; // -- Est ce que l'objet est uniquement stockable

  

    public virtual void Interact(bool value)
    {
        if (value)
        {
            ShowText(false);
        }
    }

    public virtual void Interact(Transform player)
    {
        if (!player)
        {
            ShowText(false);
        }
    }

    public virtual void ShowText(bool value)
    {
        // -- Montre mon texte d'interaction avec l'objet en face de moi
        UIManager.uiManager?.DisplayInteractionText(value, actionText);
    }
}