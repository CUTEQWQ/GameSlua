using UnityEngine;
using UnityEngine.EventSystems;
using UnityEditor.SceneManagement;

public class startUiControl : MonoBehaviour
{
	public GameObject playbtn;
	// Use this for initialization
	void Start () {
		EventMagaer.addEventListener(playbtn, EventTriggerType.PointerClick, playClick);
	}

	void playClick(BaseEventData data)
	{
		EditorSceneManager.LoadScene("t");
	}
}
