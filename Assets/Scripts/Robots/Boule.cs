using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;


public class Boule : Rbts
{
    #region Variables
    public BouleVue bouleVue;

    private Vector3 scaleChange; // -- Scale de mes cônes de détection
    private Vector3 scaleBase; // -- Reset
    public GameObject[] zoneDetectionBoule;
    public GameObject tete;

    public Coroutine scanCoroutine;
    public float timeBetweenStopAndRotate = 0.1f;
    public float timeRotate = 5f;
    public float rotateSpeed = 100f;

    public float timeBetweenTwoScan = 4f;
    private bool canScan = true;
    private float baseYRotation = 0;
    #endregion


    public void Awake()
    {
        scaleBase = new Vector3(18f, 8.4f, 15f);
        scaleChange = new Vector3(36f, 8.4f, 15f);
    }

    public override void Start()
    {
        bouleVue = GetComponentInChildren<BouleVue>();

        monRobot = GetComponent<NavMeshAgent>();

        // -- Prend mes wayPoints à partir de mon Parent De Secteur
        wayPoints = monParentSecteur.GetComponentsInChildren<Transform>();

        BetterIndex();
        RobotsMoove();
    }

    public override void Interact(bool value)
    {

    }

    public override void Interact(Transform player)
    {
        Scan();
    }

    public override void GoToObjectDetected(Vector3 objectPosition)
    {
        // nothing
    }

    public void Scan()
    {
        // -- S'il n'y a aucune coroutine dans la variable (soit coroutine finit, ou jamais commencé, et que le robot peut scan)
        if (scanCoroutine == null && canScan)
        {
            // -- On lance la coroutine en la stockant dans une variable
            scanCoroutine = StartCoroutine(ScanCoroutine());
        }
    }

    IEnumerator ScanCoroutine()
    {
        canScan = false;

        // -- On arrête le robot
        monRobot.isStopped = true;


        while (monRobot.velocity.magnitude > 0.1f)
        {
            yield return new WaitForEndOfFrame();
        }
        // -- Ici le robot est "arrêté"
        for (int i = 0; i < zoneDetectionBoule.Length; i++)
        {
            zoneDetectionBoule[i].transform.localScale = scaleChange;
        }


        // -- On tourne pendant x secondes
        // -- Tant que l'on a pas fait un 360, on reste dans le while

        while (baseYRotation < 360f)
        {
            Vector3 targetRot = tete.transform.rotation.eulerAngles;
            targetRot.y += rotateSpeed * Time.deltaTime;
            tete.transform.rotation = Quaternion.Euler(targetRot);

            baseYRotation += rotateSpeed * Time.deltaTime;

            yield return new WaitForEndOfFrame();
        }
        baseYRotation = 0;


        // -- Fin du 360, on UnScale et on remet le robot en route
        for (int i = 0; i < zoneDetectionBoule.Length; i++)
        {
            zoneDetectionBoule[i].transform.localScale = scaleBase;
        }
        monRobot.isStopped = false;
        scanCoroutine = null;

        // -- Ici on attend un peu pour empêcher que le joueur spam le scan du robot
        yield return new WaitForSeconds(timeBetweenTwoScan);
        // -- Le robot peux re Scan
        canScan = true;
    }
}