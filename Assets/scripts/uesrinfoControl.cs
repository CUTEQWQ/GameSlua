using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class uesrinfoControl : MonoBehaviour {

	public RectTransform bar;
	public Image m_profile;
	private float allwidth = 0;
	private float hp = 100;
	private RectTransform barparent;
	
	private GameObject m_player;
	private Entity playerEn;

	private Texture2D profileimage;

	// Use this for initialization
	void Start () {
		barparent = bar.parent as RectTransform;
		allwidth = barparent.sizeDelta.x;
		Debug.Log("all"+allwidth);
		
		bar.sizeDelta = new Vector2(hp, 20);	
		m_player = GameObject.FindWithTag("Player");
		playerEn = m_player.GetComponent<Entity>();

		StartCoroutine(loadprofile());
	}
	
	// Update is called once per frame
	void Update () {
		hp = playerEn.getMyHp() * 257.0f / 100.0f;
		bar.sizeDelta = new Vector2(hp, 20);
	}

	IEnumerator loadprofile()
	{
		WWW www = new WWW("http://pic.qqtn.com/up/2017-12/2017120911584418847.jpg");
		yield return www;
		profileimage = www.texture;
		//byte[] bytes = profileimage.EncodeToPNG();
		Sprite sprite = Sprite.Create(profileimage, new Rect(0, 0, profileimage.width, profileimage.height), new Vector2(0,0));
		m_profile.sprite = sprite;
		Debug.Log("load success");
	}
}
