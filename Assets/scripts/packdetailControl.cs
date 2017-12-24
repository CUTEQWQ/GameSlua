using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.UI;

public class packdetailControl : MonoBehaviour
{
	public GameObject cancelBtn;
	public GameObject itemclone;
	public Transform cells;
	private List<itemControl> m_items;
	private GameObject m_player;
	void Start () {
		EventMagaer.addEventListener(cancelBtn, EventTriggerType.PointerClick, cancel);
		m_player = GameObject.FindWithTag("Player");
		m_items = m_player.GetComponent<itemManager>().m_items;
		
		Debug.Log(m_items.Count);
		for (int i = 0; i < m_items.Count; i++)
		{
			GameObject clone = Instantiate(itemclone);
			clone.transform.parent = cells.transform;	
			RectTransform rt =  clone.transform as RectTransform;
			rt.anchoredPosition = new Vector2(0,0);
		}
	}

	private void Update()
	{

	}

	void cancel(BaseEventData eventData)
	{
		Destroy(gameObject);
	}
}
