// Compiled shader for PC, Mac & Linux Standalone

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Custom/test" {
Properties {
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _MainTex ("Albedo (RGB)", 2D) = "white" { }
 _Glossiness ("Smoothness", Range(0.000000,1.000000)) = 0.500000
 _Metallic ("Metallic", Range(0.000000,1.000000)) = 0.000000
}
SubShader { 
 LOD 200
 Tags { "RenderType"="Opaque" }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDBASE" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 64
  Matrix4x4 unity_WorldToObject at 128
  Matrix4x4 unity_MatrixVP at 192
  Vector4 unity_SHBr at 0
  Vector4 unity_SHBg at 16
  Vector4 unity_SHBb at 32
  Vector4 unity_SHC at 48
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD4.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(Globals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(Globals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(Globals.unity_SHBb, u_xlat1);
    output.TEXCOORD3.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set CUBE Texture "unity_SpecCube0" to slot 1 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 2 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 1

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 240
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 unity_SpecCube0_BoxMax at 96
  Vector4 unity_SpecCube0_BoxMin at 112
  Vector4 unity_SpecCube0_ProbePosition at 128
  Vector4 unity_SpecCube0_HDR at 144
  Vector4 unity_SpecCube1_BoxMax at 160
  Vector4 unity_SpecCube1_BoxMin at 176
  Vector4 unity_SpecCube1_ProbePosition at 192
  Vector4 unity_SpecCube1_HDR at 208
  Vector4 unity_ProbeVolumeParams at 224
  Vector3 unity_ProbeVolumeSizeInv at 304
  Vector3 unity_ProbeVolumeMin at 320
  Vector4 _LightColor0 at 336
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture (1) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat13;
    float u_xlat14;
    float u_xlat26;
    float u_xlat27;
    float u_xlat39;
    float u_xlat40;
    bool u_xlatb40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    float u_xlat43;
    bool u_xlatb43;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlatb40 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb40){
        u_xlatb41 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : input.TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat41 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat42 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat41 = dot(u_xlat4, Globals.unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0f, 1.0f);
    u_xlat42 = (-Globals._Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), input.TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(input.TEXCOORD1.xyz, (-u_xlat4.xxx), (-u_xlat1.xyz));
    u_xlat5.xyz = float3(u_xlat41) * Globals._LightColor0.xyz;
    if(u_xlatb40){
        u_xlatb40 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = Globals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = fma((-Globals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + float3(0.25, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + float3(0.5, 0.0, 0.0);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = input.TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat7, u_xlat9);
        u_xlat7.y = dot(u_xlat8, u_xlat9);
        u_xlat7.z = dot(u_xlat6, u_xlat9);
    } else {
        u_xlat6.xyz = input.TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(Globals.unity_SHAr, u_xlat6);
        u_xlat7.y = dot(Globals.unity_SHAg, u_xlat6);
        u_xlat7.z = dot(Globals.unity_SHAb, u_xlat6);
    }
    u_xlat6.xyz = u_xlat7.xyz + input.TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<Globals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = rsqrt(u_xlat40);
        u_xlat7.xyz = float3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = input.TEXCOORD2.xyz + (-Globals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat40), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    }
    u_xlat40 = fma((-u_xlat42), 0.699999988, 1.70000005);
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat40));
    u_xlat41 = u_xlat7.w + -1.0;
    u_xlat41 = fma(Globals.unity_SpecCube0_HDR.w, u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * Globals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat41);
    u_xlatb43 = Globals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<Globals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = rsqrt(u_xlat43);
            u_xlat9.xyz = float3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = input.TEXCOORD2.xyz + (-Globals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = fma(u_xlat9.xyz, float3(u_xlat43), u_xlat10.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat40));
        u_xlat40 = u_xlat4.w + -1.0;
        u_xlat40 = fma(Globals.unity_SpecCube1_HDR.w, u_xlat40, 1.0);
        u_xlat40 = u_xlat40 * Globals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat40);
        u_xlat7.xyz = fma(float3(u_xlat41), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(Globals.unity_SpecCube0_BoxMin.www, u_xlat7.xyz, u_xlat4.xyz);
    }
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat4.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat40 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat39), Globals._WorldSpaceLightPos0.xyz);
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat0.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, float2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = fma(u_xlat13.x, u_xlat26, 1.0);
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = fma(u_xlat13.x, u_xlat27, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = fma(abs(u_xlat39), u_xlat41, u_xlat26);
    u_xlat41 = fma(u_xlat1.x, u_xlat41, u_xlat26);
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = fma(u_xlat1.x, u_xlat4.x, u_xlat39);
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = fma(u_xlat14, u_xlat41, (-u_xlat14));
    u_xlat14 = fma(u_xlat4.x, u_xlat14, 1.0);
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = fma(u_xlat14, u_xlat14, 1.00000001e-07);
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = fma((-u_xlat26), 0.280000001, 1.0);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + Globals._Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat4.xyz = fma(u_xlat5.xyz, u_xlat13.xxx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyw = fma(u_xlat6.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = fma(u_xlat3.xyz, u_xlat4.xyz, u_xlat0.xyw);
    u_xlat3.xyz = u_xlat8.xyz * float3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = fma(float3(u_xlat27), u_xlat1.xyw, u_xlat2.xyz);
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyw);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD4;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD4.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat13;
float u_xlat14;
float u_xlat26;
float u_xlat27;
float u_xlat39;
float u_xlat40;
float u_xlat16_40;
bool u_xlatb40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlatb40 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb40){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat42 = (-_Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz * (-u_xlat4.xxx) + (-u_xlat1.xyz);
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    if(u_xlatb40){
        u_xlatb40 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = vs_TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat10_7, u_xlat9);
        u_xlat7.y = dot(u_xlat10_8, u_xlat9);
        u_xlat7.z = dot(u_xlat10_6, u_xlat9);
    } else {
        u_xlat6.xyz = vs_TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(unity_SHAr, u_xlat6);
        u_xlat7.y = dot(unity_SHAg, u_xlat6);
        u_xlat7.z = dot(unity_SHAb, u_xlat6);
    //ENDIF
    }
    u_xlat6.xyz = u_xlat7.xyz + vs_TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat40) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = (-u_xlat42) * 0.699999988 + 1.70000005;
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat40);
    u_xlat16_41 = u_xlat10_7.w + -1.0;
    u_xlat41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat41 = u_xlat41 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat41);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat9.xyz = vec3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat43) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, u_xlat40);
        u_xlat16_40 = u_xlat10_4.w + -1.0;
        u_xlat40 = unity_SpecCube1_HDR.w * u_xlat16_40 + 1.0;
        u_xlat40 = u_xlat40 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat40 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, vec2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = u_xlat13.x * u_xlat26 + 1.0;
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = u_xlat13.x * u_xlat27 + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = abs(u_xlat39) * u_xlat41 + u_xlat26;
    u_xlat41 = u_xlat1.x * u_xlat41 + u_xlat26;
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = u_xlat1.x * u_xlat4.x + u_xlat39;
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = u_xlat14 * u_xlat41 + (-u_xlat14);
    u_xlat14 = u_xlat4.x * u_xlat14 + 1.0;
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = u_xlat14 * u_xlat14 + 1.00000001e-07;
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + _Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat13.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat6.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat8.xyz * vec3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyw + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (288 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 80
  Matrix4x4 unity_WorldToObject at 144
  Matrix4x4 unity_MatrixVP at 208
  Vector4 _ProjectionParams at 0
  Vector4 unity_SHBr at 16
  Vector4 unity_SHBg at 32
  Vector4 unity_SHBb at 48
  Vector4 unity_SHC at 64
  Vector4 _MainTex_ST at 272
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _ProjectionParams;
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat10;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.mtl_Position = u_xlat0;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = rsqrt(u_xlat10);
    u_xlat1.xyz = float3(u_xlat10) * u_xlat1.xyz;
    output.TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat10));
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat1.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat1.z = dot(Globals.unity_SHBb, u_xlat2);
    output.TEXCOORD3.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat10), u_xlat1.xyz);
    u_xlat0.y = u_xlat0.y * Globals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD4.zw = u_xlat0.zw;
    output.TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_ShadowMapTexture" to slot 1 sampler slot 2
Set CUBE Texture "unity_SpecCube0" to slot 2 sampler slot 0
Set CUBE Texture "unity_SpecCube1" to slot 3 sampler slot -1
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 1

