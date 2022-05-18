using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class GameManager : MonoBehaviour
{
    public TextMeshProUGUI batterietxt;
    public GameObject lesRobots;
    public Transform playerTpCryo;
    public Transform playerTpMedic;
    public Transform playerTpHub;
    public Transform playerTpLab;
    public Transform playerTpPrimi;

    public Player player;

    #region RobotsManagement
    public void RobotOn()
    {
        lesRobots.SetActive(true);
    }

    public void RobotOff()
    {
        lesRobots.SetActive(false);
    }
    #endregion

    #region TazerManagement
    public void InfiniteAmmo()
    {
        Inventaire.inventaire.currentPilesCapacity += 1000;
    }
    #endregion

    #region Room Management
    private IEnumerator CheatAnim()
    {
        yield return new WaitForSeconds(1f);
        player.anim.enabled = true;
    }

    public void CryoTp()
    {
        player.anim.enabled = false;
        player.transform.position = playerTpCryo.position;
        StartCoroutine(CheatAnim());
    }

    public void MedicTp()
    {
        player.anim.enabled = false;
        player.transform.position = playerTpMedic.position;
        StartCoroutine(CheatAnim());
    }

    public void HubTp()
    {
        player.anim.enabled = false;
        player.transform.position = playerTpHub.position;
        StartCoroutine(CheatAnim());
    }

    public void LabTp()
    {
        player.anim.enabled = false;
        player.transform.position = playerTpLab.position;
        StartCoroutine(CheatAnim());
    }

    public void PrimiTp()
    {
        player.anim.enabled = false;
        player.transform.position = playerTpPrimi.position;
        StartCoroutine(CheatAnim());
    }
    #endregion

    public void Update()
    {
        batterietxt.text = Inventaire.inventaire.currentPilesCapacity.ToString();
    }
}