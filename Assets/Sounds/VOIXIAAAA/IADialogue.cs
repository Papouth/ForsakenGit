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
    // Start is called before the first frame update
    void Start()
    {
        IA.SetActive(false);
        
    }

    // Update is called once per frame
    void Update()
    {
        SpawnIA();
    }

    private void OnTriggerEnter(Collider other)
    {
        if (other.gameObject.tag == "Player")
        {
            IATrigger = true;
        }
    }

    void SpawnIA()
    {
        if (IATrigger == true)
        {
            IA.SetActive(true);
            AnimTable.SetBool("TriggerTable", true);
            AudioIA.Play();
            TerminalActive = true;

            Destroy(this.gameObject);
        }

    }


}
