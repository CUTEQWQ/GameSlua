﻿using System;
using SLua;
using System.Collections.Generic;
[UnityEngine.Scripting.Preserve]
public class Lua_UnityEngine_CompositeCollider2D : LuaObject {
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GenerateGeometry(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			self.GenerateGeometry();
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int GetPathPointCount(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			System.Int32 a1;
			checkType(l,2,out a1);
			var ret=self.GetPathPointCount(a1);
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
	static public int GetPath(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			System.Int32 a1;
			checkType(l,2,out a1);
			UnityEngine.Vector2[] a2;
			checkArray(l,3,out a2);
			var ret=self.GetPath(a1,a2);
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
	static public int get_geometryType(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushEnum(l,(int)self.geometryType);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_geometryType(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			UnityEngine.CompositeCollider2D.GeometryType v;
			checkEnum(l,2,out v);
			self.geometryType=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_generationType(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushEnum(l,(int)self.generationType);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_generationType(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			UnityEngine.CompositeCollider2D.GenerationType v;
			checkEnum(l,2,out v);
			self.generationType=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_vertexDistance(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.vertexDistance);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_vertexDistance(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			float v;
			checkType(l,2,out v);
			self.vertexDistance=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_edgeRadius(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.edgeRadius);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int set_edgeRadius(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			float v;
			checkType(l,2,out v);
			self.edgeRadius=v;
			pushValue(l,true);
			return 1;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_pathCount(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.pathCount);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[SLua.MonoPInvokeCallbackAttribute(typeof(LuaCSFunction))]
	[UnityEngine.Scripting.Preserve]
	static public int get_pointCount(IntPtr l) {
		try {
			UnityEngine.CompositeCollider2D self=(UnityEngine.CompositeCollider2D)checkSelf(l);
			pushValue(l,true);
			pushValue(l,self.pointCount);
			return 2;
		}
		catch(Exception e) {
			return error(l,e);
		}
	}
	[UnityEngine.Scripting.Preserve]
	static public void reg(IntPtr l) {
		getTypeTable(l,"UnityEngine.CompositeCollider2D");
		addMember(l,GenerateGeometry);
		addMember(l,GetPathPointCount);
		addMember(l,GetPath);
		addMember(l,"geometryType",get_geometryType,set_geometryType,true);
		addMember(l,"generationType",get_generationType,set_generationType,true);
		addMember(l,"vertexDistance",get_vertexDistance,set_vertexDistance,true);
		addMember(l,"edgeRadius",get_edgeRadius,set_edgeRadius,true);
		addMember(l,"pathCount",get_pathCount,null,true);
		addMember(l,"pointCount",get_pointCount,null,true);
		createTypeMetatable(l,null, typeof(UnityEngine.CompositeCollider2D),typeof(UnityEngine.Collider2D));
	}
}