Constant Buffer "Globals" (480 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 128
  Matrix4x4 unity_ProbeVolumeWorldToObject at 336
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_SHAr at 32
  Vector4 unity_SHAg at 48
  Vector4 unity_SHAb at 64
  Vector4 unity_OcclusionMaskSelector at 80
  Vector4 _LightShadowData at 96
  Vector4 unity_ShadowFadeCenterAndType at 112
  Vector4 unity_SpecCube0_BoxMax at 192
  Vector4 unity_SpecCube0_BoxMin at 208
  Vector4 unity_SpecCube0_ProbePosition at 224
  Vector4 unity_SpecCube0_HDR at 240
  Vector4 unity_SpecCube1_BoxMax at 256
  Vector4 unity_SpecCube1_BoxMin at 272
  Vector4 unity_SpecCube1_ProbePosition at 288
  Vector4 unity_SpecCube1_HDR at 304
  Vector4 unity_ProbeVolumeParams at 320
  Vector3 unity_ProbeVolumeSizeInv at 400
  Vector3 unity_ProbeVolumeMin at 416
  Vector4 _LightColor0 at 432
  Float _Glossiness at 448
  Float _Metallic at 452
  Vector4 _Color at 464
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_SpecCube0_BoxMax;
    float4 unity_SpecCube0_BoxMin;
    float4 unity_SpecCube0_ProbePosition;
    float4 unity_SpecCube0_HDR;
    float4 unity_SpecCube1_BoxMax;
    float4 unity_SpecCube1_BoxMin;
    float4 unity_SpecCube1_ProbePosition;
    float4 unity_SpecCube1_HDR;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_SpecCube0 [[ sampler (0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (1) ]],
    sampler sampler_ShadowMapTexture [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texturecube<float, access::sample > unity_SpecCube0 [[ texture (2) ]] ,
    texturecube<float, access::sample > unity_SpecCube1 [[ texture (3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    bool u_xlatb1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float3 u_xlat10;
    bool3 u_xlatb10;
    float3 u_xlat11;
    bool3 u_xlatb12;
    float3 u_xlat13;
    float u_xlat14;
    float u_xlat17;
    float u_xlat26;
    float u_xlat27;
    float u_xlat39;
    float u_xlat40;
    bool u_xlatb40;
    float u_xlat41;
    bool u_xlatb41;
    float u_xlat42;
    bool u_xlatb42;
    float u_xlat43;
    bool u_xlatb43;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat1.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlat4.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat4.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat41 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat41, u_xlat40);
    u_xlat40 = fma(u_xlat40, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat40 = clamp(u_xlat40, 0.0f, 1.0f);
    u_xlatb41 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb42 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb42)) ? u_xlat4.xyz : input.TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat42 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat17 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat42, u_xlat17);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat42 = dot(u_xlat4, Globals.unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0f, 1.0f);
    u_xlat4.xy = input.TEXCOORD4.xy / input.TEXCOORD4.ww;
    u_xlat4.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat4.xy).x;
    u_xlat40 = u_xlat40 + u_xlat4.x;
    u_xlat40 = clamp(u_xlat40, 0.0f, 1.0f);
    u_xlat42 = min(u_xlat40, u_xlat42);
    u_xlat40 = (u_xlatb41) ? u_xlat42 : u_xlat40;
    u_xlat42 = (-Globals._Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), input.TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = fma(input.TEXCOORD1.xyz, (-u_xlat4.xxx), (-u_xlat1.xyz));
    u_xlat5.xyz = float3(u_xlat40) * Globals._LightColor0.xyz;
    if(u_xlatb41){
        u_xlatb40 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = Globals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = fma((-Globals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + float3(0.25, 0.0, 0.0);
        u_xlat8 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + float3(0.5, 0.0, 0.0);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = input.TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat7, u_xlat9);
        u_xlat7.y = dot(u_xlat8, u_xlat9);
        u_xlat7.z = dot(u_xlat6, u_xlat9);
    } else {
        u_xlat6.xyz = input.TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(Globals.unity_SHAr, u_xlat6);
        u_xlat7.y = dot(Globals.unity_SHAg, u_xlat6);
        u_xlat7.z = dot(Globals.unity_SHAb, u_xlat6);
    }
    u_xlat6.xyz = u_xlat7.xyz + input.TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = fma(u_xlat6.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat6.xyz = max(u_xlat6.xyz, float3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<Globals.unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = rsqrt(u_xlat40);
        u_xlat7.xyz = float3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = (float3(0.0, 0.0, 0.0)<u_xlat7.xyz);
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = input.TEXCOORD2.xyz + (-Globals.unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = fma(u_xlat7.xyz, float3(u_xlat40), u_xlat8.xyz);
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    }
    u_xlat40 = fma((-u_xlat42), 0.699999988, 1.70000005);
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat7 = unity_SpecCube0.sample(samplerunity_SpecCube0, u_xlat7.xyz, level(u_xlat40));
    u_xlat41 = u_xlat7.w + -1.0;
    u_xlat41 = fma(Globals.unity_SpecCube0_HDR.w, u_xlat41, 1.0);
    u_xlat41 = u_xlat41 * Globals.unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat7.xyz * float3(u_xlat41);
    u_xlatb43 = Globals.unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<Globals.unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = rsqrt(u_xlat43);
            u_xlat9.xyz = float3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-input.TEXCOORD2.xyz) + Globals.unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = (float3(0.0, 0.0, 0.0)<u_xlat9.xyz);
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = input.TEXCOORD2.xyz + (-Globals.unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = fma(u_xlat9.xyz, float3(u_xlat43), u_xlat10.xyz);
        }
        u_xlat4 = unity_SpecCube1.sample(samplerunity_SpecCube0, u_xlat4.xyz, level(u_xlat40));
        u_xlat40 = u_xlat4.w + -1.0;
        u_xlat40 = fma(Globals.unity_SpecCube1_HDR.w, u_xlat40, 1.0);
        u_xlat40 = u_xlat40 * Globals.unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat4.xyz * float3(u_xlat40);
        u_xlat7.xyz = fma(float3(u_xlat41), u_xlat7.xyz, (-u_xlat4.xyz));
        u_xlat8.xyz = fma(Globals.unity_SpecCube0_BoxMin.www, u_xlat7.xyz, u_xlat4.xyz);
    }
    u_xlat40 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat40 = rsqrt(u_xlat40);
    u_xlat4.xyz = float3(u_xlat40) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat40 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat39), Globals._WorldSpaceLightPos0.xyz);
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = rsqrt(u_xlat39);
    u_xlat0.xyz = float3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, float2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = fma(u_xlat13.x, u_xlat26, 1.0);
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = fma(u_xlat13.x, u_xlat27, 1.0);
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = fma(abs(u_xlat39), u_xlat41, u_xlat26);
    u_xlat41 = fma(u_xlat1.x, u_xlat41, u_xlat26);
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = fma(u_xlat1.x, u_xlat4.x, u_xlat39);
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = fma(u_xlat14, u_xlat41, (-u_xlat14));
    u_xlat14 = fma(u_xlat4.x, u_xlat14, 1.0);
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = fma(u_xlat14, u_xlat14, 1.00000001e-07);
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = fma((-u_xlat26), 0.280000001, 1.0);
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + Globals._Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat4.xyz = fma(u_xlat5.xyz, u_xlat13.xxx, u_xlat6.xyz);
    u_xlat5.xyz = u_xlat5.xyz * float3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat0.xyw = fma(u_xlat6.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = fma(u_xlat3.xyz, u_xlat4.xyz, u_xlat0.xyw);
    u_xlat3.xyz = u_xlat8.xyz * float3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = fma(float3(u_xlat27), u_xlat1.xyw, u_xlat2.xyz);
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyw);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
float u_xlat10;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat10 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat1.xyz = vec3(u_xlat10) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    u_xlat10 = u_xlat1.y * u_xlat1.y;
    u_xlat10 = u_xlat1.x * u_xlat1.x + (-u_xlat10);
    u_xlat2 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat1.x = dot(unity_SHBr, u_xlat2);
    u_xlat1.y = dot(unity_SHBg, u_xlat2);
    u_xlat1.z = dot(unity_SHBb, u_xlat2);
    vs_TEXCOORD3.xyz = unity_SHC.xyz * vec3(u_xlat10) + u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat0.zw;
    vs_TEXCOORD4.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat13;
float u_xlat14;
float u_xlat17;
float u_xlat26;
float u_xlat27;
float u_xlat39;
float u_xlat40;
float u_xlat16_40;
bool u_xlatb40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat41 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = unity_ShadowFadeCenterAndType.w * u_xlat41 + u_xlat40;
    u_xlat40 = u_xlat40 * _LightShadowData.z + _LightShadowData.w;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb42)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat42, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat40 = u_xlat40 + u_xlat10_4.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat42 = min(u_xlat40, u_xlat42);
    u_xlat40 = (u_xlatb41) ? u_xlat42 : u_xlat40;
    u_xlat42 = (-_Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz * (-u_xlat4.xxx) + (-u_xlat1.xyz);
    u_xlat5.xyz = vec3(u_xlat40) * _LightColor0.xyz;
    if(u_xlatb41){
        u_xlatb40 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = vs_TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat10_7, u_xlat9);
        u_xlat7.y = dot(u_xlat10_8, u_xlat9);
        u_xlat7.z = dot(u_xlat10_6, u_xlat9);
    } else {
        u_xlat6.xyz = vs_TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(unity_SHAr, u_xlat6);
        u_xlat7.y = dot(unity_SHAg, u_xlat6);
        u_xlat7.z = dot(unity_SHAb, u_xlat6);
    //ENDIF
    }
    u_xlat6.xyz = u_xlat7.xyz + vs_TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat40) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = (-u_xlat42) * 0.699999988 + 1.70000005;
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat40);
    u_xlat16_41 = u_xlat10_7.w + -1.0;
    u_xlat41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat41 = u_xlat41 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat41);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat9.xyz = vec3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat43) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, u_xlat40);
        u_xlat16_40 = u_xlat10_4.w + -1.0;
        u_xlat40 = unity_SpecCube1_HDR.w * u_xlat16_40 + 1.0;
        u_xlat40 = u_xlat40 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat40 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, vec2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = u_xlat13.x * u_xlat26 + 1.0;
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = u_xlat13.x * u_xlat27 + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = abs(u_xlat39) * u_xlat41 + u_xlat26;
    u_xlat41 = u_xlat1.x * u_xlat41 + u_xlat26;
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = u_xlat1.x * u_xlat4.x + u_xlat39;
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = u_xlat14 * u_xlat41 + (-u_xlat14);
    u_xlat14 = u_xlat4.x * u_xlat14 + 1.0;
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = u_xlat14 * u_xlat14 + 1.00000001e-07;
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + _Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat13.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat6.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat8.xyz * vec3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyw + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL VERTEXLIGHT_ON 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (464 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 256
  Matrix4x4 unity_WorldToObject at 320
  Matrix4x4 unity_MatrixVP at 384
  Vector4 unity_4LightPosX0 at 0
  Vector4 unity_4LightPosY0 at 16
  Vector4 unity_4LightPosZ0 at 32
  Vector4 unity_4LightAtten0 at 48
  Vector4 unity_LightColor[8] at 64
  Vector4 unity_SHBr at 192
  Vector4 unity_SHBg at 208
  Vector4 unity_SHBb at 224
  Vector4 unity_SHC at 240
  Vector4 _MainTex_ST at 448
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float u_xlat15;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD4.xy = float2(0.0, 0.0);
    u_xlat1.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = rsqrt(u_xlat15);
    u_xlat1.xyz = float3(u_xlat15) * u_xlat1.xyz;
    output.TEXCOORD1.xyz = u_xlat1.xyz;
    output.TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + Globals.unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + Globals.unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + Globals.unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = fma(u_xlat2, u_xlat2, u_xlat3);
    u_xlat2 = fma(u_xlat2, u_xlat1.xxxx, u_xlat4);
    u_xlat2 = fma(u_xlat0, u_xlat1.zzzz, u_xlat2);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat3);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, Globals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * Globals.unity_LightColor[1].xyz;
    u_xlat2.xyz = fma(Globals.unity_LightColor[0].xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.unity_LightColor[2].xyz, u_xlat0.zzz, u_xlat2.xyz);
    u_xlat0.xyz = fma(Globals.unity_LightColor[3].xyz, u_xlat0.www, u_xlat0.xyz);
    u_xlat2.xyz = fma(u_xlat0.xyz, float3(0.305306017, 0.305306017, 0.305306017), float3(0.682171106, 0.682171106, 0.682171106));
    u_xlat2.xyz = fma(u_xlat0.xyz, u_xlat2.xyz, float3(0.0125228781, 0.0125228781, 0.0125228781));
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = fma(u_xlat1.x, u_xlat1.x, (-u_xlat15));
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(Globals.unity_SHBr, u_xlat1);
    u_xlat3.y = dot(Globals.unity_SHBg, u_xlat1);
    u_xlat3.z = dot(Globals.unity_SHBb, u_xlat1);
    u_xlat1.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat15), u_xlat3.xyz);
    output.TEXCOORD3.xyz = fma(u_xlat0.xyz, u_xlat2.xyz, u_xlat1.xyz);
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD4;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
float u_xlat15;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD4.xy = vec2(0.0, 0.0);
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat15 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat1.xyz = vec3(u_xlat15) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat2 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat3 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat4 = u_xlat1.yyyy * u_xlat3;
    u_xlat3 = u_xlat3 * u_xlat3;
    u_xlat3 = u_xlat2 * u_xlat2 + u_xlat3;
    u_xlat2 = u_xlat2 * u_xlat1.xxxx + u_xlat4;
    u_xlat2 = u_xlat0 * u_xlat1.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat3;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat3 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat2 = u_xlat2 * u_xlat3;
    u_xlat2 = max(u_xlat2, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat2;
    u_xlat2.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat2.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat2.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat15 = u_xlat1.y * u_xlat1.y;
    u_xlat15 = u_xlat1.x * u_xlat1.x + (-u_xlat15);
    u_xlat1 = u_xlat1.yzzx * u_xlat1.xyzz;
    u_xlat3.x = dot(unity_SHBr, u_xlat1);
    u_xlat3.y = dot(unity_SHBg, u_xlat1);
    u_xlat3.z = dot(unity_SHBb, u_xlat1);
    u_xlat1.xyz = unity_SHC.xyz * vec3(u_xlat15) + u_xlat3.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat2.xyz + u_xlat1.xyz;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat13;
float u_xlat14;
float u_xlat26;
float u_xlat27;
float u_xlat39;
float u_xlat40;
float u_xlat16_40;
bool u_xlatb40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlatb40 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb40){
        u_xlatb41 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb41)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat41 = u_xlat4.y * 0.25 + 0.75;
        u_xlat42 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat41, u_xlat42);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat41 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
    u_xlat42 = (-_Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz * (-u_xlat4.xxx) + (-u_xlat1.xyz);
    u_xlat5.xyz = vec3(u_xlat41) * _LightColor0.xyz;
    if(u_xlatb40){
        u_xlatb40 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = vs_TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat10_7, u_xlat9);
        u_xlat7.y = dot(u_xlat10_8, u_xlat9);
        u_xlat7.z = dot(u_xlat10_6, u_xlat9);
    } else {
        u_xlat6.xyz = vs_TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(unity_SHAr, u_xlat6);
        u_xlat7.y = dot(unity_SHAg, u_xlat6);
        u_xlat7.z = dot(unity_SHAb, u_xlat6);
    //ENDIF
    }
    u_xlat6.xyz = u_xlat7.xyz + vs_TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat40) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = (-u_xlat42) * 0.699999988 + 1.70000005;
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat40);
    u_xlat16_41 = u_xlat10_7.w + -1.0;
    u_xlat41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat41 = u_xlat41 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat41);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat9.xyz = vec3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat43) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, u_xlat40);
        u_xlat16_40 = u_xlat10_4.w + -1.0;
        u_xlat40 = unity_SpecCube1_HDR.w * u_xlat16_40 + 1.0;
        u_xlat40 = u_xlat40 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat40 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, vec2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = u_xlat13.x * u_xlat26 + 1.0;
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = u_xlat13.x * u_xlat27 + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = abs(u_xlat39) * u_xlat41 + u_xlat26;
    u_xlat41 = u_xlat1.x * u_xlat41 + u_xlat26;
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = u_xlat1.x * u_xlat4.x + u_xlat39;
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = u_xlat14 * u_xlat41 + (-u_xlat14);
    u_xlat14 = u_xlat4.x * u_xlat14 + 1.0;
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = u_xlat14 * u_xlat14 + 1.00000001e-07;
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + _Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat13.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat6.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat8.xyz * vec3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyw + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL SHADOWS_SCREEN VERTEXLIGHT_ON 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (480 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 272
  Matrix4x4 unity_WorldToObject at 336
  Matrix4x4 unity_MatrixVP at 400
  Vector4 _ProjectionParams at 0
  Vector4 unity_4LightPosX0 at 16
  Vector4 unity_4LightPosY0 at 32
  Vector4 unity_4LightPosZ0 at 48
  Vector4 unity_4LightAtten0 at 64
  Vector4 unity_LightColor[8] at 80
  Vector4 unity_SHBr at 208
  Vector4 unity_SHBg at 224
  Vector4 unity_SHBb at 240
  Vector4 unity_SHC at 256
  Vector4 _MainTex_ST at 464
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _ProjectionParams;
    float4 unity_4LightPosX0;
    float4 unity_4LightPosY0;
    float4 unity_4LightPosZ0;
    float4 unity_4LightAtten0;
    float4 unity_LightColor[8];
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float3 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float4 TEXCOORD6 [[ user(TEXCOORD6) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat18;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat2 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat2);
    u_xlat2 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat2);
    u_xlat1 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat2);
    output.mtl_Position = u_xlat1;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat2.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat2.xyz = float3(u_xlat18) * u_xlat2.xyz;
    output.TEXCOORD1.xyz = u_xlat2.xyz;
    output.TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat3 = (-u_xlat0.xxxx) + Globals.unity_4LightPosX0;
    u_xlat4 = (-u_xlat0.yyyy) + Globals.unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + Globals.unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = fma(u_xlat3, u_xlat3, u_xlat4);
    u_xlat3 = fma(u_xlat3, u_xlat2.xxxx, u_xlat5);
    u_xlat3 = fma(u_xlat0, u_xlat2.zzzz, u_xlat3);
    u_xlat0 = fma(u_xlat0, u_xlat0, u_xlat4);
    u_xlat0 = max(u_xlat0, float4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = rsqrt(u_xlat0);
    u_xlat0 = fma(u_xlat0, Globals.unity_4LightAtten0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlat0 = float4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, float4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat3.xyz = u_xlat0.yyy * Globals.unity_LightColor[1].xyz;
    u_xlat3.xyz = fma(Globals.unity_LightColor[0].xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = fma(Globals.unity_LightColor[2].xyz, u_xlat0.zzz, u_xlat3.xyz);
    u_xlat0.xyz = fma(Globals.unity_LightColor[3].xyz, u_xlat0.www, u_xlat0.xyz);
    u_xlat3.xyz = fma(u_xlat0.xyz, float3(0.305306017, 0.305306017, 0.305306017), float3(0.682171106, 0.682171106, 0.682171106));
    u_xlat3.xyz = fma(u_xlat0.xyz, u_xlat3.xyz, float3(0.0125228781, 0.0125228781, 0.0125228781));
    u_xlat18 = u_xlat2.y * u_xlat2.y;
    u_xlat18 = fma(u_xlat2.x, u_xlat2.x, (-u_xlat18));
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(Globals.unity_SHBr, u_xlat2);
    u_xlat4.y = dot(Globals.unity_SHBg, u_xlat2);
    u_xlat4.z = dot(Globals.unity_SHBb, u_xlat2);
    u_xlat2.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat18), u_xlat4.xyz);
    output.TEXCOORD3.xyz = fma(u_xlat0.xyz, u_xlat3.xyz, u_xlat2.xyz);
    u_xlat0.x = u_xlat1.y * Globals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * float2(0.5, 0.5);
    output.TEXCOORD4.zw = u_xlat1.zw;
    output.TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    output.TEXCOORD6 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 unity_4LightPosX0;
uniform 	vec4 unity_4LightPosY0;
uniform 	vec4 unity_4LightPosZ0;
uniform 	vec4 unity_4LightAtten0;
uniform 	vec4 unity_LightColor[8];
uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec3 vs_TEXCOORD3;
out vec4 vs_TEXCOORD4;
out vec4 vs_TEXCOORD6;
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat5;
float u_xlat18;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    gl_Position = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat2.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat2.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat2.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat2.xyz = vec3(u_xlat18) * u_xlat2.xyz;
    vs_TEXCOORD1.xyz = u_xlat2.xyz;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat3 = (-u_xlat0.xxxx) + unity_4LightPosX0;
    u_xlat4 = (-u_xlat0.yyyy) + unity_4LightPosY0;
    u_xlat0 = (-u_xlat0.zzzz) + unity_4LightPosZ0;
    u_xlat5 = u_xlat2.yyyy * u_xlat4;
    u_xlat4 = u_xlat4 * u_xlat4;
    u_xlat4 = u_xlat3 * u_xlat3 + u_xlat4;
    u_xlat3 = u_xlat3 * u_xlat2.xxxx + u_xlat5;
    u_xlat3 = u_xlat0 * u_xlat2.zzzz + u_xlat3;
    u_xlat0 = u_xlat0 * u_xlat0 + u_xlat4;
    u_xlat0 = max(u_xlat0, vec4(9.99999997e-07, 9.99999997e-07, 9.99999997e-07, 9.99999997e-07));
    u_xlat4 = inversesqrt(u_xlat0);
    u_xlat0 = u_xlat0 * unity_4LightAtten0 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat0 = vec4(1.0, 1.0, 1.0, 1.0) / u_xlat0;
    u_xlat3 = u_xlat3 * u_xlat4;
    u_xlat3 = max(u_xlat3, vec4(0.0, 0.0, 0.0, 0.0));
    u_xlat0 = u_xlat0 * u_xlat3;
    u_xlat3.xyz = u_xlat0.yyy * unity_LightColor[1].xyz;
    u_xlat3.xyz = unity_LightColor[0].xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = unity_LightColor[2].xyz * u_xlat0.zzz + u_xlat3.xyz;
    u_xlat0.xyz = unity_LightColor[3].xyz * u_xlat0.www + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat18 = u_xlat2.y * u_xlat2.y;
    u_xlat18 = u_xlat2.x * u_xlat2.x + (-u_xlat18);
    u_xlat2 = u_xlat2.yzzx * u_xlat2.xyzz;
    u_xlat4.x = dot(unity_SHBr, u_xlat2);
    u_xlat4.y = dot(unity_SHBg, u_xlat2);
    u_xlat4.z = dot(unity_SHBb, u_xlat2);
    u_xlat2.xyz = unity_SHC.xyz * vec3(u_xlat18) + u_xlat4.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz * u_xlat3.xyz + u_xlat2.xyz;
    u_xlat0.x = u_xlat1.y * _ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * vec2(0.5, 0.5);
    vs_TEXCOORD4.zw = u_xlat1.zw;
    vs_TEXCOORD4.xy = u_xlat0.zz + u_xlat0.xw;
    vs_TEXCOORD6 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_SpecCube0_BoxMax;
uniform 	vec4 unity_SpecCube0_BoxMin;
uniform 	vec4 unity_SpecCube0_ProbePosition;
uniform 	vec4 unity_SpecCube0_HDR;
uniform 	vec4 unity_SpecCube1_BoxMax;
uniform 	vec4 unity_SpecCube1_BoxMin;
uniform 	vec4 unity_SpecCube1_ProbePosition;
uniform 	vec4 unity_SpecCube1_HDR;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  samplerCube unity_SpecCube0;
uniform  samplerCube unity_SpecCube1;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD3;
in  vec4 vs_TEXCOORD4;
layout(location = 0) out vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat9;
vec3 u_xlat10;
bvec3 u_xlatb10;
vec3 u_xlat11;
bvec3 u_xlatb12;
vec3 u_xlat13;
float u_xlat14;
float u_xlat17;
float u_xlat26;
float u_xlat27;
float u_xlat39;
float u_xlat40;
float u_xlat16_40;
bool u_xlatb40;
float u_xlat41;
float u_xlat16_41;
bool u_xlatb41;
float u_xlat42;
bool u_xlatb42;
float u_xlat43;
bool u_xlatb43;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat1.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat41 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41 = sqrt(u_xlat41);
    u_xlat41 = (-u_xlat40) + u_xlat41;
    u_xlat40 = unity_ShadowFadeCenterAndType.w * u_xlat41 + u_xlat40;
    u_xlat40 = u_xlat40 * _LightShadowData.z + _LightShadowData.w;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlatb41 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb41){
        u_xlatb42 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb42)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat42 = u_xlat4.y * 0.25 + 0.75;
        u_xlat17 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat42, u_xlat17);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat42 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat42 = clamp(u_xlat42, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD4.xy / vs_TEXCOORD4.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat40 = u_xlat40 + u_xlat10_4.x;
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
    u_xlat42 = min(u_xlat40, u_xlat42);
    u_xlat40 = (u_xlatb41) ? u_xlat42 : u_xlat40;
    u_xlat42 = (-_Glossiness) + 1.0;
    u_xlat4.x = dot((-u_xlat1.xyz), vs_TEXCOORD1.xyz);
    u_xlat4.x = u_xlat4.x + u_xlat4.x;
    u_xlat4.xyz = vs_TEXCOORD1.xyz * (-u_xlat4.xxx) + (-u_xlat1.xyz);
    u_xlat5.xyz = vec3(u_xlat40) * _LightColor0.xyz;
    if(u_xlatb41){
        u_xlatb40 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb40)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat40 = u_xlat6.y * 0.25;
        u_xlat41 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat43 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat40 = max(u_xlat40, u_xlat41);
        u_xlat6.x = min(u_xlat43, u_xlat40);
        u_xlat10_7 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
        u_xlat8.xyz = u_xlat6.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_8 = texture(unity_ProbeVolumeSH, u_xlat8.xyz);
        u_xlat6.xyz = u_xlat6.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_6 = texture(unity_ProbeVolumeSH, u_xlat6.xyz);
        u_xlat9.xyz = vs_TEXCOORD1.xyz;
        u_xlat9.w = 1.0;
        u_xlat7.x = dot(u_xlat10_7, u_xlat9);
        u_xlat7.y = dot(u_xlat10_8, u_xlat9);
        u_xlat7.z = dot(u_xlat10_6, u_xlat9);
    } else {
        u_xlat6.xyz = vs_TEXCOORD1.xyz;
        u_xlat6.w = 1.0;
        u_xlat7.x = dot(unity_SHAr, u_xlat6);
        u_xlat7.y = dot(unity_SHAg, u_xlat6);
        u_xlat7.z = dot(unity_SHAb, u_xlat6);
    //ENDIF
    }
    u_xlat6.xyz = u_xlat7.xyz + vs_TEXCOORD3.xyz;
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat6.xyz = log2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat6.xyz = exp2(u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat6.xyz = max(u_xlat6.xyz, vec3(0.0, 0.0, 0.0));
    u_xlatb40 = 0.0<unity_SpecCube0_ProbePosition.w;
    if(u_xlatb40){
        u_xlat40 = dot(u_xlat4.xyz, u_xlat4.xyz);
        u_xlat40 = inversesqrt(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat40) * u_xlat4.xyz;
        u_xlat8.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMax.xyz;
        u_xlat8.xyz = u_xlat8.xyz / u_xlat7.xyz;
        u_xlat9.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube0_BoxMin.xyz;
        u_xlat9.xyz = u_xlat9.xyz / u_xlat7.xyz;
        u_xlatb10.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat7.xyzx).xyz;
        u_xlat8.x = (u_xlatb10.x) ? u_xlat8.x : u_xlat9.x;
        u_xlat8.y = (u_xlatb10.y) ? u_xlat8.y : u_xlat9.y;
        u_xlat8.z = (u_xlatb10.z) ? u_xlat8.z : u_xlat9.z;
        u_xlat40 = min(u_xlat8.y, u_xlat8.x);
        u_xlat40 = min(u_xlat8.z, u_xlat40);
        u_xlat8.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube0_ProbePosition.xyz);
        u_xlat7.xyz = u_xlat7.xyz * vec3(u_xlat40) + u_xlat8.xyz;
    } else {
        u_xlat7.xyz = u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = (-u_xlat42) * 0.699999988 + 1.70000005;
    u_xlat40 = u_xlat40 * u_xlat42;
    u_xlat40 = u_xlat40 * 6.0;
    u_xlat10_7 = textureLod(unity_SpecCube0, u_xlat7.xyz, u_xlat40);
    u_xlat16_41 = u_xlat10_7.w + -1.0;
    u_xlat41 = unity_SpecCube0_HDR.w * u_xlat16_41 + 1.0;
    u_xlat41 = u_xlat41 * unity_SpecCube0_HDR.x;
    u_xlat8.xyz = u_xlat10_7.xyz * vec3(u_xlat41);
    u_xlatb43 = unity_SpecCube0_BoxMin.w<0.999989986;
    if(u_xlatb43){
        u_xlatb43 = 0.0<unity_SpecCube1_ProbePosition.w;
        if(u_xlatb43){
            u_xlat43 = dot(u_xlat4.xyz, u_xlat4.xyz);
            u_xlat43 = inversesqrt(u_xlat43);
            u_xlat9.xyz = vec3(u_xlat43) * u_xlat4.xyz;
            u_xlat10.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMax.xyz;
            u_xlat10.xyz = u_xlat10.xyz / u_xlat9.xyz;
            u_xlat11.xyz = (-vs_TEXCOORD2.xyz) + unity_SpecCube1_BoxMin.xyz;
            u_xlat11.xyz = u_xlat11.xyz / u_xlat9.xyz;
            u_xlatb12.xyz = lessThan(vec4(0.0, 0.0, 0.0, 0.0), u_xlat9.xyzx).xyz;
            u_xlat10.x = (u_xlatb12.x) ? u_xlat10.x : u_xlat11.x;
            u_xlat10.y = (u_xlatb12.y) ? u_xlat10.y : u_xlat11.y;
            u_xlat10.z = (u_xlatb12.z) ? u_xlat10.z : u_xlat11.z;
            u_xlat43 = min(u_xlat10.y, u_xlat10.x);
            u_xlat43 = min(u_xlat10.z, u_xlat43);
            u_xlat10.xyz = vs_TEXCOORD2.xyz + (-unity_SpecCube1_ProbePosition.xyz);
            u_xlat4.xyz = u_xlat9.xyz * vec3(u_xlat43) + u_xlat10.xyz;
        //ENDIF
        }
        u_xlat10_4 = textureLod(unity_SpecCube1, u_xlat4.xyz, u_xlat40);
        u_xlat16_40 = u_xlat10_4.w + -1.0;
        u_xlat40 = unity_SpecCube1_HDR.w * u_xlat16_40 + 1.0;
        u_xlat40 = u_xlat40 * unity_SpecCube1_HDR.x;
        u_xlat4.xyz = u_xlat10_4.xyz * vec3(u_xlat40);
        u_xlat7.xyz = vec3(u_xlat41) * u_xlat10_7.xyz + (-u_xlat4.xyz);
        u_xlat8.xyz = unity_SpecCube0_BoxMin.www * u_xlat7.xyz + u_xlat4.xyz;
    //ENDIF
    }
    u_xlat40 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat4.xyz = vec3(u_xlat40) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat40 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat40) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat39) + _WorldSpaceLightPos0.xyz;
    u_xlat39 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat39 = max(u_xlat39, 0.00100000005);
    u_xlat39 = inversesqrt(u_xlat39);
    u_xlat0.xyz = vec3(u_xlat39) * u_xlat0.xyz;
    u_xlat39 = dot(u_xlat4.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat4.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat14 = dot(u_xlat4.xyz, u_xlat0.xyz);
    u_xlat14 = clamp(u_xlat14, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = dot(u_xlat13.xx, vec2(u_xlat42));
    u_xlat13.x = u_xlat13.x + -0.5;
    u_xlat26 = (-u_xlat1.x) + 1.0;
    u_xlat27 = u_xlat26 * u_xlat26;
    u_xlat27 = u_xlat27 * u_xlat27;
    u_xlat26 = u_xlat26 * u_xlat27;
    u_xlat26 = u_xlat13.x * u_xlat26 + 1.0;
    u_xlat27 = -abs(u_xlat39) + 1.0;
    u_xlat41 = u_xlat27 * u_xlat27;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat27 = u_xlat27 * u_xlat41;
    u_xlat13.x = u_xlat13.x * u_xlat27 + 1.0;
    u_xlat13.x = u_xlat13.x * u_xlat26;
    u_xlat26 = u_xlat42 * u_xlat42;
    u_xlat26 = max(u_xlat26, 0.00200000009);
    u_xlat41 = (-u_xlat26) + 1.0;
    u_xlat4.x = abs(u_xlat39) * u_xlat41 + u_xlat26;
    u_xlat41 = u_xlat1.x * u_xlat41 + u_xlat26;
    u_xlat39 = abs(u_xlat39) * u_xlat41;
    u_xlat39 = u_xlat1.x * u_xlat4.x + u_xlat39;
    u_xlat39 = u_xlat39 + 9.99999975e-06;
    u_xlat39 = 0.5 / u_xlat39;
    u_xlat41 = u_xlat26 * u_xlat26;
    u_xlat4.x = u_xlat14 * u_xlat41 + (-u_xlat14);
    u_xlat14 = u_xlat4.x * u_xlat14 + 1.0;
    u_xlat41 = u_xlat41 * 0.318309873;
    u_xlat14 = u_xlat14 * u_xlat14 + 1.00000001e-07;
    u_xlat14 = u_xlat41 / u_xlat14;
    u_xlat39 = u_xlat39 * u_xlat14;
    u_xlat39 = u_xlat39 * 3.14159274;
    u_xlat39 = max(u_xlat39, 9.99999975e-05);
    u_xlat13.z = sqrt(u_xlat39);
    u_xlat13.xz = u_xlat1.xx * u_xlat13.xz;
    u_xlat26 = u_xlat26 * u_xlat42;
    u_xlat26 = (-u_xlat26) * 0.280000001 + 1.0;
    u_xlat1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb1 = u_xlat1.x!=0.0;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat39 = u_xlat13.z * u_xlat1.x;
    u_xlat1.x = (-u_xlat40) + _Glossiness;
    u_xlat1.x = u_xlat1.x + 1.0;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat13.xxx + u_xlat6.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat39);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat13.x = u_xlat0.x * u_xlat0.x;
    u_xlat13.x = u_xlat13.x * u_xlat13.x;
    u_xlat0.x = u_xlat0.x * u_xlat13.x;
    u_xlat6.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyw = u_xlat6.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyw = u_xlat0.xyw * u_xlat5.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat4.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat8.xyz * vec3(u_xlat26);
    u_xlat1.xyw = (-u_xlat2.xyz) + u_xlat1.xxx;
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyw + u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

 }
 Pass {
  Name "FORWARD"
  Tags { "LIGHTMODE"="FORWARDADD" "SHADOWSUPPORT"="true" "RenderType"="Opaque" }
  ZWrite Off
  Blend One One
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords set in this variant: POINT 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat4.xyz = u_xlat3.xyz * Globals._Color.xyz;
    u_xlat5.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
    u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, Globals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = _LightTexture0.sample(sampler_LightTexture0, float2(u_xlat23)).x;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * Globals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat3.xyz = fma(float3(Globals._Metallic), u_xlat3.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat22 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec3 u_xlat7;
float u_xlat8;
float u_xlat9;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTexture0, vec2(u_xlat23));
    u_xlat22 = u_xlat22 * u_xlat10_5.w;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat6.xyz = vec3(u_xlat22) * vs_TEXCOORD1.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat22 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, vec2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = u_xlat7.x * u_xlat14 + 1.0;
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = u_xlat7.x * u_xlat1.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = abs(u_xlat21) * u_xlat1.x + u_xlat14;
    u_xlat1.x = u_xlat2.x * u_xlat1.x + u_xlat14;
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = u_xlat2.x * u_xlat8 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat9 * u_xlat14 + (-u_xlat9);
    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 176
  Float _Metallic at 180
  Vector4 _Color at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat12;
    float u_xlat13;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlatb19 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : input.TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat20 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat4, Globals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat4.xyz = float3(u_xlat19) * Globals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat19 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), Globals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat12;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb19)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat4.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat19, u_xlat20);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat5.xyz = vec3(u_xlat19) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat19 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, vec2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = u_xlat6.x * u_xlat12 + 1.0;
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = u_xlat6.x * u_xlat13 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = abs(u_xlat18) * u_xlat13 + u_xlat12;
    u_xlat13 = u_xlat1.x * u_xlat13 + u_xlat12;
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = u_xlat1.x * u_xlat19 + u_xlat18;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat7 * u_xlat12 + (-u_xlat7);
    u_xlat7 = u_xlat13 * u_xlat7 + 1.0;
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = u_xlat7 * u_xlat7 + 1.00000001e-07;
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_LightTexture0" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_LightTextureB0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    bool u_xlatb23;
    float u_xlat24;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat4.xyz = u_xlat3.xyz * Globals._Color.xyz;
    u_xlat5 = input.TEXCOORD2.yyyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat5 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD2.xxxx, u_xlat5);
    u_xlat5 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD2.zzzz, u_xlat5);
    u_xlat5 = u_xlat5 + Globals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb22 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, Globals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlatb23 = 0.0<u_xlat5.z;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat5.xy / u_xlat5.ww;
    u_xlat6.xy = u_xlat6.xy + float2(0.5, 0.5);
    u_xlat24 = _LightTexture0.sample(sampler_LightTexture0, u_xlat6.xy).w;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat24 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat24)).x;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * Globals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat3.xyz = fma(float3(Globals._Metallic), u_xlat3.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat22 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
float u_xlat9;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
float u_xlat24;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat5 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat5;
    u_xlat5 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat5;
    u_xlat5 = u_xlat5 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlatb23 = 0.0<u_xlat5.z;
    u_xlat23 = u_xlatb23 ? 1.0 : float(0.0);
    u_xlat6.xy = u_xlat5.xy / u_xlat5.ww;
    u_xlat6.xy = u_xlat6.xy + vec2(0.5, 0.5);
    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xy);
    u_xlat23 = u_xlat23 * u_xlat10_6.w;
    u_xlat24 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_5 = texture(_LightTextureB0, vec2(u_xlat24));
    u_xlat23 = u_xlat23 * u_xlat10_5.w;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat6.xyz = vec3(u_xlat22) * vs_TEXCOORD1.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat22 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, vec2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = u_xlat7.x * u_xlat14 + 1.0;
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = u_xlat7.x * u_xlat1.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = abs(u_xlat21) * u_xlat1.x + u_xlat14;
    u_xlat1.x = u_xlat2.x * u_xlat1.x + u_xlat14;
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = u_xlat2.x * u_xlat8 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat9 * u_xlat14 + (-u_xlat9);
    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_LightTextureB0" to slot 1 sampler slot 2
