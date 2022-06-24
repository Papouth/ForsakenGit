using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CamChanger : MonoBehaviour
{
    [Tooltip("Caméra Principal / celle du joueur")]
    public Camera cam;
    [Tooltip("Medicale")]
    public Camera cameraMedic;
    [Tooltip("Hub")]
    public Camera cameraHub;
    [Tooltip("Sport")]
    public Camera cameraSport;
    [Tooltip("Lab")]
    public Camera cameraLab;
    [Tooltip("PrimEntrée")]
    public Camera cameraPrimEntrée;
    [Tooltip("PrimSortie")]
    public Camera cameraPrimSortie;


    public GameObject doorBttn;
    public GameObject dataBttn;
    public GameObject camBttn;
    public GameObject returnBttn;

    public GameObject camMedicBttn;
    public GameObject camHubBttn;
    public GameObject camSportBttn;
    public GameObject camLabBttn;
    public GameObject camEntréePrimBttn;
    public GameObject camSortiePrimBttn;

    [Tooltip("bouton à part du panel du terminal")]
    public GameObject returnToCamBttn;
    [Tooltip("Le panel d'interaction du terminal")]
    public GameObject panelTerminal;

    public bool onCam;



    public void Start()
    {
        returnToCamBttn.SetActive(false);
        onCam = false;
    }

    public void ChangeButton()
    {
        doorBttn.SetActive(false);
        dataBttn.SetActive(false);
        camBttn.SetActive(false);
        camMedicBttn.SetActive(true);
        camHubBttn.SetActive(true);

        returnBttn.SetActive(true);
    }

    public void ReturnButton()
    {
        // faire disparaitre le boutton returnToCam
        returnToCamBttn.SetActive(false);
        onCam = false;

        // faire apparaitre le panel TerminalInterface
        panelTerminal.SetActive(true);


        doorBttn.SetActive(true);
        dataBttn.SetActive(true);
        camBttn.SetActive(true);
        camMedicBttn.SetActive(false);
        camHubBttn.SetActive(false);

        returnBttn.SetActive(false);

        #region reset des caméras
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;

        // reset cam principale
        cam.depth = 1;
        #endregion
    }

    #region  Différentes Caméra
    public void CamMedic()
    {
        // on enlève la cam principale
        cam.depth = -5;


        // reset cam hub a -2
        cameraHub.depth = -2;

        // switch sur vue cam medic
        cameraMedic.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);
        onCam = true;
    }

    public void CamHub()
    {
        // on enlève la cam principale
        cam.depth = -5;


        // reset cam medic a -3
        cameraMedic.depth = -3;

        // switch sur vue cam hub
        cameraHub.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);
        onCam = true;
    }
    #endregion


    public void ReturnToCamButton()
    {
        #region reset des caméras
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;

        // reset cam principale
        cam.depth = 1;
        #endregion


        // faire apparaitre le Panel TerminalInterface
        panelTerminal.SetActive(true);

        // faire disparaitre le bouton returnToCam
        returnToCamBttn.SetActive(false);
        onCam = false;
    }
}
