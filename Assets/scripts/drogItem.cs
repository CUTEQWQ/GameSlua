using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;

public class drogItem : MonoBehaviour
{
	private RectTransform rt;
	private RectTransform canvasRt;
	private Vector2 newPos = new Vector2();
	private bool isFirst = true;
	void Start () {
		EventMagaer.addEventListener(gameObject, EventTriggerType.BeginDrag, OnDrop);
		EventMagaer.addEventListener(gameObject, EventTriggerType.Drag, OnDrag);
		rt = transform as RectTransform;
		canvasRt = transform.parent.transform as RectTransform;
	}
    void OnDrag(BaseEventData eventData)
	{
		Vector2 mousePos = eventData.currentInputModule.input.mousePosition;
		//记住第一次鼠标点击的点 转换到ugui中的位置
		Vector2 uguiPos = new Vector2();
		bool isInRect = RectTransformUtility.ScreenPointToLocalPointInRectangle(canvasRt, mousePos, eventData.currentInputModule.GetComponent<Camera>(),
			out uguiPos);


		if (isFirst)
		{
			isFirst = false;
			RectTransformUtility.ScreenPointToLocalPointInRectangle(rt, mousePos, eventData.currentInputModule.GetComponent<Camera>(),
				out newPos);
		}
		if (isInRect)
		{
			rt.anchoredPosition = uguiPos - newPos;
		}

	}

	void OnDrop(BaseEventData eventData)
	{
		if (!isFirst)
		{
			isFirst = true;
			//拖拽界面本身 松开的时候
		}
		else
		{
			//有其他物体放下来了
		}
	}
}
