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
    public bool onCamMedic;
    public bool onCamHub;
    public bool onCamSport;
    public bool onCamLab;
    public bool onCamEntréePrim;
    public bool onCamSortiePrim;



    public void Start()
    {
        returnToCamBttn.SetActive(false);
        onCam = false;

        onCamMedic = false;
        onCamHub = false;
        onCamSport = false;
        onCamLab =  false;
        onCamEntréePrim = false;
        onCamSortiePrim = false;

        camMedicBttn.SetActive(false);
        camHubBttn.SetActive(false);
        camSportBttn.SetActive(false);
        camLabBttn.SetActive(false);
        camEntréePrimBttn.SetActive(false);
        camSortiePrimBttn.SetActive(false);
    }

    public void ChangeButton()
    {
        doorBttn.SetActive(false);
        dataBttn.SetActive(false);
        camBttn.SetActive(false);

        camMedicBttn.SetActive(true);
        camHubBttn.SetActive(true);
        camSportBttn.SetActive(true);
        camLabBttn.SetActive(true);
        camEntréePrimBttn.SetActive(true);
        camSortiePrimBttn.SetActive(true);

        returnBttn.SetActive(true);
    }

    public void ReturnButton()
    {
        // faire disparaitre le boutton returnToCam
        returnToCamBttn.SetActive(false);
        onCam = false;
        onCamMedic = false;
        onCamHub = false;
        onCamSport = false;
        onCamLab = false;
        onCamEntréePrim = false;
        onCamSortiePrim = false;

        // faire apparaitre le panel TerminalInterface
        panelTerminal.SetActive(true);


        doorBttn.SetActive(true);
        dataBttn.SetActive(true);
        camBttn.SetActive(true);

        camMedicBttn.SetActive(false);
        camHubBttn.SetActive(false);
        camSportBttn.SetActive(false);
        camLabBttn.SetActive(false);
        camEntréePrimBttn.SetActive(false);
        camSortiePrimBttn.SetActive(false);

        returnBttn.SetActive(false);

        #region reset des caméras
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;

        // reset cam principale
        cam.depth = 1;
        #endregion
    }

    #region  Différentes Caméra
    public void CamMedic()
    {
        onCamMedic = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraMedic.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);


        onCam = true;
    }

    public void CamHub()
    {
        onCamHub = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraHub.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);


        onCam = true;
    }

    public void CamSport()
    {
        onCamSport = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraSport.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);


        onCam = true;
    }

    public void CamLab()
    {
        onCamLab = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraLab.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);


        onCam = true;
    }

    public void CamEntréePrim()
    {
        onCamEntréePrim = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraPrimEntrée.depth = 0;



        // faire disparaitre le Panel TerminalInterface
        panelTerminal.SetActive(false);

        // faire apparaitre le bouton returnToCam
        returnToCamBttn.SetActive(true);


        onCam = true;
    }

    public void CamSortiePrim()
    {
        onCamSortiePrim = true;

        // -- Step 1: On enlève la cam principale
        cam.depth = -8;


        // -- Step 2: On reset les autres cam 
        // reset cam hub a -2
        cameraHub.depth = -2;
        // reset cam medic a -3
        cameraMedic.depth = -3;
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;


        // -- Step 3: On switch le depth de la camera cible à 0
        cameraPrimSortie.depth = 0;



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
        // reset cam sport a -4
        cameraSport.depth = -4;
        // reset cam lab a -5
        cameraLab.depth = -5;
        // reset cam entrée prim a -6
        cameraPrimEntrée.depth = -6;
        // reset cam sortie prim a -7
        cameraPrimSortie.depth = -7;


        // reset cam principale
        cam.depth = 1;
        #endregion


        // faire apparaitre le Panel TerminalInterface
        panelTerminal.SetActive(true);

        // faire disparaitre le bouton returnToCam
        returnToCamBttn.SetActive(false);


        onCam = false;
        onCamMedic = false;
        onCamHub = false;
        onCamSport = false;
        onCamLab = false;
        onCamEntréePrim = false;
        onCamSortiePrim = false;
    }
}