using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class itemManager : item
{
	public List<itemControl> m_items;
	// Use this for initialization
	void Start ()
	{
		m_items = new List<itemControl>();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	private void OnTriggerEnter(Collider other)
	{
		Debug.Log("Trigger:"+other);
		//itemControl m_ic = other.gameObject.GetComponent<itemControl>();
		//m_items.Add(m_ic);
	}
}
