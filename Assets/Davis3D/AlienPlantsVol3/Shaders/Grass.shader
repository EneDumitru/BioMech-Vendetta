// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Davis3D/AlienPlants_Vol3/Nature/Grass"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_MainTex("Diffuse", 2D) = "white" {}
		_Diffuse_Multiply("Diffuse_Multiply", Color) = (1,1,1,1)
		_Desaturation("Desaturation", Float) = 0
		_Diffuse_Brightness("Diffuse_Brightness", Float) = 1
		_Dif_Hue_Variation("Dif_Hue_Variation", Float) = 0
		_HueShift("HueShift", Float) = 0
		_Metallic("Metallic", Range( 0 , 1)) = 0
		_Smoothness("Smoothness", Range( 0 , 1)) = 0.5
		_GlowColor("GlowColor", Color) = (0,0.6745098,1,1)
		_Glow("Glow", 2D) = "white" {}
		_Glow_Amount("Glow_Amount", Float) = 3
		[Header(GlowWave)][Space][Toggle(_GLOWWAVEON_ON)] _GlowWaveOn("GlowWave", Float) = 0
		_Glow_Min_Amount("Glow_Min_Amount", Float) = 0.1
		_GlowWave("GlowWave", 2D) = "white" {}
		_Glow_MASTER_SCALE("Glow_MASTER_SCALE", Float) = 400
		_GlowWaveSpeed("GlowWaveSpeed", Float) = 5000
		_GlowWave_1_Scale("GlowWave_1_Scale", Float) = 0.3
		_GlowWave_2_Scale("GlowWave_2_Scale", Float) = 0.015
		_GlowWave_3_Scale("GlowWave_3_Scale", Float) = 0.08
		_GlowWave_4_Scale("GlowWave_4_Scale", Float) = 0.25
		_GlowWave_5_Scale("GlowWave_5_Scale", Float) = 0.003
		_GlowWave_1_Speed_X("GlowWave_1_Speed_X", Float) = -0.05
		_GlowWave_1_Speed_Y("GlowWave_1_Speed_Y", Float) = 0.01
		_GlowWave_2_Speed_X("GlowWave_2_Speed_X", Float) = 0.005
		_GlowWave_2_Speed_Y("GlowWave_2_Speed_Y", Float) = -0.01
		_GlowWave_3_Speed_X("GlowWave_3_Speed_X", Float) = 0.02
		_GlowWave_3_Speed_Y("GlowWave_3_Speed_Y", Float) = 0.005
		_GlowWave_4_Speed_X("GlowWave_4_Speed_X", Float) = 0.2
		_GlowWave_4_Speed_Y("GlowWave_4_Speed_Y", Float) = -0.002
		_GlowWave_5_Speed_X("GlowWave_5_Speed_X", Float) = 0.006
		_GlowWave_5_Speed_Y("GlowWave_5_Speed_Y", Float) = 0.001
		[Header(Wind)][Space][Toggle(_WIND_ON)] _Wind("Wind", Float) = 0
		_WindMask("WindMask", 2D) = "white" {}
		_Wind_Weight("Wind_Weight", Float) = 0.3
		_Wind_Intensity("Wind_Intensity", Float) = 1
		_Wind_Speed("Wind_Speed", Float) = 0.1
		_LODDitheringLength("LOD Dithering Length", Float) = 30
		_LODDitheringOffset("LOD Dithering Offset", Float) = 20
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Lit" }

		Cull Off
		ZWrite Off
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
							(( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _GLOWWAVEON_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;
			sampler2D _MainTex;
			sampler2D _GlowWave;
			sampler2D _Glow;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord8.z = customEye291;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 color5_g1221 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1221 = normalize( color5_g1221 );
				float3 temp_cast_1 = (0.0).xxx;
				float4 color5_g1219 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1219 = normalize( color5_g1219 );
				float4 transform14 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult16 = (float2(transform14.x , transform14.z));
				float dotResult4_g1218 = dot( appendResult16 , float2( 12.9898,78.233 ) );
				float lerpResult10_g1218 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g1218 ) * 43758.55 ) ));
				float3 temp_cast_3 = (0.0).xxx;
				float2 uv_MainTex = IN.ase_texcoord8.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_3_0_g1219 = tex2D( _MainTex, uv_MainTex ).rgb;
				float3 rotatedValue2_g1219 = RotateAroundAxis( temp_cast_3, temp_output_3_0_g1219, normalizeResult6_g1219.rgb, ( lerpResult10_g1218 * _Dif_Hue_Variation ) );
				float3 temp_output_3_0_g1221 = ( rotatedValue2_g1219 + temp_output_3_0_g1219 );
				float3 rotatedValue2_g1221 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g1221, normalizeResult6_g1221.rgb, _HueShift );
				float3 desaturateInitialColor12 = ( float4( ( rotatedValue2_g1221 + temp_output_3_0_g1221 ) , 0.0 ) * _Diffuse_Multiply ).rgb;
				float desaturateDot12 = dot( desaturateInitialColor12, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar12 = lerp( desaturateInitialColor12, desaturateDot12.xxx, _Desaturation );
				
				float2 appendResult14_g1180 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1181 = appendResult14_g1180;
				float temp_output_11_0_g1181 = _GlowWaveSpeed;
				float2 appendResult1_g1181 = (float2(( break5_g1181.x + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_X ) ) ) , ( break5_g1181.y + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g1180 = (float3(appendResult1_g1181 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1182 = ( appendResult8_g1180 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g1182 = tex2D( _GlowWave, (temp_output_3_0_g1182).xz );
				float2 appendResult14_g1175 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1176 = appendResult14_g1175;
				float temp_output_11_0_g1176 = _GlowWaveSpeed;
				float2 appendResult1_g1176 = (float2(( break5_g1176.x + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_X ) ) ) , ( break5_g1176.y + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g1175 = (float3(appendResult1_g1176 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1177 = ( appendResult8_g1175 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g1177 = tex2D( _GlowWave, (temp_output_3_0_g1177).xz );
				float2 appendResult14_g1208 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1209 = appendResult14_g1208;
				float temp_output_11_0_g1209 = _GlowWaveSpeed;
				float2 appendResult1_g1209 = (float2(( break5_g1209.x + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_X ) ) ) , ( break5_g1209.y + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g1208 = (float3(appendResult1_g1209 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1210 = ( appendResult8_g1208 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g1210 = tex2D( _GlowWave, (temp_output_3_0_g1210).xz );
				float2 appendResult14_g1203 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1204 = appendResult14_g1203;
				float temp_output_11_0_g1204 = _GlowWaveSpeed;
				float2 appendResult1_g1204 = (float2(( break5_g1204.x + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_X ) ) ) , ( break5_g1204.y + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g1203 = (float3(appendResult1_g1204 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1205 = ( appendResult8_g1203 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g1205 = tex2D( _GlowWave, (temp_output_3_0_g1205).xz );
				float2 appendResult14_g1213 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1214 = appendResult14_g1213;
				float temp_output_11_0_g1214 = _GlowWaveSpeed;
				float2 appendResult1_g1214 = (float2(( break5_g1214.x + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_X ) ) ) , ( break5_g1214.y + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g1213 = (float3(appendResult1_g1214 , WorldPosition.z));
				float3 temp_cast_11 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1215 = ( appendResult8_g1213 / -abs( temp_cast_11 ) );
				float4 tex2DNode16_g1215 = tex2D( _GlowWave, (temp_output_3_0_g1215).xz );
				float clampResult59 = clamp( ( ( ( (tex2DNode16_g1182).r * (tex2DNode16_g1177).r ) + (tex2DNode16_g1210).r ) * ( (tex2DNode16_g1205).r + (tex2DNode16_g1215).r ) ) , _Glow_Min_Amount , 1.0 );
				#ifdef _GLOWWAVEON_ON
				float staticSwitch305 = clampResult59;
				#else
				float staticSwitch305 = 1.0;
				#endif
				float GlowWave306 = staticSwitch305;
				float4 color5_g1222 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1222 = normalize( color5_g1222 );
				float3 temp_cast_13 = (0.0).xxx;
				float3 temp_output_3_0_g1222 = _GlowColor.rgb;
				float3 rotatedValue2_g1222 = RotateAroundAxis( temp_cast_13, temp_output_3_0_g1222, normalizeResult6_g1222.rgb, _HueShift );
				float3 desaturateInitialColor71 = ( rotatedValue2_g1222 + temp_output_3_0_g1222 );
				float desaturateDot71 = dot( desaturateInitialColor71, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar71 = lerp( desaturateInitialColor71, desaturateDot71.xxx, _Desaturation );
				float2 uv_Glow = IN.ase_texcoord8.xy * _Glow_ST.xy + _Glow_ST.zw;
				
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord8.z;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float3 BaseColor = ( desaturateVar12 * _Diffuse_Brightness );
				float3 Normal = float3(0, 0, 1);
				float3 Emission = ( float4( ( ( GlowWave306 * _Glow_Amount ) * desaturateVar71 ) , 0.0 ) * tex2D( _Glow, uv_Glow ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD2;
				#endif				
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord3.x = customEye291;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.yzw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;
				o.clipPosV = clipPos;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord3.x;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			
			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD1;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord3.x = customEye291;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.yzw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord3.x;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _GLOWWAVEON_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;
			sampler2D _MainTex;
			sampler2D _GlowWave;
			sampler2D _Glow;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.texcoord0.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord5 = screenPos;
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord4.z = customEye291;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 color5_g1221 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1221 = normalize( color5_g1221 );
				float3 temp_cast_1 = (0.0).xxx;
				float4 color5_g1219 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1219 = normalize( color5_g1219 );
				float4 transform14 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult16 = (float2(transform14.x , transform14.z));
				float dotResult4_g1218 = dot( appendResult16 , float2( 12.9898,78.233 ) );
				float lerpResult10_g1218 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g1218 ) * 43758.55 ) ));
				float3 temp_cast_3 = (0.0).xxx;
				float2 uv_MainTex = IN.ase_texcoord4.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_3_0_g1219 = tex2D( _MainTex, uv_MainTex ).rgb;
				float3 rotatedValue2_g1219 = RotateAroundAxis( temp_cast_3, temp_output_3_0_g1219, normalizeResult6_g1219.rgb, ( lerpResult10_g1218 * _Dif_Hue_Variation ) );
				float3 temp_output_3_0_g1221 = ( rotatedValue2_g1219 + temp_output_3_0_g1219 );
				float3 rotatedValue2_g1221 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g1221, normalizeResult6_g1221.rgb, _HueShift );
				float3 desaturateInitialColor12 = ( float4( ( rotatedValue2_g1221 + temp_output_3_0_g1221 ) , 0.0 ) * _Diffuse_Multiply ).rgb;
				float desaturateDot12 = dot( desaturateInitialColor12, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar12 = lerp( desaturateInitialColor12, desaturateDot12.xxx, _Desaturation );
				
				float2 appendResult14_g1180 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1181 = appendResult14_g1180;
				float temp_output_11_0_g1181 = _GlowWaveSpeed;
				float2 appendResult1_g1181 = (float2(( break5_g1181.x + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_X ) ) ) , ( break5_g1181.y + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g1180 = (float3(appendResult1_g1181 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1182 = ( appendResult8_g1180 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g1182 = tex2D( _GlowWave, (temp_output_3_0_g1182).xz );
				float2 appendResult14_g1175 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1176 = appendResult14_g1175;
				float temp_output_11_0_g1176 = _GlowWaveSpeed;
				float2 appendResult1_g1176 = (float2(( break5_g1176.x + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_X ) ) ) , ( break5_g1176.y + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g1175 = (float3(appendResult1_g1176 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1177 = ( appendResult8_g1175 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g1177 = tex2D( _GlowWave, (temp_output_3_0_g1177).xz );
				float2 appendResult14_g1208 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1209 = appendResult14_g1208;
				float temp_output_11_0_g1209 = _GlowWaveSpeed;
				float2 appendResult1_g1209 = (float2(( break5_g1209.x + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_X ) ) ) , ( break5_g1209.y + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g1208 = (float3(appendResult1_g1209 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1210 = ( appendResult8_g1208 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g1210 = tex2D( _GlowWave, (temp_output_3_0_g1210).xz );
				float2 appendResult14_g1203 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1204 = appendResult14_g1203;
				float temp_output_11_0_g1204 = _GlowWaveSpeed;
				float2 appendResult1_g1204 = (float2(( break5_g1204.x + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_X ) ) ) , ( break5_g1204.y + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g1203 = (float3(appendResult1_g1204 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1205 = ( appendResult8_g1203 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g1205 = tex2D( _GlowWave, (temp_output_3_0_g1205).xz );
				float2 appendResult14_g1213 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1214 = appendResult14_g1213;
				float temp_output_11_0_g1214 = _GlowWaveSpeed;
				float2 appendResult1_g1214 = (float2(( break5_g1214.x + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_X ) ) ) , ( break5_g1214.y + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g1213 = (float3(appendResult1_g1214 , WorldPosition.z));
				float3 temp_cast_11 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1215 = ( appendResult8_g1213 / -abs( temp_cast_11 ) );
				float4 tex2DNode16_g1215 = tex2D( _GlowWave, (temp_output_3_0_g1215).xz );
				float clampResult59 = clamp( ( ( ( (tex2DNode16_g1182).r * (tex2DNode16_g1177).r ) + (tex2DNode16_g1210).r ) * ( (tex2DNode16_g1205).r + (tex2DNode16_g1215).r ) ) , _Glow_Min_Amount , 1.0 );
				#ifdef _GLOWWAVEON_ON
				float staticSwitch305 = clampResult59;
				#else
				float staticSwitch305 = 1.0;
				#endif
				float GlowWave306 = staticSwitch305;
				float4 color5_g1222 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1222 = normalize( color5_g1222 );
				float3 temp_cast_13 = (0.0).xxx;
				float3 temp_output_3_0_g1222 = _GlowColor.rgb;
				float3 rotatedValue2_g1222 = RotateAroundAxis( temp_cast_13, temp_output_3_0_g1222, normalizeResult6_g1222.rgb, _HueShift );
				float3 desaturateInitialColor71 = ( rotatedValue2_g1222 + temp_output_3_0_g1222 );
				float desaturateDot71 = dot( desaturateInitialColor71, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar71 = lerp( desaturateInitialColor71, desaturateDot71.xxx, _Desaturation );
				float2 uv_Glow = IN.ase_texcoord4.xy * _Glow_ST.xy + _Glow_ST.zw;
				
				float4 screenPos = IN.ase_texcoord5;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord4.z;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float3 BaseColor = ( desaturateVar12 * _Diffuse_Brightness );
				float3 Emission = ( float4( ( ( GlowWave306 * _Glow_Amount ) * desaturateVar71 ) , 0.0 ) * tex2D( _Glow, uv_Glow ) ).rgb;
				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;
			sampler2D _MainTex;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord3 = screenPos;
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord2.z = customEye291;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 color5_g1221 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1221 = normalize( color5_g1221 );
				float3 temp_cast_1 = (0.0).xxx;
				float4 color5_g1219 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1219 = normalize( color5_g1219 );
				float4 transform14 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult16 = (float2(transform14.x , transform14.z));
				float dotResult4_g1218 = dot( appendResult16 , float2( 12.9898,78.233 ) );
				float lerpResult10_g1218 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g1218 ) * 43758.55 ) ));
				float3 temp_cast_3 = (0.0).xxx;
				float2 uv_MainTex = IN.ase_texcoord2.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_3_0_g1219 = tex2D( _MainTex, uv_MainTex ).rgb;
				float3 rotatedValue2_g1219 = RotateAroundAxis( temp_cast_3, temp_output_3_0_g1219, normalizeResult6_g1219.rgb, ( lerpResult10_g1218 * _Dif_Hue_Variation ) );
				float3 temp_output_3_0_g1221 = ( rotatedValue2_g1219 + temp_output_3_0_g1219 );
				float3 rotatedValue2_g1221 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g1221, normalizeResult6_g1221.rgb, _HueShift );
				float3 desaturateInitialColor12 = ( float4( ( rotatedValue2_g1221 + temp_output_3_0_g1221 ) , 0.0 ) * _Diffuse_Multiply ).rgb;
				float desaturateDot12 = dot( desaturateInitialColor12, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar12 = lerp( desaturateInitialColor12, desaturateDot12.xxx, _Desaturation );
				
				float4 screenPos = IN.ase_texcoord3;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord2.z;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float3 BaseColor = ( desaturateVar12 * _Diffuse_Brightness );
				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif

			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float3 worldNormal : TEXCOORD1;
				float4 worldTangent : TEXCOORD2;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD3;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD4;
				#endif
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord5.x = customEye291;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.yzw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord5.x;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float3 Normal = float3(0, 0, 1);
				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend SrcAlpha OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#if defined(LOD_FADE_CROSSFADE)
            #include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
            #endif
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_SCREEN_POSITION
			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _GLOWWAVEON_ON


			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE) && (SHADER_TARGET >= 45)
				#define ASE_SV_DEPTH SV_DepthLessEqual
				#define ASE_SV_POSITION_QUALIFIERS linear noperspective centroid
			#else
				#define ASE_SV_DEPTH SV_Depth
				#define ASE_SV_POSITION_QUALIFIERS
			#endif

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				ASE_SV_POSITION_QUALIFIERS float4 clipPos : SV_POSITION;
				float4 clipPosV : TEXCOORD0;
				float4 lightmapUVOrVertexSH : TEXCOORD1;
				half4 fogFactorAndVertexLight : TEXCOORD2;
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;
			sampler2D _MainTex;
			sampler2D _GlowWave;
			sampler2D _Glow;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord8.z = customEye291;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord.xy;
					o.lightmapUVOrVertexSH.xy = v.texcoord.xy * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				o.clipPosV = positionCS;
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				float4 ClipPos = IN.clipPosV;
				float4 ScreenPos = ComputeScreenPos( IN.clipPosV );

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 color5_g1221 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1221 = normalize( color5_g1221 );
				float3 temp_cast_1 = (0.0).xxx;
				float4 color5_g1219 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1219 = normalize( color5_g1219 );
				float4 transform14 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult16 = (float2(transform14.x , transform14.z));
				float dotResult4_g1218 = dot( appendResult16 , float2( 12.9898,78.233 ) );
				float lerpResult10_g1218 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g1218 ) * 43758.55 ) ));
				float3 temp_cast_3 = (0.0).xxx;
				float2 uv_MainTex = IN.ase_texcoord8.xy * _MainTex_ST.xy + _MainTex_ST.zw;
				float3 temp_output_3_0_g1219 = tex2D( _MainTex, uv_MainTex ).rgb;
				float3 rotatedValue2_g1219 = RotateAroundAxis( temp_cast_3, temp_output_3_0_g1219, normalizeResult6_g1219.rgb, ( lerpResult10_g1218 * _Dif_Hue_Variation ) );
				float3 temp_output_3_0_g1221 = ( rotatedValue2_g1219 + temp_output_3_0_g1219 );
				float3 rotatedValue2_g1221 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g1221, normalizeResult6_g1221.rgb, _HueShift );
				float3 desaturateInitialColor12 = ( float4( ( rotatedValue2_g1221 + temp_output_3_0_g1221 ) , 0.0 ) * _Diffuse_Multiply ).rgb;
				float desaturateDot12 = dot( desaturateInitialColor12, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar12 = lerp( desaturateInitialColor12, desaturateDot12.xxx, _Desaturation );
				
				float2 appendResult14_g1180 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1181 = appendResult14_g1180;
				float temp_output_11_0_g1181 = _GlowWaveSpeed;
				float2 appendResult1_g1181 = (float2(( break5_g1181.x + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_X ) ) ) , ( break5_g1181.y + ( _TimeParameters.x * ( temp_output_11_0_g1181 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g1180 = (float3(appendResult1_g1181 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1182 = ( appendResult8_g1180 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g1182 = tex2D( _GlowWave, (temp_output_3_0_g1182).xz );
				float2 appendResult14_g1175 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1176 = appendResult14_g1175;
				float temp_output_11_0_g1176 = _GlowWaveSpeed;
				float2 appendResult1_g1176 = (float2(( break5_g1176.x + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_X ) ) ) , ( break5_g1176.y + ( _TimeParameters.x * ( temp_output_11_0_g1176 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g1175 = (float3(appendResult1_g1176 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1177 = ( appendResult8_g1175 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g1177 = tex2D( _GlowWave, (temp_output_3_0_g1177).xz );
				float2 appendResult14_g1208 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1209 = appendResult14_g1208;
				float temp_output_11_0_g1209 = _GlowWaveSpeed;
				float2 appendResult1_g1209 = (float2(( break5_g1209.x + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_X ) ) ) , ( break5_g1209.y + ( _TimeParameters.x * ( temp_output_11_0_g1209 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g1208 = (float3(appendResult1_g1209 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1210 = ( appendResult8_g1208 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g1210 = tex2D( _GlowWave, (temp_output_3_0_g1210).xz );
				float2 appendResult14_g1203 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1204 = appendResult14_g1203;
				float temp_output_11_0_g1204 = _GlowWaveSpeed;
				float2 appendResult1_g1204 = (float2(( break5_g1204.x + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_X ) ) ) , ( break5_g1204.y + ( _TimeParameters.x * ( temp_output_11_0_g1204 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g1203 = (float3(appendResult1_g1204 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1205 = ( appendResult8_g1203 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g1205 = tex2D( _GlowWave, (temp_output_3_0_g1205).xz );
				float2 appendResult14_g1213 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g1214 = appendResult14_g1213;
				float temp_output_11_0_g1214 = _GlowWaveSpeed;
				float2 appendResult1_g1214 = (float2(( break5_g1214.x + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_X ) ) ) , ( break5_g1214.y + ( _TimeParameters.x * ( temp_output_11_0_g1214 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g1213 = (float3(appendResult1_g1214 , WorldPosition.z));
				float3 temp_cast_11 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g1215 = ( appendResult8_g1213 / -abs( temp_cast_11 ) );
				float4 tex2DNode16_g1215 = tex2D( _GlowWave, (temp_output_3_0_g1215).xz );
				float clampResult59 = clamp( ( ( ( (tex2DNode16_g1182).r * (tex2DNode16_g1177).r ) + (tex2DNode16_g1210).r ) * ( (tex2DNode16_g1205).r + (tex2DNode16_g1215).r ) ) , _Glow_Min_Amount , 1.0 );
				#ifdef _GLOWWAVEON_ON
				float staticSwitch305 = clampResult59;
				#else
				float staticSwitch305 = 1.0;
				#endif
				float GlowWave306 = staticSwitch305;
				float4 color5_g1222 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g1222 = normalize( color5_g1222 );
				float3 temp_cast_13 = (0.0).xxx;
				float3 temp_output_3_0_g1222 = _GlowColor.rgb;
				float3 rotatedValue2_g1222 = RotateAroundAxis( temp_cast_13, temp_output_3_0_g1222, normalizeResult6_g1222.rgb, _HueShift );
				float3 desaturateInitialColor71 = ( rotatedValue2_g1222 + temp_output_3_0_g1222 );
				float desaturateDot71 = dot( desaturateInitialColor71, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar71 = lerp( desaturateInitialColor71, desaturateDot71.xxx, _Desaturation );
				float2 uv_Glow = IN.ase_texcoord8.xy * _Glow_ST.xy + _Glow_ST.zw;
				
				float4 ase_screenPosNorm = ScreenPos / ScreenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord8.z;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				float3 BaseColor = ( desaturateVar12 * _Diffuse_Brightness );
				float3 Normal = float3(0, 0, 1);
				float3 Emission = ( float4( ( ( GlowWave306 * _Glow_Amount ) * desaturateVar71 ) , 0.0 ) * tex2D( _Glow, uv_Glow ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = _Metallic;
				float Smoothness = _Smoothness;
				float Occlusion = 1;
				float Alpha = LODAlpha292;
				float AlphaClipThreshold = LODAlpha292;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = IN.clipPos.z;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.clipPos;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.clipPos,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord = screenPos;
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord1.x = customEye291;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.yzw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float4 screenPos = IN.ase_texcoord;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord1.x;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				surfaceDescription.Alpha = LODAlpha292;
				surfaceDescription.AlphaClipThreshold = LODAlpha292;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _EMISSION
			#define _ALPHATEST_ON 1
			#define ASE_SRP_VERSION 140008


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_POSITION
			#pragma shader_feature_local _WIND_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _WindMask_ST;
			float4 _Glow_ST;
			float4 _GlowColor;
			float4 _MainTex_ST;
			float4 _Diffuse_Multiply;
			float _Wind_Speed;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _Glow_Min_Amount;
			float _GlowWave_3_Scale;
			float _Metallic;
			float _Smoothness;
			float _GlowWave_5_Scale;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_2_Scale;
			float _LODDitheringLength;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _Glow_MASTER_SCALE;
			float _GlowWave_1_Scale;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_1_Speed_X;
			float _GlowWaveSpeed;
			float _Diffuse_Brightness;
			float _Desaturation;
			float _Dif_Hue_Variation;
			float _HueShift;
			float _Wind_Intensity;
			float _Wind_Weight;
			float _GlowWave_3_Speed_X;
			float _LODDitheringOffset;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _WindMask;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g1224( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			inline float Dither8x8Bayer( int x, int y )
			{
				const float dither[ 64 ] = {
			 1, 49, 13, 61,  4, 52, 16, 64,
			33, 17, 45, 29, 36, 20, 48, 32,
			 9, 57,  5, 53, 12, 60,  8, 56,
			41, 25, 37, 21, 44, 28, 40, 24,
			 3, 51, 15, 63,  2, 50, 14, 62,
			35, 19, 47, 31, 34, 18, 46, 30,
			11, 59,  7, 55, 10, 58,  6, 54,
			43, 27, 39, 23, 42, 26, 38, 22};
				int r = y * 8 + x;
				return dither[r] / 64; // same # of instructions as pre-dividing due to compiler magic
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g1223 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g1223 = normalize( appendResult13_g1223 );
				float3 temp_cast_0 = (3.0).xxx;
				float temp_output_19_0_g1223 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g1224 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g1224 = WorldToAbsoluteWorld3_g1224( In3_g1224 );
				float3 temp_output_62_0_g1223 = localWorldToAbsoluteWorld3_g1224;
				float3 temp_output_45_0_g1223 = abs( ( ( frac( ( ( ( normalizeResult14_g1223 * temp_output_19_0_g1223 ) + ( temp_output_62_0_g1223 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g1223 = dot( normalizeResult14_g1223 , ( ( ( temp_cast_0 - ( temp_output_45_0_g1223 * 2.0 ) ) * temp_output_45_0_g1223 ) * temp_output_45_0_g1223 ) );
				float3 temp_cast_1 = (3.0).xxx;
				float3 temp_output_46_0_g1223 = abs( ( ( frac( ( ( temp_output_19_0_g1223 + ( temp_output_62_0_g1223 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_2 = (0.0).xxx;
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_output_8_0_g1223 = temp_cast_3;
				float3 rotatedValue6_g1223 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g1223 ), temp_output_8_0_g1223, cross( normalizeResult14_g1223 , float3(0,0,1) ), ( dotResult58_g1223 + distance( ( ( ( temp_cast_1 - ( temp_output_46_0_g1223 * 2.0 ) ) * temp_output_46_0_g1223 ) * temp_output_46_0_g1223 ) , temp_cast_2 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult116 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g1223 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g1223 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch309 = lerpResult116;
				#else
				float3 staticSwitch309 = float3( 0,0,0 );
				#endif
				
				float4 ase_clipPos = TransformObjectToHClip((v.vertex).xyz);
				float4 screenPos = ComputeScreenPos(ase_clipPos);
				o.ase_texcoord = screenPos;
				float3 customSurfaceDepth291 = v.vertex.xyz;
				float customEye291 = -TransformWorldToView(TransformObjectToWorld(customSurfaceDepth291)).z;
				o.ase_texcoord1.x = customEye291;
				
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.yzw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch309;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float4 screenPos = IN.ase_texcoord;
				float4 ase_screenPosNorm = screenPos / screenPos.w;
				ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
				float2 clipScreen290 = ase_screenPosNorm.xy * _ScreenParams.xy;
				float dither290 = Dither8x8Bayer( fmod(clipScreen290.x, 8), fmod(clipScreen290.y, 8) );
				float customEye291 = IN.ase_texcoord1.x;
				float cameraDepthFade291 = (( customEye291 -_ProjectionParams.y - _LODDitheringOffset ) / _LODDitheringLength);
				float clampResult296 = clamp( cameraDepthFade291 , 0.0 , 1.0 );
				dither290 = step( dither290, ( 1.0 - clampResult296 ) );
				float LODAlpha292 = dither290;
				

				surfaceDescription.Alpha = LODAlpha292;
				surfaceDescription.AlphaClipThreshold = LODAlpha292;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.CommentaryNode;301;-4170.201,-21.98611;Inherit;False;2122.272;1141.557;GlowWave;31;310;123;124;121;288;284;287;130;132;125;126;133;285;135;128;127;129;120;122;306;305;59;307;57;58;56;55;52;286;117;118;;0,0.8378735,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-3742.889,125.1001;Inherit;False;Property;_GlowWave_1_Speed_X;GlowWave_1_Speed_X;24;0;Create;True;0;0;0;False;0;False;-0.05;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-3743.001,193.899;Inherit;False;Property;_GlowWave_1_Speed_Y;GlowWave_1_Speed_Y;25;0;Create;True;0;0;0;False;0;False;0.01;0.0001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-3730.05,260.8191;Inherit;False;Property;_GlowWave_2_Scale;GlowWave_2_Scale;20;0;Create;True;0;0;0;False;0;False;0.015;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-3744.57,329.0759;Inherit;False;Property;_GlowWave_2_Speed_X;GlowWave_2_Speed_X;26;0;Create;True;0;0;0;False;0;False;0.005;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;122;-3742.631,395.2811;Inherit;False;Property;_GlowWave_2_Speed_Y;GlowWave_2_Speed_Y;27;0;Create;True;0;0;0;False;0;False;-0.01;-0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-4105.973,299.273;Inherit;False;Property;_GlowWaveSpeed;GlowWaveSpeed;18;0;Create;True;0;0;0;False;0;False;5000;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;118;-4112.761,102.823;Inherit;True;Property;_GlowWave;GlowWave;15;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;310;-3721.369,54.5947;Inherit;False;Property;_GlowWave_1_Scale;GlowWave_1_Scale;19;0;Create;True;0;0;0;False;0;False;0.3;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;128;-3732.587,593.4124;Inherit;False;Property;_GlowWave_3_Speed_Y;GlowWave_3_Speed_Y;29;0;Create;True;0;0;0;False;0;False;0.005;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;130;-3735.969,942.6481;Inherit;False;Property;_GlowWave_5_Speed_X;GlowWave_5_Speed_X;32;0;Create;True;0;0;0;False;0;False;0.006;0.001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;132;-3732.219,1010.753;Inherit;False;Property;_GlowWave_5_Speed_Y;GlowWave_5_Speed_Y;33;0;Create;True;0;0;0;False;0;False;0.001;0.001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;125;-3723.26,663.2192;Inherit;False;Property;_GlowWave_4_Scale;GlowWave_4_Scale;22;0;Create;True;0;0;0;False;0;False;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;129;-3740.603,527.9532;Inherit;False;Property;_GlowWave_3_Speed_X;GlowWave_3_Speed_X;28;0;Create;True;0;0;0;False;0;False;0.02;0.015;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;126;-3737.687,801.7171;Inherit;False;Property;_GlowWave_4_Speed_Y;GlowWave_4_Speed_Y;31;0;Create;True;0;0;0;False;0;False;-0.002;-0.002;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;285;-3397.303,301.208;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;16;;1175;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;135;-3716.95,870.3232;Inherit;False;Property;_GlowWave_5_Scale;GlowWave_5_Scale;23;0;Create;True;0;0;0;False;0;False;0.003;0.007;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;286;-3391.815,98.47899;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;16;;1180;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;127;-3720.757,463.9531;Inherit;False;Property;_GlowWave_3_Scale;GlowWave_3_Scale;21;0;Create;True;0;0;0;False;0;False;0.08;0.08;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;133;-3742.068,732.0682;Inherit;False;Property;_GlowWave_4_Speed_X;GlowWave_4_Speed_X;30;0;Create;True;0;0;0;False;0;False;0.2;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;52;-3045.624,174.3534;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;300;-1844.903,-536.4683;Inherit;False;1837.67;503.553;Albedo;15;16;14;18;15;19;4;13;8;9;11;10;12;20;5;6;;0,1,0.1187284,1;0;0
Node;AmplifyShaderEditor.FunctionNode;288;-3400.219,622.9422;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;16;;1203;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;284;-3398.175,461.102;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;16;;1208;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;287;-3402.996,783.0571;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;16;;1213;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;56;-2877.705,390.3803;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;55;-3034.599,660.4087;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;14;-1794.902,-486.4682;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;-2723.586,637.3112;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-2789.272,730.7133;Inherit;False;Property;_Glow_Min_Amount;Glow_Min_Amount;14;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;16;-1607.446,-448.6843;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-1499.684,-335.946;Inherit;False;Property;_Dif_Hue_Variation;Dif_Hue_Variation;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-3292.346,1567.694;Inherit;False;Property;_LODDitheringOffset;LOD Dithering Offset;40;0;Create;True;0;0;0;False;0;False;20;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;59;-2598.193,660.8476;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;307;-2615.74,553.0284;Inherit;False;Constant;_Float1;Float 1;45;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;18;-1483.25,-449.4389;Inherit;False;Random Range;-1;;1218;7b754edb8aebbfb4a9ace907af661cfc;0;3;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;294;-3296.195,1500.173;Inherit;False;Property;_LODDitheringLength;LOD Dithering Length;39;0;Create;True;0;0;0;False;0;False;30;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.PosVertexDataNode;293;-3259.195,1362.173;Inherit;False;0;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;305;-2459.197,592.6857;Inherit;False;Property;_GlowWaveOn;GlowWave;13;0;Create;False;0;0;0;False;2;Header(GlowWave);Space;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;4;-1503.7,-262.9153;Inherit;True;Property;_MainTex;Diffuse;0;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.CommentaryNode;303;-1843.336,-28.43362;Inherit;False;1028.043;350.2;Normal;5;1;107;2;108;106;;0,0.3093212,1,1;0;0
Node;AmplifyShaderEditor.CameraDepthFade;291;-3034.791,1479.375;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;20;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;19;-1307.873,-404.0422;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;302;-1843.539,330.9426;Inherit;False;1110.721;636.5601;Glow;11;74;73;63;64;65;70;71;72;98;97;308;;1,0,0,1;0;0
Node;AmplifyShaderEditor.ColorNode;63;-1793.539,619.0317;Inherit;False;Property;_GlowColor;GlowColor;10;0;Create;True;0;0;0;False;0;False;0,0.6745098,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;306;-2236.974,592.5984;Inherit;False;GlowWave;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CommentaryNode;304;-1611.715,974.1215;Inherit;False;877.0411;460;Wind;8;309;116;115;114;111;113;112;110;;1,1,1,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1793.336,126.8818;Inherit;False;Property;_Norm_Amount;Norm_Amount;9;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;8;-998.2195,-387.6604;Inherit;False;Property;_HueShift;HueShift;4;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;296;-2793.033,1479.232;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;13;-1166.673,-318.0761;Inherit;False;HueShift;-1;;1219;3748b6194161e1143a6905ade0b83f9a;0;2;1;FLOAT;0;False;3;FLOAT3;0,1,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-1727.11,547.1072;Inherit;False;Property;_HueShift;HueShift;5;0;Fetch;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;10;-761.3502,-275.5865;Inherit;False;Property;_Diffuse_Multiply;Diffuse_Multiply;1;0;Create;True;0;0;0;False;0;False;1,1,1,1;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;308;-1442.544,404.2739;Inherit;False;306;GlowWave;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;9;-861.1299,-365.5845;Inherit;False;HueShift;-1;;1221;3748b6194161e1143a6905ade0b83f9a;0;2;1;FLOAT;0;False;3;FLOAT3;0,1,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;113;-1555.715,1090.122;Inherit;False;Property;_Wind_Weight;Wind_Weight;36;0;Create;True;0;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;64;-1589.79,573.3107;Inherit;False;HueShift;-1;;1222;3748b6194161e1143a6905ade0b83f9a;0;2;1;FLOAT;0;False;3;FLOAT3;0,1,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;298;-2647.208,1479.134;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;112;-1561.715,1024.122;Inherit;False;Property;_Wind_Intensity;Wind_Intensity;37;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-1546.51,1234.347;Inherit;False;Constant;_float0;float0;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;111;-1554.715,1160.122;Inherit;False;Property;_Wind_Speed;Wind_Speed;38;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;1;-1622.945,78.56268;Inherit;True;Property;_NormalMap;Normal;8;0;Create;False;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;70;-1449.113,663.2205;Inherit;False;Property;_Desaturation;Desaturation;6;0;Fetch;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;73;-1439.287,494.6143;Inherit;False;Property;_Glow_Amount;Glow_Amount;12;0;Create;True;0;0;0;False;0;False;3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;11;-539.2526,-364.3965;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0.1,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;107;-1321.093,210.7663;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;114;-1374.715,1203.122;Inherit;True;Property;_WindMask;WindMask;35;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;20;-541.8891,-270.7049;Inherit;False;Property;_Desaturation;Desaturation;2;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;-1256.22,419.6899;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;115;-1342.451,1038.836;Inherit;False;SimpleGrassWind;-1;;1223;2f5588d2087aaab40a4d9a662ffe0ccd;0;4;5;FLOAT;0;False;7;FLOAT;0;False;23;FLOAT;1;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;71;-1278.947,603.6415;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;72;-1084.402,508.1373;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;98;-1434.701,737.5032;Inherit;True;Property;_Glow;Glow;11;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.DesaturateOpNode;12;-368.4167,-363.7875;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;116;-1047.674,1086.861;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-378.3688,-262.1313;Inherit;False;Property;_Diffuse_Brightness;Diffuse_Brightness;2;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;108;-1161.193,108.6663;Inherit;False;FLOAT3;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-397.4619,61.6792;Inherit;False;Property;_Metallic;Metallic;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;309;-897.6087,1056.943;Inherit;False;Property;_Wind;Wind;34;0;Create;True;0;0;0;False;2;Header(Wind);Space;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SwitchByFaceNode;106;-1023.293,21.56638;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;97;-894.8182,708.2364;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-397.8674,129.3945;Inherit;False;Property;_Smoothness;Smoothness;7;0;Create;True;0;0;0;False;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;6;-169.2327,-341.5611;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;311;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;313;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;314;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;315;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;316;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;317;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;318;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;319;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;320;29,-4;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;312;29,-4;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;Davis3D/AlienPlants_Vol3/Nature/Grass;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;2;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;5;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;41;Workflow;1;0;Surface;1;638275673551861361;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;638264084857516221;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.DitheringNode;290;-2501.965,1473.277;Inherit;False;1;False;4;0;FLOAT;0;False;1;SAMPLER2D;;False;2;FLOAT4;0,0,0,0;False;3;SAMPLERSTATE;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;295;-287.5175,204.1625;Inherit;False;292;LODAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;292;-2332.369,1472.075;Inherit;False;LODAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
WireConnection;285;21;118;0
WireConnection;285;7;121;0
WireConnection;285;11;120;0
WireConnection;285;12;122;0
WireConnection;285;13;117;0
WireConnection;286;21;118;0
WireConnection;286;7;310;0
WireConnection;286;11;123;0
WireConnection;286;12;124;0
WireConnection;286;13;117;0
WireConnection;52;0;286;0
WireConnection;52;1;285;0
WireConnection;288;21;118;0
WireConnection;288;7;125;0
WireConnection;288;11;133;0
WireConnection;288;12;126;0
WireConnection;288;13;117;0
WireConnection;284;21;118;0
WireConnection;284;7;127;0
WireConnection;284;11;129;0
WireConnection;284;12;128;0
WireConnection;284;13;117;0
WireConnection;287;21;118;0
WireConnection;287;7;135;0
WireConnection;287;11;130;0
WireConnection;287;12;132;0
WireConnection;287;13;117;0
WireConnection;56;0;52;0
WireConnection;56;1;284;0
WireConnection;55;0;288;0
WireConnection;55;1;287;0
WireConnection;58;0;56;0
WireConnection;58;1;55;0
WireConnection;16;0;14;1
WireConnection;16;1;14;3
WireConnection;59;0;58;0
WireConnection;59;1;57;0
WireConnection;18;1;16;0
WireConnection;305;1;307;0
WireConnection;305;0;59;0
WireConnection;291;2;293;0
WireConnection;291;0;294;0
WireConnection;291;1;299;0
WireConnection;19;0;18;0
WireConnection;19;1;15;0
WireConnection;306;0;305;0
WireConnection;296;0;291;0
WireConnection;13;1;19;0
WireConnection;13;3;4;0
WireConnection;9;1;8;0
WireConnection;9;3;13;0
WireConnection;64;1;65;0
WireConnection;64;3;63;0
WireConnection;298;0;296;0
WireConnection;1;5;2;0
WireConnection;11;0;9;0
WireConnection;11;1;10;0
WireConnection;107;0;1;2
WireConnection;74;0;308;0
WireConnection;74;1;73;0
WireConnection;115;5;112;0
WireConnection;115;7;113;0
WireConnection;115;23;111;0
WireConnection;115;8;110;0
WireConnection;71;0;64;0
WireConnection;71;1;70;0
WireConnection;72;0;74;0
WireConnection;72;1;71;0
WireConnection;12;0;11;0
WireConnection;12;1;20;0
WireConnection;116;1;115;0
WireConnection;116;2;114;2
WireConnection;108;0;1;1
WireConnection;108;1;107;0
WireConnection;108;2;1;3
WireConnection;309;0;116;0
WireConnection;106;0;1;0
WireConnection;106;1;108;0
WireConnection;97;0;72;0
WireConnection;97;1;98;0
WireConnection;6;0;12;0
WireConnection;6;1;5;0
WireConnection;312;0;6;0
WireConnection;312;2;97;0
WireConnection;312;3;22;0
WireConnection;312;4;23;0
WireConnection;312;6;295;0
WireConnection;312;7;295;0
WireConnection;312;8;309;0
WireConnection;290;0;298;0
WireConnection;292;0;290;0
ASEEND*/
//CHKSM=7F0FD436000EB05917B5F1A83A84031D755B2E87