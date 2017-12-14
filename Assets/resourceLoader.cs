using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class resourceLoader : MonoBehaviour
{
	public GameObject m_background;
	public GameObject m_text;
	public GameObject m_btn;
	private Text textcs;
	private Button btncs;
	private RectTransform rt;
	
	// Use this for initialization
	void Start()
	{
		m_background = new GameObject("background", typeof(Image));
		m_text = new GameObject("text", typeof(Text));
		m_btn = new GameObject("button", typeof(Button));
		init();
	}

	// Update is called once per frame
	void Update () {
	}

	void init()
	{
		//text
		m_text.transform.position = new Vector3(Screen.width/ 2.0f, Screen.height/ 3.0f*2,0);
		
		textcs = m_text.GetComponent<Text>();
		textcs.font = Font.CreateDynamicFontFromOSFont("Arial", 1);
		textcs.fontStyle = FontStyle.Normal;
		textcs.fontSize = 40;

		rt = m_text.GetComponent<RectTransform>();
		rt.sizeDelta = new Vector2(230,50);
		
		//button
		m_btn.transform.position = new Vector3(Screen.width/ 2.0f, Screen.height / 3.0f,0);

		btncs = m_btn.GetComponent<Button>();
		btncs.onClick.AddListener(clickbtn);
		
	}

	void clickbtn()
	{
		Debug.Log("click the btn");
	}

}
