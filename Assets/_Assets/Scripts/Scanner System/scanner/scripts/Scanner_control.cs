using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace EasyGameStudio.scanner
{
    public class Scanner_control : MonoBehaviour
    {
        [Header("speed")]
        public float speed;

        [Header("destory time")]
        public float delay_destory_time;

        // Start is called before the first frame update
        void Start()
        {
            Invoke("destory_self", this.delay_destory_time);
        }

        // Update is called once per frame
        void Update()
        {
            Vector3 v3 = this.transform.localScale;
            float temp = this.speed * Time.deltaTime;
            this.transform.localScale = new Vector3(v3.x + temp, v3.y + temp, v3.z + temp);
        }

        private void destory_self()
        {
            Destroy(this.gameObject);
        }
    }
}