using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class medetailControl : MonoBehaviour
{
	public GameObject cancelbtn;
	private item m_item;
	void Start () {
		EventMagaer.addEventListener(cancelbtn, EventTriggerType.PointerClick, cancel);
		m_item = gameObject.GetComponent<item>();

		m_item.ItemType = item.itemType.Brick;
	}

	void cancel(BaseEventData data)
	{
		m_item.Holding = false;
		Debug.Log("after cancel holding "+ m_item.Holding);
		Destroy(gameObject);
	}
}
