﻿using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_Playables_IPlayable : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetHandle(IntPtr l) {
		try {
			UnityEngine.Playables.IPlayable self=(UnityEngine.Playables.IPlayable)checkSelf(l);
			var ret=self.GetHandle();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.Playables.IPlayable");
		addMember(l,GetHandle);
		createTypeMetatable(l,null, typeof(UnityEngine.Playables.IPlayable));
	}
}