Set CUBE Texture "_LightTexture0" to slot 2 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_LightTextureB0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (1) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float3 u_xlat7;
    float u_xlat8;
    float u_xlat9;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat23;
    float u_xlat24;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat1.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat2.xyz = float3(u_xlat22) * u_xlat2.xyz;
    u_xlat3.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat4.xyz = u_xlat3.xyz * Globals._Color.xyz;
    u_xlat5.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
    u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
        u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
        u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : input.TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat6.yzw = u_xlat6.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat22 = fma(u_xlat6.y, 0.25, 0.75);
        u_xlat23 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    }
    u_xlat22 = dot(u_xlat6, Globals.unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0f, 1.0f);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat23 = _LightTextureB0.sample(sampler_LightTextureB0, float2(u_xlat23)).x;
    u_xlat24 = _LightTexture0.sample(sampler_LightTexture0, u_xlat5.xyz).w;
    u_xlat23 = u_xlat23 * u_xlat24;
    u_xlat22 = u_xlat22 * u_xlat23;
    u_xlat5.xyz = float3(u_xlat22) * Globals._LightColor0.xyz;
    u_xlat22 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat22 = rsqrt(u_xlat22);
    u_xlat6.xyz = float3(u_xlat22) * input.TEXCOORD1.xyz;
    u_xlat3.xyz = fma(u_xlat3.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat3.xyz = fma(float3(Globals._Metallic), u_xlat3.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat22 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat4.xyz = float3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat21), u_xlat2.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0f, 1.0f);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, float2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = fma(u_xlat7.x, u_xlat14, 1.0);
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = fma(u_xlat7.x, u_xlat1.x, 1.0);
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = fma(abs(u_xlat21), u_xlat1.x, u_xlat14);
    u_xlat1.x = fma(u_xlat2.x, u_xlat1.x, u_xlat14);
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = fma(u_xlat2.x, u_xlat8, u_xlat21);
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = fma(u_xlat9, u_xlat14, (-u_xlat9));
    u_xlat1.x = fma(u_xlat1.x, u_xlat9, 1.0);
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * float3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat3.xyz);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat4.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec4 u_xlat10_5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec3 u_xlat7;
float u_xlat8;
float u_xlat9;
float u_xlat14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
float u_xlat16_23;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat22 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat2.xyz = vec3(u_xlat22) * u_xlat2.xyz;
    u_xlat10_3 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_3.xyz * _Color.xyz;
    u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
    u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlatb22 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb22){
        u_xlatb22 = unity_ProbeVolumeParams.y==1.0;
        u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
        u_xlat6.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
        u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat6.xyz = (bool(u_xlatb22)) ? u_xlat6.xyz : vs_TEXCOORD2.xyz;
        u_xlat6.xyz = u_xlat6.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat6.yzw = u_xlat6.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat22 = u_xlat6.y * 0.25 + 0.75;
        u_xlat23 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat6.x = max(u_xlat22, u_xlat23);
        u_xlat6 = texture(unity_ProbeVolumeSH, u_xlat6.xzw);
    } else {
        u_xlat6.x = float(1.0);
        u_xlat6.y = float(1.0);
        u_xlat6.z = float(1.0);
        u_xlat6.w = float(1.0);
    //ENDIF
    }
    u_xlat22 = dot(u_xlat6, unity_OcclusionMaskSelector);
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
    u_xlat23 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat10_6 = texture(_LightTextureB0, vec2(u_xlat23));
    u_xlat10_5 = texture(_LightTexture0, u_xlat5.xyz);
    u_xlat16_23 = u_xlat10_5.w * u_xlat10_6.w;
    u_xlat22 = u_xlat22 * u_xlat16_23;
    u_xlat5.xyz = vec3(u_xlat22) * _LightColor0.xyz;
    u_xlat22 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat6.xyz = vec3(u_xlat22) * vs_TEXCOORD1.xyz;
    u_xlat3.xyz = u_xlat10_3.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat3.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat3.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat22 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat4.xyz = vec3(u_xlat22) * u_xlat4.xyz;
    u_xlat22 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat21) + u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 0.00100000005);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat21 = dot(u_xlat6.xyz, u_xlat2.xyz);
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
    u_xlat9 = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat9 = clamp(u_xlat9, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * u_xlat0.x;
    u_xlat7.x = dot(u_xlat7.xx, vec2(u_xlat22));
    u_xlat7.x = u_xlat7.x + -0.5;
    u_xlat14 = (-u_xlat2.x) + 1.0;
    u_xlat1.x = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat1.x;
    u_xlat14 = u_xlat7.x * u_xlat14 + 1.0;
    u_xlat1.x = -abs(u_xlat21) + 1.0;
    u_xlat8 = u_xlat1.x * u_xlat1.x;
    u_xlat8 = u_xlat8 * u_xlat8;
    u_xlat1.x = u_xlat1.x * u_xlat8;
    u_xlat7.x = u_xlat7.x * u_xlat1.x + 1.0;
    u_xlat7.x = u_xlat7.x * u_xlat14;
    u_xlat14 = u_xlat22 * u_xlat22;
    u_xlat14 = max(u_xlat14, 0.00200000009);
    u_xlat1.x = (-u_xlat14) + 1.0;
    u_xlat8 = abs(u_xlat21) * u_xlat1.x + u_xlat14;
    u_xlat1.x = u_xlat2.x * u_xlat1.x + u_xlat14;
    u_xlat21 = abs(u_xlat21) * u_xlat1.x;
    u_xlat21 = u_xlat2.x * u_xlat8 + u_xlat21;
    u_xlat21 = u_xlat21 + 9.99999975e-06;
    u_xlat21 = 0.5 / u_xlat21;
    u_xlat14 = u_xlat14 * u_xlat14;
    u_xlat1.x = u_xlat9 * u_xlat14 + (-u_xlat9);
    u_xlat1.x = u_xlat1.x * u_xlat9 + 1.0;
    u_xlat14 = u_xlat14 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat14 = u_xlat14 / u_xlat1.x;
    u_xlat14 = u_xlat14 * u_xlat21;
    u_xlat14 = u_xlat14 * 3.14159274;
    u_xlat14 = max(u_xlat14, 9.99999975e-05);
    u_xlat7.y = sqrt(u_xlat14);
    u_xlat7.xy = u_xlat2.xx * u_xlat7.xy;
    u_xlat21 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlatb21 = u_xlat21!=0.0;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat14 = u_xlat21 * u_xlat7.y;
    u_xlat1.xyz = u_xlat7.xxx * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.xyz * vec3(u_xlat14);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat22 = u_xlat0.x * u_xlat0.x;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat0.x = u_xlat0.x * u_xlat22;
    u_xlat2.xyz = (-u_xlat3.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat3.xyz;
    u_xlat0.xyz = u_xlat7.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat4.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_LightTexture0" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Matrix4x4 unity_WorldToLight at 176
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Vector4 _LightColor0 at 160
  Float _Glossiness at 240
  Float _Metallic at 244
  Vector4 _Color at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_LightTexture0 [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat12;
    float u_xlat13;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    bool u_xlatb19;
    float u_xlat20;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlat4.xy = input.TEXCOORD2.yy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD2.xx, u_xlat4.xy);
    u_xlat4.xy = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD2.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : input.TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat19 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat20 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat19 = dot(u_xlat5, Globals.unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat20 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat4.xyz = float3(u_xlat19) * Globals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat19 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), Globals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat12;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
bool u_xlatb19;
float u_xlat20;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat4.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlatb19 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb19){
        u_xlatb19 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb19)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat19 = u_xlat5.y * 0.25 + 0.75;
        u_xlat20 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat19, u_xlat20);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat19 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat5.xyz = vec3(u_xlat19) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat19 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, vec2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = u_xlat6.x * u_xlat12 + 1.0;
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = u_xlat6.x * u_xlat13 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = abs(u_xlat18) * u_xlat13 + u_xlat12;
    u_xlat13 = u_xlat1.x * u_xlat13 + u_xlat12;
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = u_xlat1.x * u_xlat19 + u_xlat18;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat7 * u_xlat12 + (-u_xlat7);
    u_xlat7 = u_xlat13 * u_xlat7 + 1.0;
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = u_xlat7 * u_xlat7 + 1.00000001e-07;
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 4
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "Globals" (624 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 48
  Matrix4x4 unity_MatrixV at 336
  Matrix4x4 unity_ProbeVolumeWorldToObject at 416
  Matrix4x4 unity_WorldToLight at 528
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 304
  Vector4 unity_ShadowFadeCenterAndType at 320
  Vector4 unity_ProbeVolumeParams at 400
  Vector3 unity_ProbeVolumeSizeInv at 480
  Vector3 unity_ProbeVolumeMin at 496
  Vector4 _LightColor0 at 512
  Float _Glossiness at 592
  Float _Metallic at 596
  Vector4 _Color at 608
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    sampler sampler_MainTex [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float u_xlat9;
    float3 u_xlat10;
    bool u_xlatb10;
    float u_xlat16;
    float u_xlat18;
    float u_xlat24;
    bool u_xlatb24;
    float u_xlat25;
    float u_xlat26;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat3.xyz = float3(u_xlat25) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6 = input.TEXCOORD2.yyyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD2.xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD2.zzzz, u_xlat6);
    u_xlat6 = u_xlat6 + Globals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat25);
    u_xlat25 = fma(u_xlat25, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat10.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat10.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat18 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat10.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0f, 1.0f);
    u_xlat7 = input.TEXCOORD2.yyyy * Globals.hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat7 = fma(Globals.hlslcc_mtx4x4unity_WorldToShadow[0], input.TEXCOORD2.xxxx, u_xlat7);
    u_xlat7 = fma(Globals.hlslcc_mtx4x4unity_WorldToShadow[2], input.TEXCOORD2.zzzz, u_xlat7);
    u_xlat7 = u_xlat7 + Globals.hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat7.xyz = u_xlat7.xyz / u_xlat7.www;
    u_xlat18 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat7.xy, saturate(u_xlat7.z), level(0.0));
    u_xlat26 = (-Globals._LightShadowData.x) + 1.0;
    u_xlat18 = fma(u_xlat18, u_xlat26, Globals._LightShadowData.x);
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlatb2 = 0.0<u_xlat6.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat10.xy = u_xlat6.xy / u_xlat6.ww;
    u_xlat10.xy = u_xlat10.xy + float2(0.5, 0.5);
    u_xlat10.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat10.xy).w;
    u_xlat2.x = u_xlat10.x * u_xlat2.x;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat10.xx).x;
    u_xlat2.x = u_xlat10.x * u_xlat2.x;
    u_xlat25 = u_xlat25 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat25) * Globals._LightColor0.xyz;
    u_xlat25 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat6.xyz = float3(u_xlat25) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat25 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat24), u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat0.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, float2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = fma(u_xlat8.x, u_xlat16, 1.0);
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = fma(u_xlat8.x, u_xlat1.x, 1.0);
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = fma(abs(u_xlat24), u_xlat1.x, u_xlat16);
    u_xlat1.x = fma(u_xlat26, u_xlat1.x, u_xlat16);
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = fma(u_xlat26, u_xlat9, u_xlat24);
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = fma(u_xlat3.x, u_xlat16, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = float2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * float3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat16;
float u_xlat18;
float u_xlat10_18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat6 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat6;
    u_xlat6 = u_xlat6 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat25;
    u_xlat25 = u_xlat25 * _LightShadowData.z + _LightShadowData.w;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat10.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat10.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat7 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
    u_xlat7 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD2.xxxx + u_xlat7;
    u_xlat7 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD2.zzzz + u_xlat7;
    u_xlat7 = u_xlat7 + hlslcc_mtx4x4unity_WorldToShadow[3];
    u_xlat7.xyz = u_xlat7.xyz / u_xlat7.www;
    vec3 txVec0 = vec3(u_xlat7.xy,u_xlat7.z);
    u_xlat10_18 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat26 = (-_LightShadowData.x) + 1.0;
    u_xlat18 = u_xlat10_18 * u_xlat26 + _LightShadowData.x;
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlatb2 = 0.0<u_xlat6.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat10.xy = u_xlat6.xy / u_xlat6.ww;
    u_xlat10.xy = u_xlat10.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture(_LightTexture0, u_xlat10.xy);
    u_xlat2.x = u_xlat2.x * u_xlat10_7.w;
    u_xlat10.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_6 = texture(_LightTextureB0, u_xlat10.xx);
    u_xlat2.x = u_xlat2.x * u_xlat10_6.w;
    u_xlat25 = u_xlat25 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat6.xyz = vec3(u_xlat25) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat25 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat24) + u_xlat3.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, vec2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = u_xlat8.x * u_xlat16 + 1.0;
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + 1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = abs(u_xlat24) * u_xlat1.x + u_xlat16;
    u_xlat1.x = u_xlat26 * u_xlat1.x + u_xlat16;
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = u_xlat26 * u_xlat9 + u_xlat24;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat3.x * u_xlat16 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = vec2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: SPOT SHADOWS_DEPTH SHADOWS_SOFT 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 4
Set 2D Texture "_LightTexture0" to slot 1 sampler slot 2
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0
Set 2D Texture "_ShadowMapTexture" to slot 4 sampler slot 1

