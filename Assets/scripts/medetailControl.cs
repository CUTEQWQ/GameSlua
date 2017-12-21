using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class medetailControl : MonoBehaviour
{
	public GameObject cancelbtn;
	public Text hptxt;
	private item m_item;
	private GameObject m_player;
	void Start () {
		EventMagaer.addEventListener(cancelbtn, EventTriggerType.PointerClick, cancel);
		m_item = gameObject.GetComponent<item>();

		m_item.ItemType = itemType.Brick;
		
		m_player = GameObject.FindWithTag("Player");
	}

	void Update()
	{
		updateHptxt();
	}

	void updateHptxt()
	{
		float hp = m_player.GetComponent<Entity>().getMyHp();
		hptxt.text = "Health:" + hp.ToString();
		//hptxt.resizeTextForBestFit = true;
	}
	
	void cancel(BaseEventData data)
	{
		m_item.Holding = false;
		Destroy(gameObject);
	}
}
