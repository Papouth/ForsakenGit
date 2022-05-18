using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuManager : MonoBehaviour
{
    public GameObject gameTitle;
    public GameObject mainMenu;
    public GameObject loadingScreen;
    public GameObject optionsSelection;
    public GameObject soundSelection;
    public GameObject controlSelection;
    public GameObject quitMenu;
    public GameObject creditsSelection;


    public void Awake()
    {
        gameTitle.SetActive(true);
    }

    public void Start()
    {
        StartCoroutine(TitleShow());
        mainMenu.SetActive(false);
        loadingScreen.SetActive(false);
        optionsSelection.SetActive(false);
        soundSelection.SetActive(false);
        quitMenu.SetActive(false);
        controlSelection.SetActive(false);
        creditsSelection.SetActive(false);
    }

    #region StartTheGame
    public void StartGame()
    {
        StartCoroutine(LaunchLoading());
    }

    private IEnumerator LaunchLoading()
    {
        loadingScreen.SetActive(true);
        yield return new WaitForSeconds(2f);
        SceneManager.LoadScene("MainScene");
    }
    #endregion

    #region Options
    public void Options()
    {
        optionsSelection.SetActive(true);
        soundSelection.SetActive(false);
        controlSelection.SetActive(false);
        creditsSelection.SetActive(false);
    }
    #endregion

    #region Controls
    public void Controls()
    {
        controlSelection.SetActive(true);
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
    public void QuitMenu()
    {
        mainMenu.SetActive(false);
        quitMenu.SetActive(true);
    }

    public void QuitNo()
    {
        quitMenu.SetActive(false);
        mainMenu.SetActive(true);
    }

    public void QuitYes()
    {
        Application.Quit();
    }
    #endregion


    #region Other
    private IEnumerator TitleShow()
    {
        gameTitle.SetActive(true);
        yield return new WaitForSeconds(4f);
        gameTitle.SetActive(false);
        mainMenu.SetActive(true);
    }
    #endregion
}
