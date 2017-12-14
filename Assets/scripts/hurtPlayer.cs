using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class hurtPlayer : MonoBehaviour
{
	private GameObject m_player;

	private Entity m_playeren;
	// Use this for initialization
	void Start () {
		m_player = GameObject.FindWithTag("Player");
		m_playeren = m_player.GetComponent<Entity>();
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	private void OnTriggerEnter(Collider other)
	{		
		if (other.gameObject.name.Equals("player"))
		{
			Debug.Log("hit player!");
			m_playeren.Damage(10);
			Destroy(gameObject);
		}
	}


}
