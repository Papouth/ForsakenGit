using System.Collections;
using System.Collections.Generic;
using UnityEngine;


[CreateAssetMenu(fileName = "Data", menuName = "ScriptableObjects/Inventaire", order = 1)]
public class GameData : ScriptableObject
{
    // -- Mes données à sauvegarder
    public int nbrPiles = 0;
    public int currentPilesCapacity = 0;

    Vector3 playerPosition;
    Quaternion playerRotation;
}
