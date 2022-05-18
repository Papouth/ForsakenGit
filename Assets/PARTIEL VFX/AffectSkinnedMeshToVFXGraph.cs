using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.VFX;

//[ExecuteInEditMode]
public class AffectSkinnedMeshToVFXGraph : MonoBehaviour
{
    public SkinnedMeshRenderer mesh;
    public VisualEffect vfx;
    public float timeToRefresh = 0.02f;

    // Start is called before the first frame update
    void Start()
    {
        StartCoroutine(MAJMesh());
    }

    IEnumerator MAJMesh () {

        while (gameObject.activeSelf) {

            Mesh tmpMesh = new Mesh();
            mesh.BakeMesh(tmpMesh);

            // Vertex
            Vector3[] newVertices = tmpMesh.vertices;
            Mesh tmpMesh2 = new Mesh();
            tmpMesh2.vertices = newVertices;

            vfx.SetMesh("MeshVertices", tmpMesh2);

            // Normals
            //Vector3[] newNormals = tmpMesh.normals;
            //Mesh tmpMeshNewNormals = new Mesh();
            //tmpMeshNewNormals.normals = newNormals;

            //vfx.SetMesh("MeshNormals", tmpMeshNewNormals);

            yield return new WaitForSeconds (timeToRefresh);
        }
    }
}
