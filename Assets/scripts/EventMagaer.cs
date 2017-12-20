using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;
using UnityEngine.EventSystems;

public class EventMagaer : MonoBehaviour {

    public static void addEventListener(GameObject go, EventTriggerType type, UnityAction<BaseEventData> callback)
    {
        EventTrigger et = go.GetComponent<EventTrigger>();
        if (et == null)
        {
            et = go.AddComponent<EventTrigger>();
        }
        //List<EventTrigger.Entry> entries = et.delegates;
        List<EventTrigger.Entry> entries = et.triggers;
        if (entries == null)
        {
            entries = new List<EventTrigger.Entry>();
            //et.delegates = entries;
            et.triggers = entries;
        }
        
        EventTrigger.TriggerEvent te = new EventTrigger.TriggerEvent();
        te.AddListener(callback);
        EventTrigger.Entry entry = new EventTrigger.Entry();
        entry.eventID = type;
        entry.callback = te;
        
        entries.Add(entry);
    }
}


/**
 * 调用方法：
 * EventMagaer.addEventListener(gameObject, EventTriggerType.PointerClick, pointClick);
 * 在需要的组件上再挂一个新的控制脚本，在脚本中写上上面的，pointClick中写点击事件*
 */
