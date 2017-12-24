using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class itemControl : item
{
    Material m_material;

	public Material trigger_material;

	private GameObject m_player;
	
	// Use this for initialization
	void Start ()
	{
		m_material = GetComponent<Renderer>().material;
		ItemType = itemType.Equipment;
		m_player = GameObject.FindWithTag("Player");
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
			m_player.GetComponent<itemManager>().m_items.Add(this);
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
