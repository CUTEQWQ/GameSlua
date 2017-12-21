using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class healbool : item
{
	private float step;
	void Start ()
	{
		ItemType = itemType.Heal;
	}
	
	// Update is called once per frame
	void Update () {
	}
	
	void OnTriggerEnter(Collider other) {
		other.attachedRigidbody.gameObject.GetComponent<Entity>().heal(10.0f);
		StartCoroutine("dissolveItem");
	}

	IEnumerator dissolveItem()
	{
		for (step = 0; step <1.1 ; step = step + 0.1f)
		{
			this.GetComponent<Renderer>().material.SetFloat("_Step", step);
			yield return null;

			if (step >= 0.8f)
			{
				Destroy(gameObject);
			}
		}
	}
}
