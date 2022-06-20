using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class MusicVolumeControl : MonoBehaviour
{
    public AudioMixer musicMixer;
    public Slider musicSlider;
    public string volumeParam = "MasterVolume";

    public void Awake()
    {
        musicSlider.onValueChanged.AddListener(HandleSliderValueChanged);
    }

    private void HandleSliderValueChanged(float value)
    {
        musicMixer.SetFloat(volumeParam, value);

        // -- Si son trop faible on le coupe
        if(value == -40) 
        {
            musicMixer.SetFloat(volumeParam, -100);
        }
    }

    private void OnDisable()
    {
        // -- Je sauvegarde les paramètres de mon volume
        PlayerPrefs.SetFloat(volumeParam, musicSlider.value);
    }

    public void Start()
    {
        // -- Je charge les paramètres de mon volume
        musicSlider.value = PlayerPrefs.GetFloat(volumeParam, musicSlider.value);
    }
}