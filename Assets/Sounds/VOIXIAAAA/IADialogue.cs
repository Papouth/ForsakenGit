using System.Collections;
using System.Collections.Generic;
using UnityEngine;


public class IADialogue : MonoBehaviour
{
    public bool IATrigger = false;
    public GameObject IA;
    public Animator AnimTable;
    public AudioSource AudioIA;
    public bool TerminalActive = false;


    void Start()
    {
        IA.SetActive(false);
    }

    void Update()
    {
        SpawnIA();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.CompareTag("Player"))
        {
            IATrigger = true;
        }
    }

    void SpawnIA()
    {
        if (IATrigger)
        {
            IA.SetActive(true);
            AnimTable.SetBool("TriggerTable", true);
            AudioIA.Play(0);
            TerminalActive = true;

            Destroy(gameObject);
        }
    }
}