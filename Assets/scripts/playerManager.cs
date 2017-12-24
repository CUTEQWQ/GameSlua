using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class playerManager : MonoBehaviour
{
	public Text notifytxt;
	
	
	// Use this for initialization
	void Start () {
		gameObject.GetComponent<NotifyManager>().AddNotifier("PickupItem", PickupItem);
		gameObject.GetComponent<NotifyManager>().AddNotifier("EatHeal", EatHeal);
	}
	
	void PickupItem(Notify notify)
	{
		notifytxt.text += "Picked up an item!"+"\n";
	}

	void EatHeal(Notify notify)
	{
		notifytxt.text += "Ate a HealBool!"+"\n";
	}
}
