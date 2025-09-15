using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PoolManager : Singleton<PoolManager>
{
[System.Serializable]
    public class Pool
    {
        public string tag;
        public bool spawnInParent;
        public Transform parent;
        public GameObject[] prefabs;
        public int size;
       
    }

    [SerializeField] private List<Pool> pools;
    
    private Dictionary<string, Queue<GameObject>> poolDictionary;

    public List<Pool> Pools => pools;

    private void Start()
    {
        poolDictionary = new Dictionary<string, Queue<GameObject>>();

        GameObject obj;
        foreach (Pool pool in pools)
        {
            Queue<GameObject> objectPool = new Queue<GameObject>();
            if (pool.spawnInParent)
            {
                for (int i = 0; i < pool.size; i++)
                {
                    obj = Instantiate(pool.prefabs[Random.Range(0, pool.prefabs.Length)], pool.parent);
                    obj.SetActive(false);
                    objectPool.Enqueue(obj);
                }
            }
            else
            {
                for (int i = 0; i < pool.size; i++)
                {
                    Debug.LogError("Spawn");
                    obj = Instantiate(pool.prefabs[Random.Range(0, pool.prefabs.Length)]);
                    obj.SetActive(false);
                    objectPool.Enqueue(obj);
                }
            }
            poolDictionary.Add(pool.tag, objectPool);
        }
    }

    #region Object

    public GameObject SpawnObjectFromPool(string tag, Vector3 position, Quaternion rotation)
    {
        if (!poolDictionary.ContainsKey(tag))
        {
            Debug.LogError("Pool with tag " + tag + " doesn't exist!");
            return null;
        }

        GameObject objectToSpawn = poolDictionary[tag].Dequeue();
        objectToSpawn.SetActive(true);
        objectToSpawn.transform.SetPositionAndRotation(position, rotation);
        poolDictionary[tag].Enqueue(objectToSpawn);

        Debug.Log("Spawn " + tag + " from pool!");
        return objectToSpawn;
    }
    
    public void ReturnObjectToPool(string tag, GameObject _object)
    {
        _object.SetActive(false);
        //Rigidbody objectRigidBody = _object.GetComponent<Rigidbody>();

        //if (objectRigidBody)
        //    objectRigidBody.isKinematic = true;

        Debug.Log("Return " + tag + " from pool!");

        //poolDictionary[tag].Enqueue(_object);
    }

    #endregion
}
