using UnityEngine;
using UnityEngine.UI;
using UnityEditor.SceneManagement;

public class resourceLoader : MonoBehaviour
{
	public GameObject m_background;
	public GameObject m_text;
	public GameObject m_btn;
	private Image imagecs;
	private Text textcs;
	private Button btncs;
	Image btnimage;
	private GameObject btntext;
	private Text btntextcs;
	private RectTransform rt;
	private RectTransform imagert;
	private RectTransform btnrt;
	private RectTransform btntextrt;
	private GameObject m_canvas;

	//private AssetBundle m_newscene;
	
	
	// Use this for initialization
	void Start()
	{
		//m_newscene = AssetBundle.LoadFromFile("Assets/t");
		m_background = new GameObject("background", typeof(Image));
		m_text = new GameObject("text", typeof(Text));
		m_btn = new GameObject("button", typeof(Button));
		m_canvas = GameObject.Find("Canvas");
		init();
	}

	// Update is called once per frame
	void Update () {
	}

	void init()
	{
		//backgroud
		m_background.transform.position = m_canvas.transform.position;
		m_background.transform.parent = m_canvas.transform;
		
		imagecs = m_background.GetComponent<Image>();
		imagert = m_background.GetComponent<RectTransform>();
		imagert.sizeDelta = new Vector2(Screen.width / imagert.sizeDelta.x *imagert.sizeDelta.x, 
			Screen.height / imagert.sizeDelta.y*imagert.sizeDelta.y);

		
		//text
		m_text.transform.position = new Vector3(Screen.width/ 2.0f, Screen.height/ 3.0f*2,0);
		m_text.transform.parent = m_canvas.transform;
		
		textcs = m_text.GetComponent<Text>();
		textcs.font = Font.CreateDynamicFontFromOSFont("Arial", 1);
		textcs.fontStyle = FontStyle.Normal;
		textcs.fontSize = 40;
		textcs.text = "Play Game!";
		textcs.color = Color.red;

		rt = m_text.GetComponent<RectTransform>();
		//modify width and height
		rt.sizeDelta = new Vector2(230,50);
		
		
		//button
		m_btn.transform.position = new Vector3(Screen.width/ 2.0f, Screen.height / 3.0f,0);
		m_btn.transform.parent = m_canvas.transform;
		btnimage = m_btn.AddComponent<Image>();
		//btnimage.sprite = Sprite.FindObjectOfType<UISprite>();
		btncs = m_btn.GetComponent<Button>();
		btncs.targetGraphic = btnimage;
		btntext = new GameObject("btntext", typeof(Text));
		btntext.transform.parent = m_btn.transform;
		btntext.transform.position = m_btn.transform.position;
		btntextcs = btntext.GetComponent<Text>();
		btntextcs.text = "Start";
		btntextcs.font = Font.CreateDynamicFontFromOSFont("Arial", 0);
		btntextcs.color = Color.blue;
		btntextcs.alignment = TextAnchor.MiddleCenter;
		btntextcs.fontSize = 25;
		btnrt = m_btn.GetComponent<RectTransform>();
		btnrt.sizeDelta = new Vector2(160,50);
		btntextrt = btntext.GetComponent<RectTransform>();
		btntextrt.sizeDelta = btnrt.sizeDelta;
		btncs.onClick.AddListener(clickbtn);
	}
	void clickbtn()
	{
		Debug.Log("click the btn");
		//EditorSceneManager.LoadScene("t", LoadSceneMode.Additive);
		EditorSceneManager.LoadScene("t");
	}
}