Constant Buffer "Globals" (640 bytes) on slot 0 {
  Matrix4x4 unity_WorldToShadow[4] at 48
  Matrix4x4 unity_MatrixV at 336
  Matrix4x4 unity_ProbeVolumeWorldToObject at 416
  Matrix4x4 unity_WorldToLight at 544
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 304
  Vector4 unity_ShadowFadeCenterAndType at 320
  Vector4 unity_ProbeVolumeParams at 400
  Vector3 unity_ProbeVolumeSizeInv at 480
  Vector3 unity_ProbeVolumeMin at 496
  Vector4 _LightColor0 at 512
  Vector4 _ShadowMapTexture_TexelSize at 528
  Float _Glossiness at 608
  Float _Metallic at 612
  Vector4 _Color at 624
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 hlslcc_mtx4x4unity_WorldToShadow[16];
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 _ShadowMapTexture_TexelSize;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

constexpr sampler _mtl_xl_shadow_sampler(address::clamp_to_edge, filter::linear, compare_func::greater_equal);
fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    sampler sampler_MainTex [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    depth2d<float, access::sample > _ShadowMapTexture [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float4 u_xlat6;
    float4 u_xlat7;
    float4 u_xlat8;
    float4 u_xlat9;
    float4 u_xlat10;
    float4 u_xlat11;
    float3 u_xlat12;
    float u_xlat13;
    float3 u_xlat14;
    bool u_xlatb14;
    float u_xlat24;
    float2 u_xlat26;
    bool u_xlatb26;
    float2 u_xlat34;
    float u_xlat36;
    bool u_xlatb36;
    float u_xlat37;
    float u_xlat38;
    float u_xlat39;
    float u_xlat40;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = rsqrt(u_xlat36);
    u_xlat1.xyz = float3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat37 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat37 = rsqrt(u_xlat37);
    u_xlat3.xyz = float3(u_xlat37) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6 = input.TEXCOORD2.yyyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0], input.TEXCOORD2.xxxx, u_xlat6);
    u_xlat6 = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2], input.TEXCOORD2.zzzz, u_xlat6);
    u_xlat6 = u_xlat6 + Globals.hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat37 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat37) + u_xlat2.x;
    u_xlat37 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat37);
    u_xlat37 = fma(u_xlat37, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat37 = clamp(u_xlat37, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb14 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat14.xyz = (bool(u_xlatb14)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat14.xyz = u_xlat14.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat14.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat14.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat26.x = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat26.x, u_xlat14.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat14.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat14.x = clamp(u_xlat14.x, 0.0f, 1.0f);
    u_xlatb26 = u_xlat37<0.99000001;
    if(u_xlatb26){
        u_xlat7 = input.TEXCOORD2.yyyy * Globals.hlslcc_mtx4x4unity_WorldToShadow[1];
        u_xlat7 = fma(Globals.hlslcc_mtx4x4unity_WorldToShadow[0], input.TEXCOORD2.xxxx, u_xlat7);
        u_xlat7 = fma(Globals.hlslcc_mtx4x4unity_WorldToShadow[2], input.TEXCOORD2.zzzz, u_xlat7);
        u_xlat7 = u_xlat7 + Globals.hlslcc_mtx4x4unity_WorldToShadow[3];
        u_xlat7.xyz = u_xlat7.xyz / u_xlat7.www;
        u_xlat26.xy = fma(u_xlat7.xy, Globals._ShadowMapTexture_TexelSize.zw, float2(0.5, 0.5));
        u_xlat26.xy = floor(u_xlat26.xy);
        u_xlat7.xy = fma(u_xlat7.xy, Globals._ShadowMapTexture_TexelSize.zw, (-u_xlat26.xy));
        u_xlat8 = u_xlat7.xxyy + float4(0.5, 1.0, 0.5, 1.0);
        u_xlat9.xw = u_xlat8.xz * u_xlat8.xz;
        u_xlat8.xz = fma(u_xlat9.xw, float2(0.5, 0.5), (-u_xlat7.xy));
        u_xlat10.xy = (-u_xlat7.xy) + float2(1.0, 1.0);
        u_xlat34.xy = min(u_xlat7.xy, float2(0.0, 0.0));
        u_xlat10.xy = fma((-u_xlat34.xy), u_xlat34.xy, u_xlat10.xy);
        u_xlat7.xy = max(u_xlat7.xy, float2(0.0, 0.0));
        u_xlat7.xy = fma((-u_xlat7.xy), u_xlat7.xy, u_xlat8.yw);
        u_xlat11.x = u_xlat8.x;
        u_xlat11.y = u_xlat10.x;
        u_xlat11.z = u_xlat7.x;
        u_xlat11.w = u_xlat9.x;
        u_xlat11 = u_xlat11 * float4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat9.x = u_xlat8.z;
        u_xlat9.y = u_xlat10.y;
        u_xlat9.z = u_xlat7.y;
        u_xlat8 = u_xlat9 * float4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat9 = u_xlat11.ywyw + u_xlat11.xzxz;
        u_xlat10 = u_xlat8.yyww + u_xlat8.xxzz;
        u_xlat7.xy = u_xlat11.yw / u_xlat9.zw;
        u_xlat7.xy = u_xlat7.xy + float2(-1.5, 0.5);
        u_xlat8.xy = u_xlat8.yw / u_xlat10.yw;
        u_xlat8.xy = u_xlat8.xy + float2(-1.5, 0.5);
        u_xlat11.xy = u_xlat7.xy * Globals._ShadowMapTexture_TexelSize.xx;
        u_xlat11.zw = u_xlat8.xy * Globals._ShadowMapTexture_TexelSize.yy;
        u_xlat8 = u_xlat9 * u_xlat10;
        u_xlat9 = fma(u_xlat26.xyxy, Globals._ShadowMapTexture_TexelSize.xyxy, u_xlat11.xzyz);
        u_xlat39 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat9.xy, saturate(u_xlat7.z), level(0.0));
        u_xlat40 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat9.zw, saturate(u_xlat7.z), level(0.0));
        u_xlat40 = u_xlat40 * u_xlat8.y;
        u_xlat39 = fma(u_xlat8.x, u_xlat39, u_xlat40);
        u_xlat9 = fma(u_xlat26.xyxy, Globals._ShadowMapTexture_TexelSize.xyxy, u_xlat11.xwyw);
        u_xlat26.x = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat9.xy, saturate(u_xlat7.z), level(0.0));
        u_xlat26.x = fma(u_xlat8.z, u_xlat26.x, u_xlat39);
        u_xlat38 = _ShadowMapTexture.sample_compare(_mtl_xl_shadow_sampler, u_xlat9.zw, saturate(u_xlat7.z), level(0.0));
        u_xlat26.x = fma(u_xlat8.w, u_xlat38, u_xlat26.x);
        u_xlat38 = (-Globals._LightShadowData.x) + 1.0;
        u_xlat26.x = fma(u_xlat26.x, u_xlat38, Globals._LightShadowData.x);
    } else {
        u_xlat26.x = 1.0;
    }
    u_xlat37 = u_xlat37 + u_xlat26.x;
    u_xlat37 = clamp(u_xlat37, 0.0f, 1.0f);
    u_xlat14.x = min(u_xlat37, u_xlat14.x);
    u_xlat37 = (u_xlatb2) ? u_xlat14.x : u_xlat37;
    u_xlatb2 = 0.0<u_xlat6.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat14.xy = u_xlat6.xy / u_xlat6.ww;
    u_xlat14.xy = u_xlat14.xy + float2(0.5, 0.5);
    u_xlat14.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat14.xy).w;
    u_xlat2.x = u_xlat14.x * u_xlat2.x;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat14.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat14.xx).x;
    u_xlat2.x = u_xlat14.x * u_xlat2.x;
    u_xlat37 = u_xlat37 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat37) * Globals._LightColor0.xyz;
    u_xlat37 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat37 = rsqrt(u_xlat37);
    u_xlat6.xyz = float3(u_xlat37) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat37 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat37) * u_xlat5.xyz;
    u_xlat37 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat36), u_xlat3.xyz);
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = rsqrt(u_xlat36);
    u_xlat0.xyz = float3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat38 = clamp(u_xlat38, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat12.x = u_xlat0.x * u_xlat0.x;
    u_xlat12.x = dot(u_xlat12.xx, float2(u_xlat37));
    u_xlat12.x = u_xlat12.x + -0.5;
    u_xlat24 = (-u_xlat38) + 1.0;
    u_xlat1.x = u_xlat24 * u_xlat24;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = fma(u_xlat12.x, u_xlat24, 1.0);
    u_xlat1.x = -abs(u_xlat36) + 1.0;
    u_xlat13 = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat12.x = fma(u_xlat12.x, u_xlat1.x, 1.0);
    u_xlat12.x = u_xlat12.x * u_xlat24;
    u_xlat24 = u_xlat37 * u_xlat37;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat1.x = (-u_xlat24) + 1.0;
    u_xlat13 = fma(abs(u_xlat36), u_xlat1.x, u_xlat24);
    u_xlat1.x = fma(u_xlat38, u_xlat1.x, u_xlat24);
    u_xlat36 = abs(u_xlat36) * u_xlat1.x;
    u_xlat36 = fma(u_xlat38, u_xlat13, u_xlat36);
    u_xlat36 = u_xlat36 + 9.99999975e-06;
    u_xlat36 = 0.5 / u_xlat36;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat1.x = fma(u_xlat3.x, u_xlat24, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat24 = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat36;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat12.y = sqrt(u_xlat24);
    u_xlat12.xy = float2(u_xlat38) * u_xlat12.xy;
    u_xlat36 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb36 = u_xlat36!=0.0;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat36 * u_xlat12.y;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat2.xyz;
    u_xlat12.xyz = u_xlat2.xyz * float3(u_xlat24);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat37 = u_xlat0.x * u_xlat0.x;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat0.x = u_xlat0.x * u_xlat37;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat12.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToShadow[16];
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _LightTexture0;
uniform  sampler2D _LightTextureB0;
uniform  sampler3D unity_ProbeVolumeSH;
uniform  sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
uniform  sampler2D _ShadowMapTexture;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec4 u_xlat6;
vec4 u_xlat10_6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec4 u_xlat8;
vec4 u_xlat9;
vec4 u_xlat10;
vec4 u_xlat11;
vec3 u_xlat12;
float u_xlat13;
vec3 u_xlat14;
bool u_xlatb14;
float u_xlat24;
vec2 u_xlat26;
float u_xlat10_26;
bool u_xlatb26;
vec2 u_xlat34;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
float u_xlat38;
float u_xlat10_38;
float u_xlat39;
float u_xlat10_39;
float u_xlat40;
float u_xlat10_40;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat1.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat37 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat3.xyz = vec3(u_xlat37) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToLight[1];
    u_xlat6 = hlslcc_mtx4x4unity_WorldToLight[0] * vs_TEXCOORD2.xxxx + u_xlat6;
    u_xlat6 = hlslcc_mtx4x4unity_WorldToLight[2] * vs_TEXCOORD2.zzzz + u_xlat6;
    u_xlat6 = u_xlat6 + hlslcc_mtx4x4unity_WorldToLight[3];
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat37 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat37) + u_xlat2.x;
    u_xlat37 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat37;
    u_xlat37 = u_xlat37 * _LightShadowData.z + _LightShadowData.w;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb14 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat14.xyz = (bool(u_xlatb14)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat14.xyz = u_xlat14.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat14.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat14.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat26.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat26.x, u_xlat14.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat14.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat14.x = clamp(u_xlat14.x, 0.0, 1.0);
    u_xlatb26 = u_xlat37<0.99000001;
    if(u_xlatb26){
        u_xlat7 = vs_TEXCOORD2.yyyy * hlslcc_mtx4x4unity_WorldToShadow[1];
        u_xlat7 = hlslcc_mtx4x4unity_WorldToShadow[0] * vs_TEXCOORD2.xxxx + u_xlat7;
        u_xlat7 = hlslcc_mtx4x4unity_WorldToShadow[2] * vs_TEXCOORD2.zzzz + u_xlat7;
        u_xlat7 = u_xlat7 + hlslcc_mtx4x4unity_WorldToShadow[3];
        u_xlat7.xyz = u_xlat7.xyz / u_xlat7.www;
        u_xlat26.xy = u_xlat7.xy * _ShadowMapTexture_TexelSize.zw + vec2(0.5, 0.5);
        u_xlat26.xy = floor(u_xlat26.xy);
        u_xlat7.xy = u_xlat7.xy * _ShadowMapTexture_TexelSize.zw + (-u_xlat26.xy);
        u_xlat8 = u_xlat7.xxyy + vec4(0.5, 1.0, 0.5, 1.0);
        u_xlat9.xw = u_xlat8.xz * u_xlat8.xz;
        u_xlat8.xz = u_xlat9.xw * vec2(0.5, 0.5) + (-u_xlat7.xy);
        u_xlat10.xy = (-u_xlat7.xy) + vec2(1.0, 1.0);
        u_xlat34.xy = min(u_xlat7.xy, vec2(0.0, 0.0));
        u_xlat10.xy = (-u_xlat34.xy) * u_xlat34.xy + u_xlat10.xy;
        u_xlat7.xy = max(u_xlat7.xy, vec2(0.0, 0.0));
        u_xlat7.xy = (-u_xlat7.xy) * u_xlat7.xy + u_xlat8.yw;
        u_xlat11.x = u_xlat8.x;
        u_xlat11.y = u_xlat10.x;
        u_xlat11.z = u_xlat7.x;
        u_xlat11.w = u_xlat9.x;
        u_xlat11 = u_xlat11 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat9.x = u_xlat8.z;
        u_xlat9.y = u_xlat10.y;
        u_xlat9.z = u_xlat7.y;
        u_xlat8 = u_xlat9 * vec4(0.444440007, 0.444440007, 0.444440007, 0.222220004);
        u_xlat9 = u_xlat11.ywyw + u_xlat11.xzxz;
        u_xlat10 = u_xlat8.yyww + u_xlat8.xxzz;
        u_xlat7.xy = u_xlat11.yw / u_xlat9.zw;
        u_xlat7.xy = u_xlat7.xy + vec2(-1.5, 0.5);
        u_xlat8.xy = u_xlat8.yw / u_xlat10.yw;
        u_xlat8.xy = u_xlat8.xy + vec2(-1.5, 0.5);
        u_xlat11.xy = u_xlat7.xy * _ShadowMapTexture_TexelSize.xx;
        u_xlat11.zw = u_xlat8.xy * _ShadowMapTexture_TexelSize.yy;
        u_xlat8 = u_xlat9 * u_xlat10;
        u_xlat9 = u_xlat26.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat11.xzyz;
        vec3 txVec0 = vec3(u_xlat9.xy,u_xlat7.z);
        u_xlat10_39 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
        vec3 txVec1 = vec3(u_xlat9.zw,u_xlat7.z);
        u_xlat10_40 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
        u_xlat40 = u_xlat10_40 * u_xlat8.y;
        u_xlat39 = u_xlat8.x * u_xlat10_39 + u_xlat40;
        u_xlat9 = u_xlat26.xyxy * _ShadowMapTexture_TexelSize.xyxy + u_xlat11.xwyw;
        vec3 txVec2 = vec3(u_xlat9.xy,u_xlat7.z);
        u_xlat10_26 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
        u_xlat26.x = u_xlat8.z * u_xlat10_26 + u_xlat39;
        vec3 txVec3 = vec3(u_xlat9.zw,u_xlat7.z);
        u_xlat10_38 = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
        u_xlat26.x = u_xlat8.w * u_xlat10_38 + u_xlat26.x;
        u_xlat38 = (-_LightShadowData.x) + 1.0;
        u_xlat26.x = u_xlat26.x * u_xlat38 + _LightShadowData.x;
    } else {
        u_xlat26.x = 1.0;
    //ENDIF
    }
    u_xlat37 = u_xlat37 + u_xlat26.x;
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
    u_xlat14.x = min(u_xlat37, u_xlat14.x);
    u_xlat37 = (u_xlatb2) ? u_xlat14.x : u_xlat37;
    u_xlatb2 = 0.0<u_xlat6.z;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat14.xy = u_xlat6.xy / u_xlat6.ww;
    u_xlat14.xy = u_xlat14.xy + vec2(0.5, 0.5);
    u_xlat10_7 = texture(_LightTexture0, u_xlat14.xy);
    u_xlat2.x = u_xlat2.x * u_xlat10_7.w;
    u_xlat14.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_6 = texture(_LightTextureB0, u_xlat14.xx);
    u_xlat2.x = u_xlat2.x * u_xlat10_6.w;
    u_xlat37 = u_xlat37 * u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat37) * _LightColor0.xyz;
    u_xlat37 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat37 = inversesqrt(u_xlat37);
    u_xlat6.xyz = vec3(u_xlat37) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat37 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat37) * u_xlat5.xyz;
    u_xlat37 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat36) + u_xlat3.xyz;
    u_xlat36 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat36 = max(u_xlat36, 0.00100000005);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat0.xyz = vec3(u_xlat36) * u_xlat0.xyz;
    u_xlat36 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat38 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat38 = clamp(u_xlat38, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat12.x = u_xlat0.x * u_xlat0.x;
    u_xlat12.x = dot(u_xlat12.xx, vec2(u_xlat37));
    u_xlat12.x = u_xlat12.x + -0.5;
    u_xlat24 = (-u_xlat38) + 1.0;
    u_xlat1.x = u_xlat24 * u_xlat24;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat1.x;
    u_xlat24 = u_xlat12.x * u_xlat24 + 1.0;
    u_xlat1.x = -abs(u_xlat36) + 1.0;
    u_xlat13 = u_xlat1.x * u_xlat1.x;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat12.x = u_xlat12.x * u_xlat1.x + 1.0;
    u_xlat12.x = u_xlat12.x * u_xlat24;
    u_xlat24 = u_xlat37 * u_xlat37;
    u_xlat24 = max(u_xlat24, 0.00200000009);
    u_xlat1.x = (-u_xlat24) + 1.0;
    u_xlat13 = abs(u_xlat36) * u_xlat1.x + u_xlat24;
    u_xlat1.x = u_xlat38 * u_xlat1.x + u_xlat24;
    u_xlat36 = abs(u_xlat36) * u_xlat1.x;
    u_xlat36 = u_xlat38 * u_xlat13 + u_xlat36;
    u_xlat36 = u_xlat36 + 9.99999975e-06;
    u_xlat36 = 0.5 / u_xlat36;
    u_xlat24 = u_xlat24 * u_xlat24;
    u_xlat1.x = u_xlat3.x * u_xlat24 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat24 = u_xlat24 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat24 = u_xlat24 / u_xlat1.x;
    u_xlat24 = u_xlat24 * u_xlat36;
    u_xlat24 = u_xlat24 * 3.14159274;
    u_xlat24 = max(u_xlat24, 9.99999975e-05);
    u_xlat12.y = sqrt(u_xlat24);
    u_xlat12.xy = vec2(u_xlat38) * u_xlat12.xy;
    u_xlat36 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb36 = u_xlat36!=0.0;
    u_xlat36 = u_xlatb36 ? 1.0 : float(0.0);
    u_xlat24 = u_xlat36 * u_xlat12.y;
    u_xlat1.xyz = u_xlat12.xxx * u_xlat2.xyz;
    u_xlat12.xyz = u_xlat2.xyz * vec3(u_xlat24);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat37 = u_xlat0.x * u_xlat0.x;
    u_xlat37 = u_xlat37 * u_xlat37;
    u_xlat0.x = u_xlat0.x * u_xlat37;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat12.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.mtl_Position = u_xlat0;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD1.xyz = float3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * Globals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD3.zw = u_xlat0.zw;
    output.TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 2
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 2 sampler slot 0

Constant Buffer "Globals" (304 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Float _Glossiness at 272
  Float _Metallic at 276
  Vector4 _Color at 288
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_MainTex [[ sampler (2) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (2) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float4 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat10;
    float u_xlat12;
    float u_xlat13;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    float u_xlat20;
    bool u_xlatb20;
    float u_xlat21;
    bool u_xlatb21;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlat4.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat4.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat20, u_xlat19);
    u_xlat19 = fma(u_xlat19, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlatb20 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb21 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat4.xyz);
        u_xlat4.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : input.TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat4.yzw = u_xlat4.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat21 = fma(u_xlat4.y, 0.25, 0.75);
        u_xlat10 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat4.x = max(u_xlat21, u_xlat10);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat4, Globals.unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlat4.xy = input.TEXCOORD3.xy / input.TEXCOORD3.ww;
    u_xlat4.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat4.xy).x;
    u_xlat19 = u_xlat19 + u_xlat4.x;
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat21 = min(u_xlat19, u_xlat21);
    u_xlat19 = (u_xlatb20) ? u_xlat21 : u_xlat19;
    u_xlat4.xyz = float3(u_xlat19) * Globals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat19 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), Globals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat10;
float u_xlat12;
float u_xlat13;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat4.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat4.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat4.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat4.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat4.xyz;
        u_xlat4.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat4.xyz;
        u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat4.xyz = (bool(u_xlatb21)) ? u_xlat4.xyz : vs_TEXCOORD2.xyz;
        u_xlat4.xyz = u_xlat4.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat4.yzw = u_xlat4.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat4.y * 0.25 + 0.75;
        u_xlat10 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat4.x = max(u_xlat21, u_xlat10);
        u_xlat4 = texture(unity_ProbeVolumeSH, u_xlat4.xzw);
    } else {
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(1.0);
        u_xlat4.z = float(1.0);
        u_xlat4.w = float(1.0);
    //ENDIF
    }
    u_xlat21 = dot(u_xlat4, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat4.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_4 = texture(_ShadowMapTexture, u_xlat4.xy);
    u_xlat19 = u_xlat19 + u_xlat10_4.x;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat21 = min(u_xlat19, u_xlat21);
    u_xlat19 = (u_xlatb20) ? u_xlat21 : u_xlat19;
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat5.xyz = vec3(u_xlat19) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat19 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, vec2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = u_xlat6.x * u_xlat12 + 1.0;
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = u_xlat6.x * u_xlat13 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = abs(u_xlat18) * u_xlat13 + u_xlat12;
    u_xlat13 = u_xlat1.x * u_xlat13 + u_xlat12;
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = u_xlat1.x * u_xlat19 + u_xlat18;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat7 * u_xlat12 + (-u_xlat7);
    u_xlat7 = u_xlat13 * u_xlat7 + 1.0;
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = u_xlat7 * u_xlat7 + 1.00000001e-07;
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: DIRECTIONAL_COOKIE SHADOWS_SCREEN 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_WorldToObject at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat7;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.mtl_Position = u_xlat0;
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat1.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = rsqrt(u_xlat7);
    output.TEXCOORD1.xyz = float3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * Globals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD3.zw = u_xlat0.zw;
    output.TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set 2D Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (368 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_ProbeVolumeWorldToObject at 160
  Matrix4x4 unity_WorldToLight at 272
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 unity_OcclusionMaskSelector at 32
  Vector4 _LightShadowData at 48
  Vector4 unity_ShadowFadeCenterAndType at 64
  Vector4 unity_ProbeVolumeParams at 144
  Vector3 unity_ProbeVolumeSizeInv at 224
  Vector3 unity_ProbeVolumeMin at 240
  Vector4 _LightColor0 at 256
  Float _Glossiness at 336
  Float _Metallic at 340
  Vector4 _Color at 352
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture2d<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    float3 u_xlat3;
    float3 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat6;
    float u_xlat7;
    float u_xlat12;
    float u_xlat13;
    float2 u_xlat16;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    float u_xlat20;
    bool u_xlatb20;
    float u_xlat21;
    bool u_xlatb21;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat1.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat2.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat3.xyz = u_xlat2.xyz * Globals._Color.xyz;
    u_xlat4.xy = input.TEXCOORD2.yy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xy, input.TEXCOORD2.xx, u_xlat4.xy);
    u_xlat4.xy = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xy, input.TEXCOORD2.zz, u_xlat4.xy);
    u_xlat4.xy = u_xlat4.xy + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat5.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat20, u_xlat19);
    u_xlat19 = fma(u_xlat19, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlatb20 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb21 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat5.xyz);
        u_xlat5.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat5.xyz);
        u_xlat5.xyz = u_xlat5.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : input.TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat5.yzw = u_xlat5.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat21 = fma(u_xlat5.y, 0.25, 0.75);
        u_xlat16.x = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat5.x = max(u_xlat21, u_xlat16.x);
        u_xlat5 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    }
    u_xlat21 = dot(u_xlat5, Globals.unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0f, 1.0f);
    u_xlat16.xy = input.TEXCOORD3.xy / input.TEXCOORD3.ww;
    u_xlat16.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat16.xy).x;
    u_xlat19 = u_xlat19 + u_xlat16.x;
    u_xlat19 = clamp(u_xlat19, 0.0f, 1.0f);
    u_xlat21 = min(u_xlat19, u_xlat21);
    u_xlat19 = (u_xlatb20) ? u_xlat21 : u_xlat19;
    u_xlat20 = _LightTexture0.sample(sampler_LightTexture0, u_xlat4.xy).w;
    u_xlat19 = u_xlat19 * u_xlat20;
    u_xlat4.xyz = float3(u_xlat19) * Globals._LightColor0.xyz;
    u_xlat19 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat19 = rsqrt(u_xlat19);
    u_xlat5.xyz = float3(u_xlat19) * input.TEXCOORD1.xyz;
    u_xlat2.xyz = fma(u_xlat2.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat2.xyz = fma(float3(Globals._Metallic), u_xlat2.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat19 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat3.xyz = float3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat18), Globals._WorldSpaceLightPos0.xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = rsqrt(u_xlat18);
    u_xlat0.xyz = float3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, Globals._WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0f, 1.0f);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0f, 1.0f);
    u_xlat0.x = dot(Globals._WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, float2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = fma(u_xlat6.x, u_xlat12, 1.0);
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = fma(u_xlat6.x, u_xlat13, 1.0);
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = fma(abs(u_xlat18), u_xlat13, u_xlat12);
    u_xlat13 = fma(u_xlat1.x, u_xlat13, u_xlat12);
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = fma(u_xlat1.x, u_xlat19, u_xlat18);
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = fma(u_xlat7, u_xlat12, (-u_xlat7));
    u_xlat7 = fma(u_xlat13, u_xlat7, 1.0);
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = fma(u_xlat7, u_xlat7, 1.00000001e-07);
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * float3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat4.xyz, u_xlat0.xxx, u_xlat2.xyz);
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat3.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat7;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    gl_Position = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat1.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat1.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat1.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat7 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat7 = inversesqrt(u_xlat7);
    vs_TEXCOORD1.xyz = vec3(u_xlat7) * u_xlat1.xyz;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD3.zw = u_xlat0.zw;
    vs_TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler2D _ShadowMapTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec4 vs_TEXCOORD3;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
