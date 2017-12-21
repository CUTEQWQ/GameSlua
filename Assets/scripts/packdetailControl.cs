using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class packdetailControl : MonoBehaviour
{
	public GameObject cancelBtn;
	void Start () {
		EventMagaer.addEventListener(cancelBtn, EventTriggerType.PointerClick, cancel);
	}

	void cancel(BaseEventData eventData)
	{
		Destroy(gameObject);
	}
}
