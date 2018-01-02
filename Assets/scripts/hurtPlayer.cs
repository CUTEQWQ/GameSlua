using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class hurtPlayer : MonoBehaviour
{
	private GameObject m_player;

	// Use this for initialization
	void Start () {
		m_player = GameObject.FindWithTag("Player");
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	private void OnTriggerEnter(Collider other)
	{		
		if (other.gameObject.name.Equals("player"))
		{
			Notify notify = new Notify(gameObject, m_player , "Hurt");
			NotifyManager.SendNotify(notify);
			
			//m_playeren.Damage(10);
			Destroy(gameObject);
		}
	}


}