vec4 u_xlat10_5;
vec3 u_xlat6;
float u_xlat7;
float u_xlat12;
float u_xlat13;
vec2 u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
float u_xlat20;
bool u_xlatb20;
float u_xlat21;
bool u_xlatb21;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat10_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat3.xyz = u_xlat10_2.xyz * _Color.xyz;
    u_xlat4.xy = vs_TEXCOORD2.yy * hlslcc_mtx4x4unity_WorldToLight[1].xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[0].xy * vs_TEXCOORD2.xx + u_xlat4.xy;
    u_xlat4.xy = hlslcc_mtx4x4unity_WorldToLight[2].xy * vs_TEXCOORD2.zz + u_xlat4.xy;
    u_xlat4.xy = u_xlat4.xy + hlslcc_mtx4x4unity_WorldToLight[3].xy;
    u_xlat5.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat5.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat5.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat19 = dot(u_xlat0.xyz, u_xlat5.xyz);
    u_xlat5.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat20 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = (-u_xlat19) + u_xlat20;
    u_xlat19 = unity_ShadowFadeCenterAndType.w * u_xlat20 + u_xlat19;
    u_xlat19 = u_xlat19 * _LightShadowData.z + _LightShadowData.w;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlatb20 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb20){
        u_xlatb21 = unity_ProbeVolumeParams.y==1.0;
        u_xlat5.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat5.xyz;
        u_xlat5.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat5.xyz;
        u_xlat5.xyz = u_xlat5.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat5.xyz = (bool(u_xlatb21)) ? u_xlat5.xyz : vs_TEXCOORD2.xyz;
        u_xlat5.xyz = u_xlat5.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat5.yzw = u_xlat5.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat21 = u_xlat5.y * 0.25 + 0.75;
        u_xlat16.x = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat5.x = max(u_xlat21, u_xlat16.x);
        u_xlat5 = texture(unity_ProbeVolumeSH, u_xlat5.xzw);
    } else {
        u_xlat5.x = float(1.0);
        u_xlat5.y = float(1.0);
        u_xlat5.z = float(1.0);
        u_xlat5.w = float(1.0);
    //ENDIF
    }
    u_xlat21 = dot(u_xlat5, unity_OcclusionMaskSelector);
    u_xlat21 = clamp(u_xlat21, 0.0, 1.0);
    u_xlat16.xy = vs_TEXCOORD3.xy / vs_TEXCOORD3.ww;
    u_xlat10_5 = texture(_ShadowMapTexture, u_xlat16.xy);
    u_xlat19 = u_xlat19 + u_xlat10_5.x;
    u_xlat19 = clamp(u_xlat19, 0.0, 1.0);
    u_xlat21 = min(u_xlat19, u_xlat21);
    u_xlat19 = (u_xlatb20) ? u_xlat21 : u_xlat19;
    u_xlat10_4 = texture(_LightTexture0, u_xlat4.xy);
    u_xlat19 = u_xlat19 * u_xlat10_4.w;
    u_xlat4.xyz = vec3(u_xlat19) * _LightColor0.xyz;
    u_xlat19 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat19 = inversesqrt(u_xlat19);
    u_xlat5.xyz = vec3(u_xlat19) * vs_TEXCOORD1.xyz;
    u_xlat2.xyz = u_xlat10_2.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat2.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat2.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat19 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat3.xyz = vec3(u_xlat19) * u_xlat3.xyz;
    u_xlat19 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat18) + _WorldSpaceLightPos0.xyz;
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 0.00100000005);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = dot(u_xlat5.xyz, u_xlat1.xyz);
    u_xlat1.x = dot(u_xlat5.xyz, _WorldSpaceLightPos0.xyz);
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat7 = dot(u_xlat5.xyz, u_xlat0.xyz);
    u_xlat7 = clamp(u_xlat7, 0.0, 1.0);
    u_xlat0.x = dot(_WorldSpaceLightPos0.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat6.x = u_xlat0.x * u_xlat0.x;
    u_xlat6.x = dot(u_xlat6.xx, vec2(u_xlat19));
    u_xlat6.x = u_xlat6.x + -0.5;
    u_xlat12 = (-u_xlat1.x) + 1.0;
    u_xlat13 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat13 * u_xlat13;
    u_xlat12 = u_xlat12 * u_xlat13;
    u_xlat12 = u_xlat6.x * u_xlat12 + 1.0;
    u_xlat13 = -abs(u_xlat18) + 1.0;
    u_xlat20 = u_xlat13 * u_xlat13;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat13 = u_xlat13 * u_xlat20;
    u_xlat6.x = u_xlat6.x * u_xlat13 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat12;
    u_xlat12 = u_xlat19 * u_xlat19;
    u_xlat12 = max(u_xlat12, 0.00200000009);
    u_xlat13 = (-u_xlat12) + 1.0;
    u_xlat19 = abs(u_xlat18) * u_xlat13 + u_xlat12;
    u_xlat13 = u_xlat1.x * u_xlat13 + u_xlat12;
    u_xlat18 = abs(u_xlat18) * u_xlat13;
    u_xlat18 = u_xlat1.x * u_xlat19 + u_xlat18;
    u_xlat18 = u_xlat18 + 9.99999975e-06;
    u_xlat18 = 0.5 / u_xlat18;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat13 = u_xlat7 * u_xlat12 + (-u_xlat7);
    u_xlat7 = u_xlat13 * u_xlat7 + 1.0;
    u_xlat12 = u_xlat12 * 0.318309873;
    u_xlat7 = u_xlat7 * u_xlat7 + 1.00000001e-07;
    u_xlat12 = u_xlat12 / u_xlat7;
    u_xlat12 = u_xlat12 * u_xlat18;
    u_xlat12 = u_xlat12 * 3.14159274;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat6.y = sqrt(u_xlat12);
    u_xlat6.xy = u_xlat1.xx * u_xlat6.xy;
    u_xlat18 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlatb18 = u_xlat18!=0.0;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat12 = u_xlat18 * u_xlat6.y;
    u_xlat1.xyz = u_xlat6.xxx * u_xlat4.xyz;
    u_xlat6.xyz = u_xlat4.xyz * vec3(u_xlat12);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat19 = u_xlat0.x * u_xlat0.x;
    u_xlat19 = u_xlat19 * u_xlat19;
    u_xlat0.x = u_xlat0.x * u_xlat19;
    u_xlat4.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat4.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat6.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat3.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set CUBE Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _LightPositionRange at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 _LightPositionRange;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texturecube<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float u_xlat9;
    float3 u_xlat10;
    bool u_xlatb10;
    float u_xlat16;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat24;
    bool u_xlatb24;
    float u_xlat25;
    float u_xlat26;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat3.xyz = float3(u_xlat25) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat25);
    u_xlat25 = fma(u_xlat25, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat10.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat10.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat18 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat10.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0f, 1.0f);
    u_xlat7.xyz = input.TEXCOORD2.xyz + (-Globals._LightPositionRange.xyz);
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 * Globals._LightPositionRange.w;
    u_xlat18 = u_xlat18 * 0.970000029;
    u_xlat26 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat7.xyz, level(0.0)).x;
    u_xlatb18 = u_xlat26<u_xlat18;
    u_xlat18 = (u_xlatb18) ? Globals._LightShadowData.x : 1.0;
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat2.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat2.xx).x;
    u_xlat25 = u_xlat25 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat25) * Globals._LightColor0.xyz;
    u_xlat25 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat6.xyz = float3(u_xlat25) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat25 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat24), u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat0.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, float2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = fma(u_xlat8.x, u_xlat16, 1.0);
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = fma(u_xlat8.x, u_xlat1.x, 1.0);
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = fma(abs(u_xlat24), u_xlat1.x, u_xlat16);
    u_xlat1.x = fma(u_xlat26, u_xlat1.x, u_xlat16);
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = fma(u_xlat26, u_xlat9, u_xlat24);
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = fma(u_xlat3.x, u_xlat16, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = float2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * float3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat25;
    u_xlat25 = u_xlat25 * _LightShadowData.z + _LightShadowData.w;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat10.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat10.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat7.xyz = vs_TEXCOORD2.xyz + (-_LightPositionRange.xyz);
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 * _LightPositionRange.w;
    u_xlat18 = u_xlat18 * 0.970000029;
    u_xlat10_7 = textureLod(_ShadowMapTexture, u_xlat7.xyz, 0.0);
    u_xlatb18 = u_xlat10_7.x<u_xlat18;
    u_xlat18 = (u_xlatb18) ? _LightShadowData.x : 1.0;
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat25 = u_xlat25 * u_xlat10_2.w;
    u_xlat2.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat6.xyz = vec3(u_xlat25) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat25 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat24) + u_xlat3.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, vec2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = u_xlat8.x * u_xlat16 + 1.0;
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + 1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = abs(u_xlat24) * u_xlat1.x + u_xlat16;
    u_xlat1.x = u_xlat26 * u_xlat1.x + u_xlat16;
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = u_xlat26 * u_xlat9 + u_xlat24;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat3.x * u_xlat16 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = vec2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT SHADOWS_CUBE SHADOWS_SOFT 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 3
Set CUBE Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTexture0" to slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 3 sampler slot 0

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _LightPositionRange at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 _LightPositionRange;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_MainTex [[ sampler (3) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texturecube<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTexture0 [[ texture (2) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (3) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    bool4 u_xlatb7;
    float4 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat10;
    float u_xlat11;
    float3 u_xlat12;
    bool u_xlatb12;
    float u_xlat20;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat30;
    bool u_xlatb30;
    float u_xlat31;
    float u_xlat32;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = rsqrt(u_xlat30);
    u_xlat1.xyz = float3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = rsqrt(u_xlat31);
    u_xlat3.xyz = float3(u_xlat31) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat31) + u_xlat2.x;
    u_xlat31 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat31);
    u_xlat31 = fma(u_xlat31, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat31 = clamp(u_xlat31, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb12 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.xyz = (bool(u_xlatb12)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat12.xyz = u_xlat12.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat12.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat12.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat22 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat22, u_xlat12.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat12.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat12.x = clamp(u_xlat12.x, 0.0f, 1.0f);
    u_xlatb22 = u_xlat31<0.99000001;
    if(u_xlatb22){
        u_xlat7.xyz = input.TEXCOORD2.xyz + (-Globals._LightPositionRange.xyz);
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = sqrt(u_xlat22);
        u_xlat22 = u_xlat22 * Globals._LightPositionRange.w;
        u_xlat22 = u_xlat22 * 0.970000029;
        u_xlat8.xyz = u_xlat7.xyz + float3(0.0078125, 0.0078125, 0.0078125);
        u_xlat8.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat8.xyz, level(0.0)).x;
        u_xlat9.xyz = u_xlat7.xyz + float3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat8.y = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat9.xyz, level(0.0)).x;
        u_xlat9.xyz = u_xlat7.xyz + float3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat8.z = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat9.xyz, level(0.0)).x;
        u_xlat7.xyz = u_xlat7.xyz + float3(0.0078125, -0.0078125, -0.0078125);
        u_xlat8.w = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat7.xyz, level(0.0)).x;
        u_xlatb7 = (u_xlat8<float4(u_xlat22));
        u_xlat7.x = (u_xlatb7.x) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.y = (u_xlatb7.y) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.z = (u_xlatb7.z) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.w = (u_xlatb7.w) ? Globals._LightShadowData.x : float(1.0);
        u_xlat22 = dot(u_xlat7, float4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlat22 = 1.0;
    }
    u_xlat31 = u_xlat31 + u_xlat22;
    u_xlat31 = clamp(u_xlat31, 0.0f, 1.0f);
    u_xlat12.x = min(u_xlat31, u_xlat12.x);
    u_xlat31 = (u_xlatb2) ? u_xlat12.x : u_xlat31;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat2.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat2.xx).x;
    u_xlat31 = u_xlat31 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat31) * Globals._LightColor0.xyz;
    u_xlat31 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat31 = rsqrt(u_xlat31);
    u_xlat6.xyz = float3(u_xlat31) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat31 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat31) * u_xlat5.xyz;
    u_xlat31 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat30), u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = rsqrt(u_xlat30);
    u_xlat0.xyz = float3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat32 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat32 = clamp(u_xlat32, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = dot(u_xlat10.xx, float2(u_xlat31));
    u_xlat10.x = u_xlat10.x + -0.5;
    u_xlat20 = (-u_xlat32) + 1.0;
    u_xlat1.x = u_xlat20 * u_xlat20;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = u_xlat20 * u_xlat1.x;
    u_xlat20 = fma(u_xlat10.x, u_xlat20, 1.0);
    u_xlat1.x = -abs(u_xlat30) + 1.0;
    u_xlat11 = u_xlat1.x * u_xlat1.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat1.x = u_xlat1.x * u_xlat11;
    u_xlat10.x = fma(u_xlat10.x, u_xlat1.x, 1.0);
    u_xlat10.x = u_xlat10.x * u_xlat20;
    u_xlat20 = u_xlat31 * u_xlat31;
    u_xlat20 = max(u_xlat20, 0.00200000009);
    u_xlat1.x = (-u_xlat20) + 1.0;
    u_xlat11 = fma(abs(u_xlat30), u_xlat1.x, u_xlat20);
    u_xlat1.x = fma(u_xlat32, u_xlat1.x, u_xlat20);
    u_xlat30 = abs(u_xlat30) * u_xlat1.x;
    u_xlat30 = fma(u_xlat32, u_xlat11, u_xlat30);
    u_xlat30 = u_xlat30 + 9.99999975e-06;
    u_xlat30 = 0.5 / u_xlat30;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat1.x = fma(u_xlat3.x, u_xlat20, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat20 = u_xlat20 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat20 = u_xlat20 / u_xlat1.x;
    u_xlat20 = u_xlat20 * u_xlat30;
    u_xlat20 = u_xlat20 * 3.14159274;
    u_xlat20 = max(u_xlat20, 9.99999975e-05);
    u_xlat10.y = sqrt(u_xlat20);
    u_xlat10.xy = float2(u_xlat32) * u_xlat10.xy;
    u_xlat30 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb30 = u_xlat30!=0.0;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat20 = u_xlat30 * u_xlat10.y;
    u_xlat1.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.xyz * float3(u_xlat20);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat31 = u_xlat0.x * u_xlat0.x;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat7;
bvec4 u_xlatb7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat10_9;
vec4 u_xlat10_10;
vec3 u_xlat11;
float u_xlat12;
vec3 u_xlat13;
bool u_xlatb13;
vec3 u_xlat19;
float u_xlat22;
float u_xlat24;
bool u_xlatb24;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat35;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat34 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat34) + u_xlat2.x;
    u_xlat34 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat34;
    u_xlat34 = u_xlat34 * _LightShadowData.z + _LightShadowData.w;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat13.xyz = (bool(u_xlatb13)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat13.xyz = u_xlat13.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat13.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat24, u_xlat13.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat13.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlatb24 = u_xlat34<0.99000001;
    if(u_xlatb24){
        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-_LightPositionRange.xyz);
        u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat24 = sqrt(u_xlat24);
        u_xlat24 = u_xlat24 * _LightPositionRange.w;
        u_xlat24 = u_xlat24 * 0.970000029;
        u_xlat8.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
        u_xlat10_8 = textureLod(_ShadowMapTexture, u_xlat8.xyz, 0.0);
        u_xlat19.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat10_9 = textureLod(_ShadowMapTexture, u_xlat19.xyz, 0.0);
        u_xlat19.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat10_10 = textureLod(_ShadowMapTexture, u_xlat19.xyz, 0.0);
        u_xlat7.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
        u_xlat7 = textureLod(_ShadowMapTexture, u_xlat7.xyz, 0.0).yzwx;
        u_xlat7.x = u_xlat10_8.x;
        u_xlat7.y = u_xlat10_9.x;
        u_xlat7.z = u_xlat10_10.x;
        u_xlatb7 = lessThan(u_xlat7, vec4(u_xlat24));
        u_xlat7.x = (u_xlatb7.x) ? _LightShadowData.x : float(1.0);
        u_xlat7.y = (u_xlatb7.y) ? _LightShadowData.x : float(1.0);
        u_xlat7.z = (u_xlatb7.z) ? _LightShadowData.x : float(1.0);
        u_xlat7.w = (u_xlatb7.w) ? _LightShadowData.x : float(1.0);
        u_xlat24 = dot(u_xlat7, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlat24 = 1.0;
    //ENDIF
    }
    u_xlat34 = u_xlat34 + u_xlat24;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat13.x = min(u_xlat34, u_xlat13.x);
    u_xlat34 = (u_xlatb2) ? u_xlat13.x : u_xlat34;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_2 = texture(_LightTexture0, u_xlat2.xx);
    u_xlat34 = u_xlat34 * u_xlat10_2.w;
    u_xlat2.xyz = vec3(u_xlat34) * _LightColor0.xyz;
    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat6.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat34 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat34) * u_xlat5.xyz;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat35 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat11.xx, vec2(u_xlat34));
    u_xlat11.x = u_xlat11.x + -0.5;
    u_xlat22 = (-u_xlat35) + 1.0;
    u_xlat1.x = u_xlat22 * u_xlat22;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat22 = u_xlat22 * u_xlat1.x;
    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
    u_xlat1.x = -abs(u_xlat33) + 1.0;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat1.x * u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat1.x + 1.0;
    u_xlat11.x = u_xlat11.x * u_xlat22;
    u_xlat22 = u_xlat34 * u_xlat34;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat1.x = (-u_xlat22) + 1.0;
    u_xlat12 = abs(u_xlat33) * u_xlat1.x + u_xlat22;
    u_xlat1.x = u_xlat35 * u_xlat1.x + u_xlat22;
    u_xlat33 = abs(u_xlat33) * u_xlat1.x;
    u_xlat33 = u_xlat35 * u_xlat12 + u_xlat33;
    u_xlat33 = u_xlat33 + 9.99999975e-06;
    u_xlat33 = 0.5 / u_xlat33;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat1.x = u_xlat3.x * u_xlat22 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat1.x;
    u_xlat22 = u_xlat22 * u_xlat33;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat22 = max(u_xlat22, 9.99999975e-05);
    u_xlat11.y = sqrt(u_xlat22);
    u_xlat11.xy = vec2(u_xlat35) * u_xlat11.xy;
    u_xlat33 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb33 = u_xlat33!=0.0;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlat22 = u_xlat33 * u_xlat11.y;
    u_xlat1.xyz = u_xlat11.xxx * u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat34 = u_xlat0.x * u_xlat0.x;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat0.x = u_xlat0.x * u_xlat34;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat11.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 4
