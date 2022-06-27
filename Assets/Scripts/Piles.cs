using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Audio;


// -- Nécessite le composant AudioSource
[RequireComponent(typeof(AudioSource))]
public class Piles : Stockable
{
    private AudioSource pileSound;
    private MeshRenderer rend;
    public AudioClip pileClip;
    public AudioMixerGroup effects;

    public void Start()
    {
        pileSound = GetComponent<AudioSource>();
        pileSound.playOnAwake = false;
        pileSound.outputAudioMixerGroup = effects;
        rend = GetComponent<MeshRenderer>();
        rend.enabled = true;
        pileClip = Resources.Load("pickup Objects") as AudioClip;
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
        pileSound.PlayOneShot(pileClip);

        yield return new WaitForSeconds(1);

        Destroy(gameObject);
    }
}