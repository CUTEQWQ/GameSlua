using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class uiController : MonoBehaviour
{
	//public Text m_text;

	public RectTransform bar;
	public GameObject mebtn;
	public GameObject meclone;
	
	private float allwidth = 0;
	private float hp = 100;
	private RectTransform barparent;
	
	private GameObject m_player;
	private Entity playerEn;

	// Use this for initialization
	void Start ()
	{
		barparent = bar.parent as RectTransform;
		allwidth = barparent.sizeDelta.x;
		Debug.Log("all"+allwidth);
		
		bar.sizeDelta = new Vector2(hp, 20);	
		m_player = GameObject.FindWithTag("Player");
		playerEn = m_player.GetComponent<Entity>();
		
		//button上挂一个事件监听
		EventMagaer.addEventListener(mebtn, EventTriggerType.PointerClick, clickme);
	}
	
	// Update is called once per frame
	void Update ()
	{
		//update my health
		hp = playerEn.getMyHp() * 257.0f / 100.0f;
		Debug.Log("Now hp = "+playerEn.getMyHp());
		Debug.Log("Now show = "+hp);
		bar.sizeDelta = new Vector2(hp, 20);
	}

	void clickme(BaseEventData data)
	{
		Debug.Log("click me!");
		GameObject clone = Instantiate(meclone);
		clone.transform.parent = GameObject.Find("Canvas").transform;
		RectTransform clonert = clone.transform as RectTransform;
		clonert.anchoredPosition3D = new Vector3();
	}
}
