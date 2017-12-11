﻿using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_Playables_PlayableGraph : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int constructor(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph o;
			o=new UnityEngine.Playables.PlayableGraph();
			pushValue(l,true);
			pushValue(l,o);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int IsValid(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.IsValid();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int IsDone(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.IsDone();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int IsPlaying(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.IsPlaying();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetResolver(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.GetResolver();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int SetResolver(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			UnityEngine.IExposedPropertyTable a1;
			checkType(l,2,out a1);
			self.SetResolver(a1);
			pushValue(l,true);
			setBack(l,self);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int Play(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			self.Play();
			pushValue(l,true);
			setBack(l,self);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int Stop(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			self.Stop();
			pushValue(l,true);
			setBack(l,self);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetPlayableCount(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.GetPlayableCount();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetTimeUpdateMode(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.GetTimeUpdateMode();
			pushValue(l,true);
			pushEnum(l,(int)ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int SetTimeUpdateMode(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			UnityEngine.Playables.DirectorUpdateMode a1;
			checkEnum(l,2,out a1);
			self.SetTimeUpdateMode(a1);
			pushValue(l,true);
			setBack(l,self);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int Destroy(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			self.Destroy();
			pushValue(l,true);
			setBack(l,self);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int Evaluate(IntPtr l) {
		try {
			int argc = LuaDLL.lua_gettop(l);
			if(argc==1){
				UnityEngine.Playables.PlayableGraph self;
				checkValueType(l,1,out self);
				self.Evaluate();
				pushValue(l,true);
				setBack(l,self);
				return 1;
			}
			else if(argc==2){
				UnityEngine.Playables.PlayableGraph self;
				checkValueType(l,1,out self);
				System.Single a1;
				checkType(l,2,out a1);
				self.Evaluate(a1);
				pushValue(l,true);
				setBack(l,self);
				return 1;
			}
			pushValue(l,false);
			LuaDLL.lua_pushstring(l,"No matched override function Evaluate to call");
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetRootPlayableCount(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.GetRootPlayableCount();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetRootPlayable(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			System.Int32 a1;
			checkType(l,2,out a1);
			var ret=self.GetRootPlayable(a1);
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetOutputCount(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			var ret=self.GetOutputCount();
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetOutput(IntPtr l) {
		try {
			UnityEngine.Playables.PlayableGraph self;
			checkValueType(l,1,out self);
			System.Int32 a1;
			checkType(l,2,out a1);
			var ret=self.GetOutput(a1);
			pushValue(l,true);
			pushValue(l,ret);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int Create_s(IntPtr l) {
		try {
			var ret=UnityEngine.Playables.PlayableGraph.Create();
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
		getTypeTable(l,"UnityEngine.Playables.PlayableGraph");
		addMember(l,IsValid);
		addMember(l,IsDone);
		addMember(l,IsPlaying);
		addMember(l,GetResolver);
		addMember(l,SetResolver);
		addMember(l,Play);
		addMember(l,Stop);
		addMember(l,GetPlayableCount);
		addMember(l,GetTimeUpdateMode);
		addMember(l,SetTimeUpdateMode);
		addMember(l,Destroy);
		addMember(l,Evaluate);
		addMember(l,GetRootPlayableCount);
		addMember(l,GetRootPlayable);
		addMember(l,GetOutputCount);
		addMember(l,GetOutput);
		addMember(l,Create_s);
		createTypeMetatable(l,constructor, typeof(UnityEngine.Playables.PlayableGraph),typeof(System.ValueType));
	}
}
