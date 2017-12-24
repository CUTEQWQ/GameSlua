using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public struct Notify
{
	public GameObject _sender;
	public GameObject _receiver;
	public string _key;

	public Notify(GameObject sender = null, GameObject receiver = null, string key = "")
	{
		_sender = sender;
		_receiver = receiver;
		_key = key;
	}
}

public delegate void Notifier(Notify notify);

/// <summary>
/// 消息收发器
/// </summary>

public class NotifyManager : MonoBehaviour
{
	private Dictionary<string, Notifier> m_notifier;

	private void Awake()
	{
		m_notifier = new Dictionary<string, Notifier>();
	}

	public void AddNotifier(string key, Notifier newNotifier)
	{
		if (!m_notifier.ContainsKey(key))
		{
			m_notifier.Add(key, null);
		}
		m_notifier[key] += newNotifier;
	}

	public void RemoveNotifier(string key, Notifier theNotifier)
	{
		if (!m_notifier.ContainsKey(key))
		{
			return;
		}
		m_notifier[key] -= theNotifier;
	}

	public static void SendNotify(Notify notify)
	{
		notify._receiver.GetComponent<NotifyManager>().OnReceiveNotify(notify);
	}

	public void OnReceiveNotify(Notify notify)
	{
		if (m_notifier.ContainsKey(notify._key))
		{
			Notifier _rner = m_notifier[notify._key];
			if (_rner != null)
			{
				_rner(notify);
			}
		}
	}
}
