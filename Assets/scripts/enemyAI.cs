using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class enemyAI : MonoBehaviour
{
	private GameObject m_player;
	private float distanceToPlayer;
	private float curtime;
	public float AttackTime = 0;
	public float shellSpeed = 100.0f;
	public GameObject shell;
	
	// Use this for initialization
	void Start () {
		m_player = GameObject.FindWithTag("Player");
		distanceToPlayer = Vector3.Distance(gameObject.transform.position, m_player.transform.position);
		curtime = AttackTime;
	}
	
	// Update is called once per frame
	void Update ()
	{
		curtime -= Time.deltaTime;
		distanceToPlayer = Vector3.Distance(gameObject.transform.position, m_player.transform.position);
		if (distanceToPlayer < 10 && curtime <= 0)
		{
			curtime = AttackTime;
			Attack();
		}
	}

	void Attack()
	{
		GameObject clone;
		gameObject.transform.LookAt(m_player.transform);
		clone = Instantiate(shell, transform.position, transform.rotation);
	
		//clone.GetComponent<Rigidbody>().AddForce( transform.forward * shellSpeed *Time.deltaTime);
		clone.GetComponent<Rigidbody>().velocity =
		transform.TransformDirection(Vector3.forward * shellSpeed * Time.deltaTime);
	}
}
