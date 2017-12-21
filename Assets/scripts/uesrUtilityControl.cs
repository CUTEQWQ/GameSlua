using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class uesrUtilityControl : MonoBehaviour {

	public GameObject mebtn;
	public GameObject meclone;
	public GameObject packbtn;
	public GameObject packclone;
	private item m_item;
	
	// Use this for initialization
	void Start () {
		m_item = meclone.GetComponent<item>();

		//button上挂一个事件监听
		EventMagaer.addEventListener(mebtn, EventTriggerType.PointerClick, clickme);
		EventMagaer.addEventListener(packbtn, EventTriggerType.PointerClick, clickpack);

	}
	void clickme(BaseEventData data)
	{
		m_item.Holding = false;
		m_item.ItemType = itemType.Brick;
		if (m_item.Unique)
		{
			if (!m_item.Holding)
			{
				GameObject clone = Instantiate(meclone);
				clone.transform.parent = GameObject.Find("Canvas").transform;
				RectTransform clonert = clone.transform as RectTransform;
				clonert.anchoredPosition3D = new Vector3(0, 0, 0);

				m_item.Holding = true;
			}
		}
		else
		{
			GameObject clone = Instantiate(meclone);
			clone.transform.parent = GameObject.Find("Canvas").transform;
			RectTransform clonert = clone.transform as RectTransform;
			clonert.anchoredPosition3D = new Vector3(0, 0, 0);
		}

	}

	void clickpack(BaseEventData eventData)
	{
		GameObject clone = Instantiate(packclone);
		clone.transform.parent = GameObject.Find("Canvas").transform;
		RectTransform clonert = clone.transform as RectTransform;
		clonert.anchoredPosition3D = new Vector3(0, 0, 0);	
	}
}
