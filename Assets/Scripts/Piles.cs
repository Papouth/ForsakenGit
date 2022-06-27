using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Piles : Stockable
{
    private AudioSource pileSound;
    private MeshRenderer rend;

    public void Start()
    {
        pileSound = GetComponent<AudioSource>();
        rend = GetComponent<MeshRenderer>();
        rend.enabled = true;
    }

    public override void Interact(bool value)
    {
        base.Interact(value);

        StartCoroutine(PileSon());
        
        // -- Lorsque je récupère une pile, je la détruit dans ma scène et j'en rajoute une à mon nombre de piles
        Inventaire.inventaire.nbrPiles++;
        
        // -- Rajouter dans mon inventaire 3 charges
        Inventaire.inventaire.currentPilesCapacity += 3;
    }

    private IEnumerator PileSon()
    {
        rend.enabled = false;
        // -- On lance le son de ramassage
        pileSound.Play(0);

        yield return new WaitForSeconds(1);

        Destroy(gameObject);
    }
}