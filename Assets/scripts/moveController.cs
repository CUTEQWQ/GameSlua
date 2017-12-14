using System.Collections;
using System.Collections.Generic;
using UnityEditor;
using UnityEngine;

public class moveController : MonoBehaviour
{

	public float moveSpeed = 50.0f;

	private GameObject m_camera;

	private Vector3 offset;

	// Use this for initialization
	void Start ()
	{
		m_camera = GameObject.Find("Main Camera");

		offset = m_camera.transform.position - gameObject.transform.position;
	}
	
	// Update is called once per frame
	void Update ()
	{
		//control player
		float h = Input.GetAxis("Horizontal") * Time.deltaTime * moveSpeed;
		float v = Input.GetAxis("Vertical") * Time.deltaTime * moveSpeed;
		gameObject.transform.Translate(h, 0, v);
		
		//camera
		m_camera.transform.position = offset + gameObject.transform.position;
	}

}

