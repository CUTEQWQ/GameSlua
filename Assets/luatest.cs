using System.Collections;
using System;
//using System.Diagnostics;
using System.IO;
using UnityEngine;
using SLua;
using UnityEngine.UI;

//该类可以在LUA中被调用
[CustomLuaClass]
public class luatest : MonoBehaviour
{
    private LuaSvr l;

    private LuaTable self;

    private LuaFunction update;
    private LuaFunction hello;

    public delegate void cqwTestDakegate(string path, GameObject g);

    static public cqwTestDakegate ctd;

    //private LuaState ls;

    void Start()
    {
        l = new LuaSvr();
        //l.start("a");
        l.init(null, () =>
        {
            self = (LuaTable) l.start("a");

            hello = (LuaFunction) self["hello"];
            update = (LuaFunction) self["update"];
            
            string str = (string) LuaSvr.mainState.getFunction("createcube").call("111111:cqw");
            Debug.Log(str);
        });    
    }

    //会每帧调用 暂时先注释掉
    void Update()
    {
        if (update!=null)
        {
            //update.call(self);
        }

        if (hello!=null)
        {
            //hello.call(self);
        }
    }

    static public void callD()
    {
        if (ctd!=null)
        {
            ctd("GameObject",new GameObject("simpleDelegate"));
        }
        Debug.Log("callD");
    }

    public void luaCallCS(string cqw)
    {
        Debug.Log("luacallcs~"+cqw);
    }

}
