using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class item : MonoBehaviour
{
	private bool unique;
	private bool holding;
	public enum itemType
	{
		//ui 类
		Brick = 0,
		//装备类
		Equipment = 1,
		//角色类
		Role = 2
	}

	private itemType m_itemtype;

	public itemType ItemType
	{
		get { return m_itemtype; }
		set
		{
			m_itemtype = value;
			switch (m_itemtype)
			{
				//ui类都只有一个
				case itemType.Brick:
					unique = true;
					break;
				//装备类不限个数
				case itemType.Equipment:
					unique = false;
					break;
				default:
					unique = true;
					break;
			}
		}
	}

	public bool Unique
	{
		get
		{
			Debug.Log("get Unique!");
			return unique;
		}
		//set { unique = value; }
	}

	public bool Holding
	{
		get { return holding; }
		set { holding = value; }
	}
}
