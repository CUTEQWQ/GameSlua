using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//协程：定时器，控制游戏状态...
//多个脚本获取一个协程 则可以static该协程
//协程不是多线程 但有点类似 但协程是在一个线程内完成，不存在锁的问题
//目前unity中无法计算
//协程的真正用途是分步做一个比较耗时的事情，比如游戏里面的加载资源

public class yieldCor : MonoBehaviour
{
	// start and stop
	
	//If you start a Coroutine by name...  
	//StartCoroutine("FirstTimer");  
	//StartCoroutine("SecondTimer");  
  
	//You can stop it anytime by name!  
	//StopCoroutine("FirstTimer"); 
	
	//or you have to stop all coroutines like :
	//StopAllCoroutines()


	public Vector3 targetPos;
	public Vector3[] path;
	public float moveSpeed = 3.0f;
	
	//loadres case
	private int num = 0;
	private const int total = 30;
	
	void Start ()
	{
		//StartCoroutine(CountDown());
		//StartCoroutine(SayHello5Times());
		//StartCoroutine(saysth());
		
		//targetPos = new Vector3(100,0,100);
		//StartCoroutine(moveToPosition(targetPos));
		//StartCoroutine(MoveOnPath(true));
		StartCoroutine(loadMyRes());
	}
	
	// Update is called once per frame
	void Update ()
	{
		Debug.Log("update");
	}

	private void LateUpdate()
	{
		Debug.Log("late update");
	}

	IEnumerator CountDown()
	{
		for (float timer = 3; timer>=0; timer -= Time.deltaTime)
		{
			//yield return 暂停当前方法，在下一帧从这里重新开始
			//返回0 or null 表明协程等待下一帧直到继续执行结束
			yield return 0;
		}
		Debug.Log("This message appears after 3 seconds!");
	}

	IEnumerator sayHello()
	{
		yield return 0;  
		Debug.Log("Hello");  
		yield return 0;  
		Debug.Log("Hello");  
		yield return 0;  
		Debug.Log("Hello");  
		yield return 0;  
		Debug.Log("Hello");  
		yield return 0;  
		Debug.Log("Hello");  
	}
	IEnumerator SayHello5Times()  
	{  
		for(int i = 0; i < 5; i++)  
		{  
			Debug.Log("Hello");  
			yield return 0;  
		}  
	}  
	IEnumerator SayHelloEveryFrame()  
	{  
		while(true)  
		{  
			//1. Say hello  
			Debug.Log("Hello");  
   
			//2. Wait until next frame  
			yield return 0;  
   
		}//3. This is a forever-loop, goto 1  
	}

	IEnumerator CountSeconds()
	{
		int seconds = 0;
		
		//无限循环的协程
		//通过协程 可以记录方法的状态 等待下一帧继续执行
		while (true)
		{
			for (float timer = 0; timer < 1; timer+=Time.deltaTime)
			{
				yield return 0;
			}
			seconds++;
			Debug.Log(seconds +" seconds have passed since the Coroutine started."); 
		}

	}

	IEnumerator wait(float time)
	{
		for (float timer = 0; timer < time; timer+= Time.deltaTime)
		{
			yield return 0;
		}
		Debug.Log("Have waitted for "+ time + " seconds!");
	}

	//start multi-timer at the same time
	IEnumerator saysth()
	{
		Debug.Log("The method started");
		yield return wait(1.0f);
		Debug.Log("after 1 s");
		yield return wait(2.5f);
		Debug.Log("after 2.5s");
	}
	
	//control player's action
	//协程控制物体的移动
	IEnumerator moveToPosition(Vector3 target)
	{
		while (transform.position != target)
		{
			transform.position = Vector3.MoveTowards(transform.position, target, moveSpeed);
			yield return null;
		}
	}
	
	//loop : 是否在该区间循环移动
	IEnumerator MoveOnPath(bool loop)
	{
		do
		{
			foreach (var point in path)
			{
				//yield return moveToPosition(point);
				yield return StartCoroutine(moveToPosition(point));
			}
		} while (loop);
	}
	
	
	//协程可以被用于加载游戏场景耗时很多的时候
	//资源加载可以在start中加载(等待这30个NPC全部加载出来之后才能行动) 
	//但如果资源加载耗费的时候很多 就可以用协程(用了协程，你可以移动，可能你移动一步(或者几步)，加载一个NPC)
	//yield return 是在 update之后 lateupdate之前
	IEnumerator loadMyRes()
	{
		while (num<total)
		{
			num++;
			Debug.Log(num);
			yield return 0;
		}
	}

}
