using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Audio;

public class EffectsVolumeControl : MonoBehaviour
{
    public AudioMixer effectsMixer;
    public Slider effectsSlider;
    public string volumeParam = "EffectsVolume";

    public void Awake()
    {
        effectsSlider.onValueChanged.AddListener(HandleSliderValueChanged);
    }

    private void HandleSliderValueChanged(float value)
    {
        effectsMixer.SetFloat(volumeParam, value);

        // -- Si son trop faible on le coupe
        if (value == -40)
        {
            effectsMixer.SetFloat(volumeParam, -100);
        }
    }

    private void OnDisable()
    {
        // -- Je sauvegarde les paramètres de mon volume d'effets
        PlayerPrefs.SetFloat(volumeParam, effectsSlider.value);
    }

    public void Start()
    {
        // -- Je charge les paramètres de mon volume d'effets
        effectsSlider.value = PlayerPrefs.GetFloat(volumeParam, effectsSlider.value);
    }
}