using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DataManager : MonoBehaviour
{
    private AudioSource dataAudio;

    public void Start()
    {
        dataAudio = GetComponent<AudioSource>();
    }

    public void PlayData()
    {
        dataAudio.Play(0);
    }
}