using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class mapGenerator : MonoBehaviour
{
	public GameObject healbool;
	public GameObject originitem;
	public int healboolNum = 20;
	public int originitemNum = 20;

	private Transform m_ground;
	

	void Start()
	{
		m_ground = GameObject.FindWithTag("Ground").transform;
		for (int i = 0; i < healboolNum; i++)
		{
			GameObject clone = Instantiate(healbool);
			Vector2 p = GenerateRandomVector2(m_ground, healbool.transform);
			clone.transform.position = new Vector3(p.x, 0.5f, p.y);
		}

		for (int j = 0; j < originitemNum; j++)
		{
			GameObject clone = Instantiate(originitem);
			Vector2 p = GenerateRandomVector2(m_ground, originitem.transform);
			clone.transform.position = new Vector3(p.x, 0.7f, p.y);
		}
	}

	public static Vector2 GenerateRandomVector2(Transform ground, Transform mTransform)
	{
		float xmax = ground.localScale.x * 5 + ground.position.x - 0.5f * mTransform.localScale.x;
		float xmin = ground.localScale.x * -5 + ground.position.x + 0.5f * mTransform.localScale.x;
		float zmax = ground.localScale.z * 5 + ground.position.z - 0.5f * mTransform.localScale.z;
		float zmin = ground.localScale.z * -5 + ground.position.z + 0.5f * mTransform.localScale.z;
		float x = Random.Range(xmin, xmax);
		float z = Random.Range(zmin, zmax);
		return new Vector2(x, z);
	}
	
}
