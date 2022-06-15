using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class PauseManager : MonoBehaviour
{
    public Player player;
    private GameObject personnage;

    public GameObject background;
    public GameObject pauseMenu;
    public GameObject loadingScreen;
    public GameObject optionsSelection;
    public GameObject soundSelection;
    public GameObject controlSelection;
    public GameObject quitMenu;
    public GameObject creditsSelection;

    public GameObject sensiSelection;

    public bool isPaused = false;



    public void Start()
    {
        personnage = GameObject.Find("Personnage");
        player = personnage.GetComponent<Player>();

        pauseMenu.SetActive(false);
        loadingScreen.SetActive(false);
        optionsSelection.SetActive(false);
        soundSelection.SetActive(false);
        quitMenu.SetActive(false);
        controlSelection.SetActive(false);
        creditsSelection.SetActive(false);
        background.SetActive(false);
        sensiSelection.SetActive(false);
    }

    public void Update()
    {
        Paused();
    }

    public void Paused()
    {
        if (!isPaused && Input.GetKeyDown(KeysAssignation.keysAssign.escapeKey) && StatesPlayer.statesPlayer.canMoove)
        {
            background.SetActive(true);
            pauseMenu.SetActive(true);
            // -- On met le jeu en pause
            Time.timeScale = 0;

            isPaused = true;

            CursorParam();
        }
        else if (isPaused && Input.GetKeyDown(KeysAssignation.keysAssign.escapeKey) && StatesPlayer.statesPlayer.canMoove)
        {
            // -- On remet le jeu
            Resume();
        }

        if (!isPaused && Input.GetKeyDown(KeysAssignation.keysAssign.pauseKey))
        {
            background.SetActive(true);
            pauseMenu.SetActive(true);
            // -- On met le jeu en pause
            Time.timeScale = 0;

            isPaused = true;

            CursorParam();
        }
        else if (isPaused && Input.GetKeyDown(KeysAssignation.keysAssign.pauseKey))
        {
            // -- On remet le jeu
            Resume();
        }
    }

    public void CursorParam()
    {
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }

    public void Resume()
    {
        background.SetActive(false);
        pauseMenu.SetActive(false);
        // on remet le jeu
        Time.timeScale = 1;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
        isPaused = false;
    }

    #region Options
    public void Options()
    {
        optionsSelection.SetActive(true);
        soundSelection.SetActive(false);
        controlSelection.SetActive(false);
        creditsSelection.SetActive(false);
        sensiSelection.SetActive(false);
    }
    #endregion

    #region Controls
    public void Controls()
    {
        controlSelection.SetActive(true);
        optionsSelection.SetActive(false);
    }
    #endregion

    #region Sensi
    public void Sensi()
    {
        sensiSelection.SetActive(true);
        optionsSelection.SetActive(false);
    }
    #endregion

    #region Credits
    public void Credits()
    {
        creditsSelection.SetActive(true);
        optionsSelection.SetActive(false);
    }
    #endregion

    #region Sound
    public void Sound()
    {
        soundSelection.SetActive(true);
        optionsSelection.SetActive(false);
    }
    #endregion

    #region Quit
    public void QuitPause()
    {
        pauseMenu.SetActive(false);
        quitMenu.SetActive(true);
    }

    public void QuitNo()
    {
        quitMenu.SetActive(false);
        pauseMenu.SetActive(true);
    }

    public void QuitYes()
    {
        StartCoroutine(ReturnMenu());
    }

    private IEnumerator ReturnMenu()
    {
        loadingScreen.SetActive(true);
        Time.timeScale = 1;
        yield return new WaitForSeconds(2f);
        SceneManager.LoadScene("StartScene");
    }
    #endregion
}