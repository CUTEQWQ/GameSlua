using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class itemControl : MonoBehaviour
{
    Material m_material;

	public Material trigger_material;
	
	// Use this for initialization
	void Start ()
	{
		m_material = GetComponent<Renderer>().material;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	void OnTriggerEnter(Collider other)
	{
		if (other.tag!= "Player")
		{
			return;
		}
		this.GetComponent<Renderer>().material = trigger_material;
	}

	void OnTriggerStay(Collider other) {
		if (other.tag!= "Player")
		{
			return;
		}
		if (Input.GetKeyDown(KeyCode.Space))
		{
			Debug.Log("Get an item");
			Destroy(gameObject);
		}
	}
	void OnTriggerExit(Collider other)
	{
		if (other.tag != "Player")
		{
			return;
		}
		if (gameObject)
		{
			this.GetComponent<Renderer>().material = m_material;
		}
	}
}
