using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Inventaire : MonoBehaviour
{
    public static Inventaire inventaire;

    public int nbrPiles = 0; // -- Nombre de Piles
    public int currentPilesCapacity = 0; // -- Capacité de mes piles ( 3 charges par piles ? )


    public void Awake()
    {
        if (inventaire != null)
        {
            Destroy(gameObject);
            return;
        }
        inventaire = this;

        //Load();
    }

    public void Load()
    {
        // -- Je charge depuis mes ressources; mon nombre de piles et de tazer, ainsi que mon nombre de charges dans mes piles
        GameData data = (GameData)Resources.Load("Data");
        nbrPiles = data.nbrPiles;
        currentPilesCapacity = data.currentPilesCapacity;
    }
    

    void Save()
    {
        // -- Je sauvegarde: mon nombre de piles et de tazer, ainsi que mon nombre de charges dans mes piles
        GameData data = (GameData)Resources.Load("Data");
        data.nbrPiles = nbrPiles;
        data.currentPilesCapacity = currentPilesCapacity;
    }
}
