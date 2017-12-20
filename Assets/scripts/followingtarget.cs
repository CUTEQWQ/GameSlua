using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class followingtarget : MonoBehaviour
{
	public GameObject m_target;

	private Vector3 offset;
	// Use this for initialization
	void Start ()
	{
		offset = m_target.transform.position - transform.position;
	}
	
	// Update is called once per frame
	void Update ()
	{
		transform.position = m_target.transform.position - offset;
	}
}
