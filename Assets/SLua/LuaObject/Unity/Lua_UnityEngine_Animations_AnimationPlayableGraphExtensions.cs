﻿using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_Animations_AnimationPlayableGraphExtensions : LuaObject {
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.Animations.AnimationPlayableGraphExtensions");
		createTypeMetatable(l,null, typeof(UnityEngine.Animations.AnimationPlayableGraphExtensions));
	}
}
