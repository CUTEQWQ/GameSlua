using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_luatest : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int luaCallCS(IntPtr l) {
		try {
			luatest self=(luatest)checkSelf(l);
			System.String a1;
			checkType(l,2,out a1);
			self.luaCallCS(a1);
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int callD_s(IntPtr l) {
		try {
			luatest.callD();
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_ctd(IntPtr l) {
		try {
			luatest.cqwTestDakegate v;
			int op=checkDelegate(l,2,out v);
			if(op==0) luatest.ctd=v;
			else if(op==1) luatest.ctd+=v;
			else if(op==2) luatest.ctd-=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"luatest");
		addMember(l,luaCallCS);
		addMember(l,callD_s);
		addMember(l,"ctd",null,set_ctd,false);
		createTypeMetatable(l,null, typeof(luatest),typeof(UnityEngine.MonoBehaviour));
	}
}
