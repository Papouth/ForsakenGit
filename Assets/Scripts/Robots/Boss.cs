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
        base.Start();
        robots = gameObject.GetComponent<Rbts>();
        bossAgent = robots.monRobot;
    }

    public override void Interact(Transform player)
    {
        CallMe(player);
    }

    public static void CallMe(Transform player)
    {
        bossAgent.SetDestination(player.position);
        // -- Quand on reçoit alertes on se dirige dessus
    }
}