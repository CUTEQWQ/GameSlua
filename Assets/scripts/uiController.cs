using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class uiController : MonoBehaviour
{
	public Text m_text;
	private GameObject m_player;
	private Entity playerEn;

	// Use this for initialization
	void Start ()
	{
		m_player = GameObject.FindWithTag("Player");
		playerEn = m_player.GetComponent<Entity>();
		m_text.text = "";
	}
	
	// Update is called once per frame
	void Update ()
	{
		//update my health
		m_text.text = String.Format("Health:"+playerEn.getMyHp()); 
	}
}
