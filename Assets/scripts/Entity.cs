using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Entity : MonoBehaviour
{
	private float m_hp;

	private bool m_alive;
	// Use this for initialization
	void Start ()
	{
		m_hp = 100;
		m_alive = true;
	}
	
	// Update is called once per frame
	void Update () {
		
	}

	public float getMyHp()
	{
		return m_hp;
	}

	public void setMyHp(float hp)
	{
		m_hp = hp;
	}
	public void heal(float hp)
	{
		m_hp += hp;
	}

    public void Damage(float hurt)
	{
		m_hp -= hurt;
		if (m_hp < 0)
		{
			m_hp = 0;
			m_alive = false;
			Debug.Log("player died");
		}
	}
}