Set CUBE Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set CUBE Texture "_LightTexture0" to slot 3 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _LightPositionRange at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 _LightPositionRange;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    sampler sampler_MainTex [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texturecube<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (2) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture (3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    float3 u_xlat8;
    float u_xlat9;
    float3 u_xlat10;
    bool u_xlatb10;
    float u_xlat16;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat24;
    bool u_xlatb24;
    float u_xlat25;
    float u_xlat26;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat1.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat3.xyz = float3(u_xlat25) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat25);
    u_xlat25 = fma(u_xlat25, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat10.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat10.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat18 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat10.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0f, 1.0f);
    u_xlat7.xyz = input.TEXCOORD2.xyz + (-Globals._LightPositionRange.xyz);
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 * Globals._LightPositionRange.w;
    u_xlat18 = u_xlat18 * 0.970000029;
    u_xlat26 = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat7.xyz, level(0.0)).x;
    u_xlatb18 = u_xlat26<u_xlat18;
    u_xlat18 = (u_xlatb18) ? Globals._LightShadowData.x : 1.0;
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0f, 1.0f);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat2.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat2.xx).x;
    u_xlat10.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat6.xyz).w;
    u_xlat2.x = u_xlat10.x * u_xlat2.x;
    u_xlat25 = u_xlat25 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat25) * Globals._LightColor0.xyz;
    u_xlat25 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat25 = rsqrt(u_xlat25);
    u_xlat6.xyz = float3(u_xlat25) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat25 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat24), u_xlat3.xyz);
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = rsqrt(u_xlat24);
    u_xlat0.xyz = float3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, float2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = fma(u_xlat8.x, u_xlat16, 1.0);
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = fma(u_xlat8.x, u_xlat1.x, 1.0);
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = fma(abs(u_xlat24), u_xlat1.x, u_xlat16);
    u_xlat1.x = fma(u_xlat26, u_xlat1.x, u_xlat16);
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = fma(u_xlat26, u_xlat9, u_xlat24);
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = fma(u_xlat3.x, u_xlat16, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = float2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * float3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec4 u_xlat7;
vec4 u_xlat10_7;
vec3 u_xlat8;
float u_xlat9;
vec3 u_xlat10;
bool u_xlatb10;
float u_xlat16;
float u_xlat18;
bool u_xlatb18;
float u_xlat24;
bool u_xlatb24;
float u_xlat25;
float u_xlat26;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat1.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat3.xyz = vec3(u_xlat25) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat25 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat25) + u_xlat2.x;
    u_xlat25 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat25;
    u_xlat25 = u_xlat25 * _LightShadowData.z + _LightShadowData.w;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb10 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat10.xyz = (bool(u_xlatb10)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat10.xyz = u_xlat10.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat10.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat10.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat18 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat18, u_xlat10.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat10.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
    u_xlat7.xyz = vs_TEXCOORD2.xyz + (-_LightPositionRange.xyz);
    u_xlat18 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18 = sqrt(u_xlat18);
    u_xlat18 = u_xlat18 * _LightPositionRange.w;
    u_xlat18 = u_xlat18 * 0.970000029;
    u_xlat10_7 = textureLod(_ShadowMapTexture, u_xlat7.xyz, 0.0);
    u_xlatb18 = u_xlat10_7.x<u_xlat18;
    u_xlat18 = (u_xlatb18) ? _LightShadowData.x : 1.0;
    u_xlat25 = u_xlat25 + u_xlat18;
    u_xlat25 = clamp(u_xlat25, 0.0, 1.0);
    u_xlat10.x = min(u_xlat25, u_xlat10.x);
    u_xlat25 = (u_xlatb2) ? u_xlat10.x : u_xlat25;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_6.w;
    u_xlat25 = u_xlat25 * u_xlat16_2;
    u_xlat2.xyz = vec3(u_xlat25) * _LightColor0.xyz;
    u_xlat25 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat25 = inversesqrt(u_xlat25);
    u_xlat6.xyz = vec3(u_xlat25) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat25 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat25) * u_xlat5.xyz;
    u_xlat25 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat24) + u_xlat3.xyz;
    u_xlat24 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat24 = max(u_xlat24, 0.00100000005);
    u_xlat24 = inversesqrt(u_xlat24);
    u_xlat0.xyz = vec3(u_xlat24) * u_xlat0.xyz;
    u_xlat24 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat26 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat26 = clamp(u_xlat26, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat8.x = u_xlat0.x * u_xlat0.x;
    u_xlat8.x = dot(u_xlat8.xx, vec2(u_xlat25));
    u_xlat8.x = u_xlat8.x + -0.5;
    u_xlat16 = (-u_xlat26) + 1.0;
    u_xlat1.x = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat1.x;
    u_xlat16 = u_xlat8.x * u_xlat16 + 1.0;
    u_xlat1.x = -abs(u_xlat24) + 1.0;
    u_xlat9 = u_xlat1.x * u_xlat1.x;
    u_xlat9 = u_xlat9 * u_xlat9;
    u_xlat1.x = u_xlat1.x * u_xlat9;
    u_xlat8.x = u_xlat8.x * u_xlat1.x + 1.0;
    u_xlat8.x = u_xlat8.x * u_xlat16;
    u_xlat16 = u_xlat25 * u_xlat25;
    u_xlat16 = max(u_xlat16, 0.00200000009);
    u_xlat1.x = (-u_xlat16) + 1.0;
    u_xlat9 = abs(u_xlat24) * u_xlat1.x + u_xlat16;
    u_xlat1.x = u_xlat26 * u_xlat1.x + u_xlat16;
    u_xlat24 = abs(u_xlat24) * u_xlat1.x;
    u_xlat24 = u_xlat26 * u_xlat9 + u_xlat24;
    u_xlat24 = u_xlat24 + 9.99999975e-06;
    u_xlat24 = 0.5 / u_xlat24;
    u_xlat16 = u_xlat16 * u_xlat16;
    u_xlat1.x = u_xlat3.x * u_xlat16 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat16 = u_xlat16 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat16 = u_xlat16 / u_xlat1.x;
    u_xlat16 = u_xlat16 * u_xlat24;
    u_xlat16 = u_xlat16 * 3.14159274;
    u_xlat16 = max(u_xlat16, 9.99999975e-05);
    u_xlat8.y = sqrt(u_xlat16);
    u_xlat8.xy = vec2(u_xlat26) * u_xlat8.xy;
    u_xlat24 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb24 = u_xlat24!=0.0;
    u_xlat24 = u_xlatb24 ? 1.0 : float(0.0);
    u_xlat16 = u_xlat24 * u_xlat8.y;
    u_xlat1.xyz = u_xlat8.xxx * u_xlat2.xyz;
    u_xlat8.xyz = u_xlat2.xyz * vec3(u_xlat16);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat25 = u_xlat0.x * u_xlat0.x;
    u_xlat25 = u_xlat25 * u_xlat25;
    u_xlat0.x = u_xlat0.x * u_xlat25;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat8.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: POINT_COOKIE SHADOWS_CUBE SHADOWS_SOFT 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (208 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_WorldToObject at 64
  Matrix4x4 unity_MatrixVP at 128
  Vector4 _MainTex_ST at 192
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float2 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    output.TEXCOORD3.xy = float2(0.0, 0.0);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    output.TEXCOORD1.xyz = float3(u_xlat6) * u_xlat0.xyz;
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 4
Set CUBE Texture "_ShadowMapTexture" to slot 1
Set 2D Texture "_LightTextureB0" to slot 2 sampler slot 3
Set CUBE Texture "_LightTexture0" to slot 3 sampler slot 2
Set 3D Texture "unity_ProbeVolumeSH" to slot 4 sampler slot 0

Constant Buffer "Globals" (384 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 96
  Matrix4x4 unity_ProbeVolumeWorldToObject at 176
  Matrix4x4 unity_WorldToLight at 288
  Vector3 _WorldSpaceCameraPos at 0
  Vector4 _WorldSpaceLightPos0 at 16
  Vector4 _LightPositionRange at 32
  Vector4 unity_OcclusionMaskSelector at 48
  Vector4 _LightShadowData at 64
  Vector4 unity_ShadowFadeCenterAndType at 80
  Vector4 unity_ProbeVolumeParams at 160
  Vector3 unity_ProbeVolumeSizeInv at 240
  Vector3 unity_ProbeVolumeMin at 256
  Vector4 _LightColor0 at 272
  Float _Glossiness at 352
  Float _Metallic at 356
  Vector4 _Color at 368
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float3 _WorldSpaceCameraPos;
    float4 _WorldSpaceLightPos0;
    float4 _LightPositionRange;
    float4 unity_OcclusionMaskSelector;
    float4 _LightShadowData;
    float4 unity_ShadowFadeCenterAndType;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float4 _LightColor0;
    float4 hlslcc_mtx4x4unity_WorldToLight[4];
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_ShadowMapTexture [[ sampler (1) ]],
    sampler sampler_LightTexture0 [[ sampler (2) ]],
    sampler sampler_LightTextureB0 [[ sampler (3) ]],
    sampler sampler_MainTex [[ sampler (4) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texturecube<float, access::sample > _ShadowMapTexture [[ texture (1) ]] ,
    texture2d<float, access::sample > _LightTextureB0 [[ texture (2) ]] ,
    texturecube<float, access::sample > _LightTexture0 [[ texture (3) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (4) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float3 u_xlat2;
    bool u_xlatb2;
    float3 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float4 u_xlat7;
    bool4 u_xlatb7;
    float4 u_xlat8;
    float3 u_xlat9;
    float3 u_xlat10;
    float u_xlat11;
    float3 u_xlat12;
    bool u_xlatb12;
    float u_xlat20;
    float u_xlat22;
    bool u_xlatb22;
    float u_xlat30;
    bool u_xlatb30;
    float u_xlat31;
    float u_xlat32;
    u_xlat0.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceLightPos0.xyz;
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = rsqrt(u_xlat30);
    u_xlat1.xyz = float3(u_xlat30) * u_xlat0.xyz;
    u_xlat2.xyz = (-input.TEXCOORD2.xyz) + Globals._WorldSpaceCameraPos.xyzx.xyz;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat31 = rsqrt(u_xlat31);
    u_xlat3.xyz = float3(u_xlat31) * u_xlat2.xyz;
    u_xlat4.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat5.xyz = u_xlat4.xyz * Globals._Color.xyz;
    u_xlat6.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[0].xyz, input.TEXCOORD2.xxx, u_xlat6.xyz);
    u_xlat6.xyz = fma(Globals.hlslcc_mtx4x4unity_WorldToLight[2].xyz, input.TEXCOORD2.zzz, u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xyz + Globals.hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = Globals.hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = Globals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = Globals.hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat31 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = input.TEXCOORD2.xyz + (-Globals.unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat31) + u_xlat2.x;
    u_xlat31 = fma(Globals.unity_ShadowFadeCenterAndType.w, u_xlat2.x, u_xlat31);
    u_xlat31 = fma(u_xlat31, Globals._LightShadowData.z, Globals._LightShadowData.w);
    u_xlat31 = clamp(u_xlat31, 0.0f, 1.0f);
    u_xlatb2 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb12 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat7.xyz);
        u_xlat7.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat7.xyz);
        u_xlat7.xyz = u_xlat7.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat12.xyz = (bool(u_xlatb12)) ? u_xlat7.xyz : input.TEXCOORD2.xyz;
        u_xlat12.xyz = u_xlat12.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat7.yzw = u_xlat12.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat12.x = fma(u_xlat7.y, 0.25, 0.75);
        u_xlat22 = fma(Globals.unity_ProbeVolumeParams.z, 0.5, 0.75);
        u_xlat7.x = max(u_xlat22, u_xlat12.x);
        u_xlat7 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    }
    u_xlat12.x = dot(u_xlat7, Globals.unity_OcclusionMaskSelector);
    u_xlat12.x = clamp(u_xlat12.x, 0.0f, 1.0f);
    u_xlatb22 = u_xlat31<0.99000001;
    if(u_xlatb22){
        u_xlat7.xyz = input.TEXCOORD2.xyz + (-Globals._LightPositionRange.xyz);
        u_xlat22 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat22 = sqrt(u_xlat22);
        u_xlat22 = u_xlat22 * Globals._LightPositionRange.w;
        u_xlat22 = u_xlat22 * 0.970000029;
        u_xlat8.xyz = u_xlat7.xyz + float3(0.0078125, 0.0078125, 0.0078125);
        u_xlat8.x = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat8.xyz, level(0.0)).x;
        u_xlat9.xyz = u_xlat7.xyz + float3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat8.y = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat9.xyz, level(0.0)).x;
        u_xlat9.xyz = u_xlat7.xyz + float3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat8.z = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat9.xyz, level(0.0)).x;
        u_xlat7.xyz = u_xlat7.xyz + float3(0.0078125, -0.0078125, -0.0078125);
        u_xlat8.w = _ShadowMapTexture.sample(sampler_ShadowMapTexture, u_xlat7.xyz, level(0.0)).x;
        u_xlatb7 = (u_xlat8<float4(u_xlat22));
        u_xlat7.x = (u_xlatb7.x) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.y = (u_xlatb7.y) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.z = (u_xlatb7.z) ? Globals._LightShadowData.x : float(1.0);
        u_xlat7.w = (u_xlatb7.w) ? Globals._LightShadowData.x : float(1.0);
        u_xlat22 = dot(u_xlat7, float4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlat22 = 1.0;
    }
    u_xlat31 = u_xlat31 + u_xlat22;
    u_xlat31 = clamp(u_xlat31, 0.0f, 1.0f);
    u_xlat12.x = min(u_xlat31, u_xlat12.x);
    u_xlat31 = (u_xlatb2) ? u_xlat12.x : u_xlat31;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat2.x = _LightTextureB0.sample(sampler_LightTextureB0, u_xlat2.xx).x;
    u_xlat12.x = _LightTexture0.sample(sampler_LightTexture0, u_xlat6.xyz).w;
    u_xlat2.x = u_xlat12.x * u_xlat2.x;
    u_xlat31 = u_xlat31 * u_xlat2.x;
    u_xlat2.xyz = float3(u_xlat31) * Globals._LightColor0.xyz;
    u_xlat31 = dot(input.TEXCOORD1.xyz, input.TEXCOORD1.xyz);
    u_xlat31 = rsqrt(u_xlat31);
    u_xlat6.xyz = float3(u_xlat31) * input.TEXCOORD1.xyz;
    u_xlat4.xyz = fma(u_xlat4.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    u_xlat4.xyz = fma(float3(Globals._Metallic), u_xlat4.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat31 = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat5.xyz = float3(u_xlat31) * u_xlat5.xyz;
    u_xlat31 = (-Globals._Glossiness) + 1.0;
    u_xlat0.xyz = fma(u_xlat0.xyz, float3(u_xlat30), u_xlat3.xyz);
    u_xlat30 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat30 = max(u_xlat30, 0.00100000005);
    u_xlat30 = rsqrt(u_xlat30);
    u_xlat0.xyz = float3(u_xlat30) * u_xlat0.xyz;
    u_xlat30 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat32 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat32 = clamp(u_xlat32, 0.0f, 1.0f);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0f, 1.0f);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0f, 1.0f);
    u_xlat10.x = u_xlat0.x * u_xlat0.x;
    u_xlat10.x = dot(u_xlat10.xx, float2(u_xlat31));
    u_xlat10.x = u_xlat10.x + -0.5;
    u_xlat20 = (-u_xlat32) + 1.0;
    u_xlat1.x = u_xlat20 * u_xlat20;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat20 = u_xlat20 * u_xlat1.x;
    u_xlat20 = fma(u_xlat10.x, u_xlat20, 1.0);
    u_xlat1.x = -abs(u_xlat30) + 1.0;
    u_xlat11 = u_xlat1.x * u_xlat1.x;
    u_xlat11 = u_xlat11 * u_xlat11;
    u_xlat1.x = u_xlat1.x * u_xlat11;
    u_xlat10.x = fma(u_xlat10.x, u_xlat1.x, 1.0);
    u_xlat10.x = u_xlat10.x * u_xlat20;
    u_xlat20 = u_xlat31 * u_xlat31;
    u_xlat20 = max(u_xlat20, 0.00200000009);
    u_xlat1.x = (-u_xlat20) + 1.0;
    u_xlat11 = fma(abs(u_xlat30), u_xlat1.x, u_xlat20);
    u_xlat1.x = fma(u_xlat32, u_xlat1.x, u_xlat20);
    u_xlat30 = abs(u_xlat30) * u_xlat1.x;
    u_xlat30 = fma(u_xlat32, u_xlat11, u_xlat30);
    u_xlat30 = u_xlat30 + 9.99999975e-06;
    u_xlat30 = 0.5 / u_xlat30;
    u_xlat20 = u_xlat20 * u_xlat20;
    u_xlat1.x = fma(u_xlat3.x, u_xlat20, (-u_xlat3.x));
    u_xlat1.x = fma(u_xlat1.x, u_xlat3.x, 1.0);
    u_xlat20 = u_xlat20 * 0.318309873;
    u_xlat1.x = fma(u_xlat1.x, u_xlat1.x, 1.00000001e-07);
    u_xlat20 = u_xlat20 / u_xlat1.x;
    u_xlat20 = u_xlat20 * u_xlat30;
    u_xlat20 = u_xlat20 * 3.14159274;
    u_xlat20 = max(u_xlat20, 9.99999975e-05);
    u_xlat10.y = sqrt(u_xlat20);
    u_xlat10.xy = float2(u_xlat32) * u_xlat10.xy;
    u_xlat30 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb30 = u_xlat30!=0.0;
    u_xlat30 = u_xlatb30 ? 1.0 : float(0.0);
    u_xlat20 = u_xlat30 * u_xlat10.y;
    u_xlat1.xyz = u_xlat10.xxx * u_xlat2.xyz;
    u_xlat10.xyz = u_xlat2.xyz * float3(u_xlat20);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat31 = u_xlat0.x * u_xlat0.x;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat0.x = u_xlat0.x * u_xlat31;
    u_xlat2.xyz = (-u_xlat4.xyz) + float3(1.0, 1.0, 1.0);
    u_xlat2.xyz = fma(u_xlat2.xyz, u_xlat0.xxx, u_xlat4.xyz);
    u_xlat0.xyz = u_xlat10.xyz * u_xlat2.xyz;
    output.SV_Target0.xyz = fma(u_xlat5.xyz, u_xlat1.xyz, u_xlat0.xyz);
    output.SV_Target0.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec2 vs_TEXCOORD3;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD3.xy = vec2(0.0, 0.0);
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    vs_TEXCOORD1.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 _WorldSpaceLightPos0;
uniform 	vec4 _LightPositionRange;
uniform 	vec4 unity_OcclusionMaskSelector;
uniform 	vec4 _LightShadowData;
uniform 	vec4 unity_ShadowFadeCenterAndType;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	vec4 _LightColor0;
uniform 	vec4 hlslcc_mtx4x4unity_WorldToLight[4];
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  samplerCube _ShadowMapTexture;
uniform  sampler2D _LightTextureB0;
uniform  samplerCube _LightTexture0;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
layout(location = 0) out vec4 SV_Target0;
vec3 u_xlat0;
vec3 u_xlat1;
vec3 u_xlat2;
float u_xlat16_2;
vec4 u_xlat10_2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec3 u_xlat5;
vec3 u_xlat6;
vec4 u_xlat10_6;
vec4 u_xlat7;
bvec4 u_xlatb7;
vec3 u_xlat8;
vec4 u_xlat10_8;
vec4 u_xlat10_9;
vec4 u_xlat10_10;
vec3 u_xlat11;
float u_xlat12;
vec3 u_xlat13;
bool u_xlatb13;
vec3 u_xlat19;
float u_xlat22;
float u_xlat24;
bool u_xlatb24;
float u_xlat33;
bool u_xlatb33;
float u_xlat34;
float u_xlat35;
void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceLightPos0.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD2.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat34 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat3.xyz = vec3(u_xlat34) * u_xlat2.xyz;
    u_xlat10_4 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat5.xyz = u_xlat10_4.xyz * _Color.xyz;
    u_xlat6.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_WorldToLight[1].xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[0].xyz * vs_TEXCOORD2.xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToLight[2].xyz * vs_TEXCOORD2.zzz + u_xlat6.xyz;
    u_xlat6.xyz = u_xlat6.xyz + hlslcc_mtx4x4unity_WorldToLight[3].xyz;
    u_xlat7.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat7.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat7.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    u_xlat34 = dot(u_xlat2.xyz, u_xlat7.xyz);
    u_xlat2.xyz = vs_TEXCOORD2.xyz + (-unity_ShadowFadeCenterAndType.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = (-u_xlat34) + u_xlat2.x;
    u_xlat34 = unity_ShadowFadeCenterAndType.w * u_xlat2.x + u_xlat34;
    u_xlat34 = u_xlat34 * _LightShadowData.z + _LightShadowData.w;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlatb2 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb2){
        u_xlatb13 = unity_ProbeVolumeParams.y==1.0;
        u_xlat7.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat7.xyz;
        u_xlat7.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat7.xyz;
        u_xlat7.xyz = u_xlat7.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat13.xyz = (bool(u_xlatb13)) ? u_xlat7.xyz : vs_TEXCOORD2.xyz;
        u_xlat13.xyz = u_xlat13.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat7.yzw = u_xlat13.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat13.x = u_xlat7.y * 0.25 + 0.75;
        u_xlat24 = unity_ProbeVolumeParams.z * 0.5 + 0.75;
        u_xlat7.x = max(u_xlat24, u_xlat13.x);
        u_xlat7 = texture(unity_ProbeVolumeSH, u_xlat7.xzw);
    } else {
        u_xlat7.x = float(1.0);
        u_xlat7.y = float(1.0);
        u_xlat7.z = float(1.0);
        u_xlat7.w = float(1.0);
    //ENDIF
    }
    u_xlat13.x = dot(u_xlat7, unity_OcclusionMaskSelector);
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
    u_xlatb24 = u_xlat34<0.99000001;
    if(u_xlatb24){
        u_xlat7.xyz = vs_TEXCOORD2.xyz + (-_LightPositionRange.xyz);
        u_xlat24 = dot(u_xlat7.xyz, u_xlat7.xyz);
        u_xlat24 = sqrt(u_xlat24);
        u_xlat24 = u_xlat24 * _LightPositionRange.w;
        u_xlat24 = u_xlat24 * 0.970000029;
        u_xlat8.xyz = u_xlat7.xyz + vec3(0.0078125, 0.0078125, 0.0078125);
        u_xlat10_8 = textureLod(_ShadowMapTexture, u_xlat8.xyz, 0.0);
        u_xlat19.xyz = u_xlat7.xyz + vec3(-0.0078125, -0.0078125, 0.0078125);
        u_xlat10_9 = textureLod(_ShadowMapTexture, u_xlat19.xyz, 0.0);
        u_xlat19.xyz = u_xlat7.xyz + vec3(-0.0078125, 0.0078125, -0.0078125);
        u_xlat10_10 = textureLod(_ShadowMapTexture, u_xlat19.xyz, 0.0);
        u_xlat7.xyz = u_xlat7.xyz + vec3(0.0078125, -0.0078125, -0.0078125);
        u_xlat7 = textureLod(_ShadowMapTexture, u_xlat7.xyz, 0.0).yzwx;
        u_xlat7.x = u_xlat10_8.x;
        u_xlat7.y = u_xlat10_9.x;
        u_xlat7.z = u_xlat10_10.x;
        u_xlatb7 = lessThan(u_xlat7, vec4(u_xlat24));
        u_xlat7.x = (u_xlatb7.x) ? _LightShadowData.x : float(1.0);
        u_xlat7.y = (u_xlatb7.y) ? _LightShadowData.x : float(1.0);
        u_xlat7.z = (u_xlatb7.z) ? _LightShadowData.x : float(1.0);
        u_xlat7.w = (u_xlatb7.w) ? _LightShadowData.x : float(1.0);
        u_xlat24 = dot(u_xlat7, vec4(0.25, 0.25, 0.25, 0.25));
    } else {
        u_xlat24 = 1.0;
    //ENDIF
    }
    u_xlat34 = u_xlat34 + u_xlat24;
    u_xlat34 = clamp(u_xlat34, 0.0, 1.0);
    u_xlat13.x = min(u_xlat34, u_xlat13.x);
    u_xlat34 = (u_xlatb2) ? u_xlat13.x : u_xlat34;
    u_xlat2.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat10_2 = texture(_LightTextureB0, u_xlat2.xx);
    u_xlat10_6 = texture(_LightTexture0, u_xlat6.xyz);
    u_xlat16_2 = u_xlat10_2.w * u_xlat10_6.w;
    u_xlat34 = u_xlat34 * u_xlat16_2;
    u_xlat2.xyz = vec3(u_xlat34) * _LightColor0.xyz;
    u_xlat34 = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat34 = inversesqrt(u_xlat34);
    u_xlat6.xyz = vec3(u_xlat34) * vs_TEXCOORD1.xyz;
    u_xlat4.xyz = u_xlat10_4.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    u_xlat4.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat4.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat34 = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat5.xyz = vec3(u_xlat34) * u_xlat5.xyz;
    u_xlat34 = (-_Glossiness) + 1.0;
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat33) + u_xlat3.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = max(u_xlat33, 0.00100000005);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat0.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat33 = dot(u_xlat6.xyz, u_xlat3.xyz);
    u_xlat35 = dot(u_xlat6.xyz, u_xlat1.xyz);
    u_xlat35 = clamp(u_xlat35, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat6.xyz, u_xlat0.xyz);
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat0.xyz);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat11.x = u_xlat0.x * u_xlat0.x;
    u_xlat11.x = dot(u_xlat11.xx, vec2(u_xlat34));
    u_xlat11.x = u_xlat11.x + -0.5;
    u_xlat22 = (-u_xlat35) + 1.0;
    u_xlat1.x = u_xlat22 * u_xlat22;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat22 = u_xlat22 * u_xlat1.x;
    u_xlat22 = u_xlat11.x * u_xlat22 + 1.0;
    u_xlat1.x = -abs(u_xlat33) + 1.0;
    u_xlat12 = u_xlat1.x * u_xlat1.x;
    u_xlat12 = u_xlat12 * u_xlat12;
    u_xlat1.x = u_xlat1.x * u_xlat12;
    u_xlat11.x = u_xlat11.x * u_xlat1.x + 1.0;
    u_xlat11.x = u_xlat11.x * u_xlat22;
    u_xlat22 = u_xlat34 * u_xlat34;
    u_xlat22 = max(u_xlat22, 0.00200000009);
    u_xlat1.x = (-u_xlat22) + 1.0;
    u_xlat12 = abs(u_xlat33) * u_xlat1.x + u_xlat22;
    u_xlat1.x = u_xlat35 * u_xlat1.x + u_xlat22;
    u_xlat33 = abs(u_xlat33) * u_xlat1.x;
    u_xlat33 = u_xlat35 * u_xlat12 + u_xlat33;
    u_xlat33 = u_xlat33 + 9.99999975e-06;
    u_xlat33 = 0.5 / u_xlat33;
    u_xlat22 = u_xlat22 * u_xlat22;
    u_xlat1.x = u_xlat3.x * u_xlat22 + (-u_xlat3.x);
    u_xlat1.x = u_xlat1.x * u_xlat3.x + 1.0;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat1.x = u_xlat1.x * u_xlat1.x + 1.00000001e-07;
    u_xlat22 = u_xlat22 / u_xlat1.x;
    u_xlat22 = u_xlat22 * u_xlat33;
    u_xlat22 = u_xlat22 * 3.14159274;
    u_xlat22 = max(u_xlat22, 9.99999975e-05);
    u_xlat11.y = sqrt(u_xlat22);
    u_xlat11.xy = vec2(u_xlat35) * u_xlat11.xy;
    u_xlat33 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlatb33 = u_xlat33!=0.0;
    u_xlat33 = u_xlatb33 ? 1.0 : float(0.0);
    u_xlat22 = u_xlat33 * u_xlat11.y;
    u_xlat1.xyz = u_xlat11.xxx * u_xlat2.xyz;
    u_xlat11.xyz = u_xlat2.xyz * vec3(u_xlat22);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat34 = u_xlat0.x * u_xlat0.x;
    u_xlat34 = u_xlat34 * u_xlat34;
    u_xlat0.x = u_xlat0.x * u_xlat34;
    u_xlat2.xyz = (-u_xlat4.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = u_xlat11.xyz * u_xlat2.xyz;
    SV_Target0.xyz = u_xlat5.xyz * u_xlat1.xyz + u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
 Pass {
  Name "DEFERRED"
  Tags { "LIGHTMODE"="DEFERRED" "RenderType"="Opaque" }
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
No keywords set in this variant.
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 64
  Matrix4x4 unity_WorldToObject at 128
  Matrix4x4 unity_MatrixVP at 192
  Vector4 unity_SHBr at 0
  Vector4 unity_SHBg at 16
  Vector4 unity_SHBb at 32
  Vector4 unity_SHC at 48
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD1.xyz = u_xlat0.xyz;
    output.TEXCOORD4 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(Globals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(Globals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(Globals.unity_SHBb, u_xlat1);
    output.TEXCOORD5.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "Globals" (192 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Float _Glossiness at 160
  Float _Metallic at 164
  Vector4 _Color at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
    float4 SV_Target1 [[ color(xlt_remap_o[1]) ]];
    float4 SV_Target2 [[ color(xlt_remap_o[2]) ]];
    float4 SV_Target3 [[ color(xlt_remap_o[3]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat8;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * Globals._Color.xyz;
    u_xlatb18 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat2.xyz);
        u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : input.TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat18 = u_xlat2.y * 0.25;
        u_xlat19 = Globals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8 = fma((-Globals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat18 = max(u_xlat18, u_xlat19);
        u_xlat2.x = min(u_xlat8, u_xlat18);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat5.xyz = input.TEXCOORD1.xyz;
        u_xlat5.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat5);
        u_xlat3.y = dot(u_xlat4, u_xlat5);
        u_xlat3.z = dot(u_xlat2, u_xlat5);
    } else {
        u_xlat2.xyz = input.TEXCOORD1.xyz;
        u_xlat2.w = 1.0;
        u_xlat3.x = dot(Globals.unity_SHAr, u_xlat2);
        u_xlat3.y = dot(Globals.unity_SHAg, u_xlat2);
        u_xlat3.z = dot(Globals.unity_SHAb, u_xlat2);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = fma(u_xlat2.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = fma(u_xlat0.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    output.SV_Target1.xyz = fma(float3(Globals._Metallic), u_xlat0.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat0.x = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    output.SV_Target3.xyz = exp2((-u_xlat1.xyz));
    output.SV_Target0.xyz = u_xlat0.xyz;
    output.SV_Target0.w = 1.0;
    output.SV_Target1.w = Globals._Glossiness;
    output.SV_Target2.xyz = fma(input.TEXCOORD1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat8;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25;
        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat18 = max(u_xlat18, u_xlat19);
        u_xlat2.x = min(u_xlat8, u_xlat18);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat5.xyz = vs_TEXCOORD1.xyz;
        u_xlat5.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat5);
        u_xlat3.y = dot(u_xlat10_4, u_xlat5);
        u_xlat3.z = dot(u_xlat10_2, u_xlat5);
    } else {
        u_xlat2.xyz = vs_TEXCOORD1.xyz;
        u_xlat2.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat2);
        u_xlat3.y = dot(unity_SHAg, u_xlat2);
        u_xlat3.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat2.xyz * u_xlat0.xyz;
    SV_Target3.xyz = exp2((-u_xlat1.xyz));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.w = _Glossiness;
    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

//////////////////////////////////////////////////////
Keywords set in this variant: UNITY_HDR_ON 
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord"

Constant Buffer "Globals" (272 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 64
  Matrix4x4 unity_WorldToObject at 128
  Matrix4x4 unity_MatrixVP at 192
  Vector4 unity_SHBr at 0
  Vector4 unity_SHBg at 16
  Vector4 unity_SHBb at 32
  Vector4 unity_SHC at 48
  Vector4 _MainTex_ST at 256
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

struct Globals_Type
{
    float4 unity_SHBr;
    float4 unity_SHBg;
    float4 unity_SHBb;
    float4 unity_SHC;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position ]];
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]];
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]];
    float4 TEXCOORD4 [[ user(TEXCOORD4) ]];
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat6;
    u_xlat0 = input.POSITION0.yyyy * Globals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat1 = u_xlat0 + Globals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    output.TEXCOORD2.xyz = fma(Globals.hlslcc_mtx4x4unity_ObjectToWorld[3].xyz, input.POSITION0.www, u_xlat0.xyz);
    u_xlat0 = u_xlat1.yyyy * Globals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat1.xxxx, u_xlat0);
    u_xlat0 = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat1.zzzz, u_xlat0);
    output.mtl_Position = fma(Globals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    output.TEXCOORD0.xy = fma(input.TEXCOORD0.xy, Globals._MainTex_ST.xy, Globals._MainTex_ST.zw);
    u_xlat0.x = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, Globals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = rsqrt(u_xlat6);
    u_xlat0.xyz = float3(u_xlat6) * u_xlat0.xyz;
    output.TEXCOORD1.xyz = u_xlat0.xyz;
    output.TEXCOORD4 = float4(0.0, 0.0, 0.0, 0.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = fma(u_xlat0.x, u_xlat0.x, (-u_xlat6));
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(Globals.unity_SHBr, u_xlat1);
    u_xlat0.y = dot(Globals.unity_SHBg, u_xlat1);
    u_xlat0.z = dot(Globals.unity_SHBb, u_xlat1);
    output.TEXCOORD5.xyz = fma(Globals.unity_SHC.xyz, float3(u_xlat6), u_xlat0.xyz);
    return output;
}


-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0 sampler slot 1
Set 3D Texture "unity_ProbeVolumeSH" to slot 1 sampler slot 0

Constant Buffer "Globals" (192 bytes) on slot 0 {
  Matrix4x4 unity_ProbeVolumeWorldToObject at 64
  Vector4 unity_SHAr at 0
  Vector4 unity_SHAg at 16
  Vector4 unity_SHAb at 32
  Vector4 unity_ProbeVolumeParams at 48
  Vector3 unity_ProbeVolumeSizeInv at 128
  Vector3 unity_ProbeVolumeMin at 144
  Float _Glossiness at 160
  Float _Metallic at 164
  Vector4 _Color at 176
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;

#if !(__HAVE_FMA__)
#define fma(a,b,c) ((a) * (b) + (c))
#endif

#ifndef XLT_REMAP_O
#define XLT_REMAP_O {0, 1, 2, 3, 4, 5, 6, 7}
#endif
constexpr constant uint xlt_remap_o[] = XLT_REMAP_O;
struct Globals_Type
{
    float4 unity_SHAr;
    float4 unity_SHAg;
    float4 unity_SHAb;
    float4 unity_ProbeVolumeParams;
    float4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
    float3 unity_ProbeVolumeSizeInv;
    float3 unity_ProbeVolumeMin;
    float _Glossiness;
    float _Metallic;
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD0 [[ user(TEXCOORD0) ]] ;
    float3 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float3 TEXCOORD2 [[ user(TEXCOORD2) ]] ;
    float3 TEXCOORD5 [[ user(TEXCOORD5) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(xlt_remap_o[0]) ]];
    float4 SV_Target1 [[ color(xlt_remap_o[1]) ]];
    float4 SV_Target2 [[ color(xlt_remap_o[2]) ]];
    float4 SV_Target3 [[ color(xlt_remap_o[3]) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant Globals_Type& Globals [[ buffer(0) ]],
    sampler samplerunity_ProbeVolumeSH [[ sampler (0) ]],
    sampler sampler_MainTex [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture (0) ]] ,
    texture3d<float, access::sample > unity_ProbeVolumeSH [[ texture (1) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    float3 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat8;
    float u_xlat18;
    bool u_xlatb18;
    float u_xlat19;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD0.xy).xyz;
    u_xlat1.xyz = u_xlat0.xyz * Globals._Color.xyz;
    u_xlatb18 = Globals.unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = Globals.unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = input.TEXCOORD2.yyy * Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz, input.TEXCOORD2.xxx, u_xlat2.xyz);
        u_xlat2.xyz = fma(Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz, input.TEXCOORD2.zzz, u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz + Globals.hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : input.TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-Globals.unity_ProbeVolumeMin.xyzx.xyz);
        u_xlat2.yzw = u_xlat2.xyz * Globals.unity_ProbeVolumeSizeInv.xyzx.xyz;
        u_xlat18 = u_xlat2.y * 0.25;
        u_xlat19 = Globals.unity_ProbeVolumeParams.z * 0.5;
        u_xlat8 = fma((-Globals.unity_ProbeVolumeParams.z), 0.5, 0.25);
        u_xlat18 = max(u_xlat18, u_xlat19);
        u_xlat2.x = min(u_xlat8, u_xlat18);
        u_xlat3 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + float3(0.25, 0.0, 0.0);
        u_xlat4 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + float3(0.5, 0.0, 0.0);
        u_xlat2 = unity_ProbeVolumeSH.sample(samplerunity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat5.xyz = input.TEXCOORD1.xyz;
        u_xlat5.w = 1.0;
        u_xlat3.x = dot(u_xlat3, u_xlat5);
        u_xlat3.y = dot(u_xlat4, u_xlat5);
        u_xlat3.z = dot(u_xlat2, u_xlat5);
    } else {
        u_xlat2.xyz = input.TEXCOORD1.xyz;
        u_xlat2.w = 1.0;
        u_xlat3.x = dot(Globals.unity_SHAr, u_xlat2);
        u_xlat3.y = dot(Globals.unity_SHAg, u_xlat2);
        u_xlat3.z = dot(Globals.unity_SHAb, u_xlat2);
    }
    u_xlat2.xyz = u_xlat3.xyz + input.TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * float3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = fma(u_xlat2.xyz, float3(1.05499995, 1.05499995, 1.05499995), float3(-0.0549999997, -0.0549999997, -0.0549999997));
    u_xlat2.xyz = max(u_xlat2.xyz, float3(0.0, 0.0, 0.0));
    u_xlat0.xyz = fma(u_xlat0.xyz, Globals._Color.xyz, float3(-0.220916301, -0.220916301, -0.220916301));
    output.SV_Target1.xyz = fma(float3(Globals._Metallic), u_xlat0.xyz, float3(0.220916301, 0.220916301, 0.220916301));
    u_xlat0.x = fma((-Globals._Metallic), 0.779083729, 0.779083729);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    output.SV_Target3.xyz = u_xlat2.xyz * u_xlat0.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz;
    output.SV_Target0.w = 1.0;
    output.SV_Target1.w = Globals._Glossiness;
    output.SV_Target2.xyz = fma(input.TEXCOORD1.xyz, float3(0.5, 0.5, 0.5), float3(0.5, 0.5, 0.5));
    output.SV_Target2.w = 1.0;
    output.SV_Target3.w = 1.0;
    return output;
}


-- Vertex shader for "glcore":
Shader Disassembly:
#ifdef VERTEX
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHBr;
uniform 	vec4 unity_SHBg;
uniform 	vec4 unity_SHBb;
uniform 	vec4 unity_SHC;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _MainTex_ST;
in  vec4 in_POSITION0;
in  vec3 in_NORMAL0;
in  vec4 in_TEXCOORD0;
out vec2 vs_TEXCOORD0;
out vec3 vs_TEXCOORD1;
out vec3 vs_TEXCOORD2;
out vec4 vs_TEXCOORD4;
out vec3 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat6;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat6 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat6 = inversesqrt(u_xlat6);
    u_xlat0.xyz = vec3(u_xlat6) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    vs_TEXCOORD4 = vec4(0.0, 0.0, 0.0, 0.0);
    u_xlat6 = u_xlat0.y * u_xlat0.y;
    u_xlat6 = u_xlat0.x * u_xlat0.x + (-u_xlat6);
    u_xlat1 = u_xlat0.yzzx * u_xlat0.xyzz;
    u_xlat0.x = dot(unity_SHBr, u_xlat1);
    u_xlat0.y = dot(unity_SHBg, u_xlat1);
    u_xlat0.z = dot(unity_SHBb, u_xlat1);
    vs_TEXCOORD5.xyz = unity_SHC.xyz * vec3(u_xlat6) + u_xlat0.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 150
#extension GL_ARB_explicit_attrib_location : require
#extension GL_ARB_shader_bit_encoding : enable

uniform 	vec4 unity_SHAr;
uniform 	vec4 unity_SHAg;
uniform 	vec4 unity_SHAb;
uniform 	vec4 unity_ProbeVolumeParams;
uniform 	vec4 hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[4];
uniform 	vec3 unity_ProbeVolumeSizeInv;
uniform 	vec3 unity_ProbeVolumeMin;
uniform 	float _Glossiness;
uniform 	float _Metallic;
uniform 	vec4 _Color;
uniform  sampler2D _MainTex;
uniform  sampler3D unity_ProbeVolumeSH;
in  vec2 vs_TEXCOORD0;
in  vec3 vs_TEXCOORD1;
in  vec3 vs_TEXCOORD2;
in  vec3 vs_TEXCOORD5;
layout(location = 0) out vec4 SV_Target0;
layout(location = 1) out vec4 SV_Target1;
layout(location = 2) out vec4 SV_Target2;
layout(location = 3) out vec4 SV_Target3;
vec3 u_xlat0;
vec4 u_xlat10_0;
vec3 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat10_2;
vec3 u_xlat3;
vec4 u_xlat10_3;
vec3 u_xlat4;
vec4 u_xlat10_4;
vec4 u_xlat5;
float u_xlat8;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat10_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * _Color.xyz;
    u_xlatb18 = unity_ProbeVolumeParams.x==1.0;
    if(u_xlatb18){
        u_xlatb18 = unity_ProbeVolumeParams.y==1.0;
        u_xlat2.xyz = vs_TEXCOORD2.yyy * hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[1].xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[0].xyz * vs_TEXCOORD2.xxx + u_xlat2.xyz;
        u_xlat2.xyz = hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[2].xyz * vs_TEXCOORD2.zzz + u_xlat2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + hlslcc_mtx4x4unity_ProbeVolumeWorldToObject[3].xyz;
        u_xlat2.xyz = (bool(u_xlatb18)) ? u_xlat2.xyz : vs_TEXCOORD2.xyz;
        u_xlat2.xyz = u_xlat2.xyz + (-unity_ProbeVolumeMin.xyz);
        u_xlat2.yzw = u_xlat2.xyz * unity_ProbeVolumeSizeInv.xyz;
        u_xlat18 = u_xlat2.y * 0.25;
        u_xlat19 = unity_ProbeVolumeParams.z * 0.5;
        u_xlat8 = (-unity_ProbeVolumeParams.z) * 0.5 + 0.25;
        u_xlat18 = max(u_xlat18, u_xlat19);
        u_xlat2.x = min(u_xlat8, u_xlat18);
        u_xlat10_3 = texture(unity_ProbeVolumeSH, u_xlat2.xzw);
        u_xlat4.xyz = u_xlat2.xzw + vec3(0.25, 0.0, 0.0);
        u_xlat10_4 = texture(unity_ProbeVolumeSH, u_xlat4.xyz);
        u_xlat2.xyz = u_xlat2.xzw + vec3(0.5, 0.0, 0.0);
        u_xlat10_2 = texture(unity_ProbeVolumeSH, u_xlat2.xyz);
        u_xlat5.xyz = vs_TEXCOORD1.xyz;
        u_xlat5.w = 1.0;
        u_xlat3.x = dot(u_xlat10_3, u_xlat5);
        u_xlat3.y = dot(u_xlat10_4, u_xlat5);
        u_xlat3.z = dot(u_xlat10_2, u_xlat5);
    } else {
        u_xlat2.xyz = vs_TEXCOORD1.xyz;
        u_xlat2.w = 1.0;
        u_xlat3.x = dot(unity_SHAr, u_xlat2);
        u_xlat3.y = dot(unity_SHAg, u_xlat2);
        u_xlat3.z = dot(unity_SHAb, u_xlat2);
    //ENDIF
    }
    u_xlat2.xyz = u_xlat3.xyz + vs_TEXCOORD5.xyz;
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = u_xlat10_0.xyz * _Color.xyz + vec3(-0.220916301, -0.220916301, -0.220916301);
    SV_Target1.xyz = vec3(vec3(_Metallic, _Metallic, _Metallic)) * u_xlat0.xyz + vec3(0.220916301, 0.220916301, 0.220916301);
    u_xlat0.x = (-_Metallic) * 0.779083729 + 0.779083729;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz;
    SV_Target3.xyz = u_xlat2.xyz * u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    SV_Target1.w = _Glossiness;
    SV_Target2.xyz = vs_TEXCOORD1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    SV_Target2.w = 1.0;
    SV_Target3.w = 1.0;
    return;
}

#endif


-- Fragment shader for "glcore":
Shader Disassembly:
// All GLSL source is contained within the vertex program

 }
}
Fallback "Diffuse"
}