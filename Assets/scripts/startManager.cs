using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using SLua;
using UnityEngine.UI;

public class startManager : MonoBehaviour
{
	private LuaSvr luaSvr;
	private LuaTable self;

	public delegate void CreateDelegate(string path, GameObject g);

    static public CreateDelegate createDelegate;
	
	// Use this for initialization
	void Start () {
		luaSvr = new LuaSvr();
		luaSvr.init(null, () =>
		{
			self = (LuaTable) luaSvr.start("startGame");
		});
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	static public void calledCreate()
	{
		if (createDelegate!=null)
		{
			createDelegate("GameObject", new GameObject("newObj"));
		}
		Debug.Log("calledCreate!");
	}

	public GameObject createObj(string name, string type)
	{
		GameObject newobj;

		switch (type)
		{
			case "Image":
				newobj = new GameObject(name, typeof(Image));
				break;
			case "Text":
				newobj = new GameObject(name, typeof(Text));
				break;
			default:
				newobj = new GameObject(name);
				break;
		}
		//newobj.name = name;
		Debug.Log("Has create a newobj named "+name);
		return newobj;
	}
}
