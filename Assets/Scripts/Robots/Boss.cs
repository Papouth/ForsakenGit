using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;

public class Boss : Rbts
{
    public static Rbts robots;
    public static NavMeshAgent bossAgent;


    public override void Start()
    {
        monRobot = GetComponent<NavMeshAgent>();

        // -- Prend mes wayPoints à partir de mon Parent De Secteur
        wayPoints = monParentSecteur.GetComponentsInChildren<Transform>();
        robotSound = GetComponent<AudioSource>();

        robots = gameObject.GetComponent<Rbts>();
        bossAgent = robots.monRobot;

        BetterIndex();
        RobotsMoove();
    }

    public override void Interact(Transform player)
    {
        CallMe(player);
        GoToObjectDetected(player.position);
    }

    public static void CallMe(Transform player)
    {
        bossAgent.SetDestination(player.transform.position);
        // -- Quand on reçoit alertes on se dirige dessus
    }
}