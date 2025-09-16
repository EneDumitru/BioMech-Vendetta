// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Davis3D/AlienPlants_Vol3/Nature/Plants"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_Diffuse_Detail("Diffuse_Detail", 2D) = "white" {}
		_Diffuse_Detail_Add("Diffuse_Detail_Add", Float) = 0.5
		_Diffuse_Detail_Contrast_A("Diffuse_Detail_Contrast_A", Float) = -2.5
		_Diffuse_Detail_Contrast_B("Diffuse_Detail_Contrast_B", Float) = 3
		_Diffuse_Detail_FadeDistance("Diffuse_Detail_FadeDistance", Float) = 5
		[Toggle(_DIFFUSE_DETAIL_IS_WORLDSPACE_ON)] _Diffuse_Detail_is_WorldSpace("Diffuse_Detail_is_WorldSpace", Float) = 1
		_Diffuse_Detail_WS_Scale("Diffuse_Detail_WS_Scale", Float) = 20
		_Color("Color", Color) = (1,1,1,1)
		_Diffuse("Diffuse", 2D) = "white" {}
		_Diffuse_Brightness("Diffuse_Brightness", Float) = 1
		_Diffuse_Desaturation("Diffuse_Desaturation", Float) = 0
		_FakeLighting_Night("FakeLighting_Night", Float) = 0.01
		_Variation_Hue("Variation_Hue", Float) = 0
		_HueShift_A("HueShift_A", Float) = 0
		_HueShift_B("HueShift_B", Float) = 0
		_Normal("Normal", 2D) = "bump" {}
		_Normal_Amount("Normal_Amount", Float) = 1
		_DetailNormal("DetailNormal", 2D) = "bump" {}
		_Detail_Normal__Amount("Detail_Normal__Amount", Float) = 1
		_Detail_Normal_Scale("Detail_Normal_Scale", Float) = 5
		[Toggle(_METALLICFROMTEX_ON)] _MetallicFromTex("MetallicFromTex", Float) = 0
		[Toggle(_METALGLOWSSS_ON)] _MetalGlowSSS("MetalGlowSSS", Float) = 0
		_MetallicGlow("MetallicGlow", 2D) = "white" {}
		_Metallic("Metallic", Float) = 0
		_Roughness_A("Roughness_A", Float) = 0
		_Roughness_B("Roughness_B", Float) = 1
		_GlowColor("GlowColor", Color) = (0,0.1529412,1,0)
		_Glow_Amount("Glow_Amount", Float) = 1
		_Glow_Min_Amount("Glow_Min_Amount", Float) = 0
		_GlowIntensity_Variation("GlowIntensity_Variation", Float) = 0
		_Glow_MultiplyWithDiffuse("Glow_MultiplyWithDiffuse", Float) = 1
		_Glow_GradientMultiply("Glow_GradientMultiply", Float) = 0
		_GradientPower("GradientPower", Float) = 1
		_GlowWave("GlowWave", 2D) = "white" {}
		_Glow_World_Scale("Glow_World_Scale", Float) = 0.0025
		_Glow_World_Speed("Glow_World_Speed", Float) = 0
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
		[Toggle(_FUZZYSHADING_ON)] _FuzzyShading("FuzzyShading", Float) = 0
		_FuzzyShading_A("FuzzyShading_A", Float) = 0
		_FuzzyShading_B("FuzzyShading_B", Float) = 0
		[Toggle(_WIND_ON)] _Wind("Wind", Float) = 0
		_WindMask("WindMask", 2D) = "white" {}
		_Wind_Intensity("Wind_Intensity", Float) = 1
		_Wind_Speed("Wind_Speed", Float) = 0.1
		_Wind_Weight("Wind_Weight", Float) = 0.3
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

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
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

			Blend One Zero, One Zero
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
			#define _EMISSION
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
			#pragma shader_feature_local _FUZZYSHADING_ON
			#pragma shader_feature_local _METALGLOWSSS_ON
			#pragma shader_feature_local _METALLICFROMTEX_ON


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
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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
			sampler2D _Diffuse_Detail;
			sampler2D _Diffuse;
			sampler2D _Normal;
			sampler2D _DetailNormal;
			sampler2D _MetallicGlow;
			sampler2D _GlowWave;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			
			inline float4 TriplanarSampling25( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			float3 WorldToAbsoluteWorld3_g578( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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
						, bool ase_vface : SV_IsFrontFace ) : SV_Target
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

				float4 color5_g590 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g590 = normalize( color5_g590 );
				float4 transform43 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult44 = (float2(transform43.x , transform43.z));
				float dotResult4_g584 = dot( appendResult44 , float2( 12.9898,78.233 ) );
				float lerpResult10_g584 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g584 ) * 43758.55 ) ));
				float temp_output_48_0 = ( lerpResult10_g584 * ( _Variation_Hue * 0.1 ) );
				float lerpResult50 = lerp( _HueShift_A , _HueShift_B , temp_output_48_0);
				float3 temp_cast_1 = (0.0).xxx;
				float temp_output_1_0_g585 = _Diffuse_Detail_FadeDistance;
				float lerpResult38 = lerp( 1.0 , 0.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g585 ) / ( 0.0 - temp_output_1_0_g585 ) ) ));
				float2 texCoord19 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_cast_2 = (tex2D( _Diffuse_Detail, ( texCoord19 * 8.0 ) ).g).xxxx;
				float2 temp_cast_3 = (_Diffuse_Detail_WS_Scale).xx;
				float4 triplanar25 = TriplanarSampling25( _Diffuse_Detail, WorldPosition, WorldNormal, 1.0, temp_cast_3, 1.0, 0 );
				#ifdef _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
				float4 staticSwitch27 = triplanar25;
				#else
				float4 staticSwitch27 = temp_cast_2;
				#endif
				float lerpResult32 = lerp( _Diffuse_Detail_Contrast_A , _Diffuse_Detail_Contrast_B , staticSwitch27.y);
				float clampResult36 = clamp( lerpResult32 , 0.0 , 1.0 );
				float clampResult41 = clamp( ( lerpResult38 + ( clampResult36 + _Diffuse_Detail_Add ) ) , 0.0 , 1.0 );
				float2 texCoord1 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode3 = tex2D( _Diffuse, texCoord1 );
				float3 desaturateInitialColor6 = tex2DNode3.rgb;
				float desaturateDot6 = dot( desaturateInitialColor6, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6 = lerp( desaturateInitialColor6, desaturateDot6.xxx, _Diffuse_Desaturation );
				float4 temp_output_4_0 = ( _Diffuse_Brightness * ( float4( desaturateVar6 , 0.0 ) * _Color ) );
				float2 _Vector1 = float2(1,1);
				float4 appendResult18_g586 = (float4(_Vector1.x , _Vector1.y , ase_vface , 1.0));
				float3 Binormal8_g587 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				float3x3 TBN10_g587 = float3x3(WorldTangent, Binormal8_g587, WorldNormal);
				float dotResult10_g586 = dot( WorldViewDirection , mul( ( float4( float3( 0,0,1 ) , 0.0 ) * appendResult18_g586 ).xyz, TBN10_g587 ) );
				float clampResult9_g586 = clamp( dotResult10_g586 , 0.0 , 1.0 );
				float3 temp_output_23_0_g586 = temp_output_4_0.rgb;
				float3 desaturateInitialColor24_g586 = temp_output_23_0_g586;
				float desaturateDot24_g586 = dot( desaturateInitialColor24_g586, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24_g586 = lerp( desaturateInitialColor24_g586, desaturateDot24_g586.xxx, 0.5 );
				float clampResult5_g586 = clamp( ( pow( ( 1.0 - clampResult9_g586 ) , 6.0 ) * 0.8 ) , 0.0 , 1.0 );
				float3 lerpResult2_g586 = lerp( ( ( 1.0 - ( clampResult9_g586 * 0.8 ) ) * temp_output_23_0_g586 ) , ( desaturateVar24_g586 * float3( 1,1,1 ) ) , clampResult5_g586);
				float lerpResult15 = lerp( _FuzzyShading_A , _FuzzyShading_B , tex2DNode3.a);
				float4 lerpResult14 = lerp( temp_output_4_0 , float4( lerpResult2_g586 , 0.0 ) , lerpResult15);
				#ifdef _FUZZYSHADING_ON
				float4 staticSwitch13 = lerpResult14;
				#else
				float4 staticSwitch13 = temp_output_4_0;
				#endif
				float3 temp_output_3_0_g590 = ( clampResult41 * staticSwitch13 ).rgb;
				float3 rotatedValue2_g590 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g590, normalizeResult6_g590.rgb, lerpResult50 );
				float3 temp_output_49_0 = ( rotatedValue2_g590 + temp_output_3_0_g590 );
				
				float2 uv_Normal = IN.ase_texcoord8.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 unpack65 = UnpackNormalScale( tex2D( _Normal, uv_Normal ), _Normal_Amount );
				unpack65.z = lerp( 1, unpack65.z, saturate(_Normal_Amount) );
				float2 texCoord60 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack64 = UnpackNormalScale( tex2D( _DetailNormal, ( _Detail_Normal_Scale * texCoord60 ) ), _Detail_Normal__Amount );
				unpack64.z = lerp( 1, unpack64.z, saturate(_Detail_Normal__Amount) );
				
				float4 temp_cast_13 = (0.0).xxxx;
				float2 uv_MetallicGlow = IN.ase_texcoord8.xy * _MetallicGlow_ST.xy + _MetallicGlow_ST.zw;
				float4 tex2DNode72 = tex2D( _MetallicGlow, uv_MetallicGlow );
				float3 In3_g578 = WorldPosition;
				float3 localWorldToAbsoluteWorld3_g578 = WorldToAbsoluteWorld3_g578( In3_g578 );
				float3 break3_g577 = localWorldToAbsoluteWorld3_g578;
				float2 appendResult5_g577 = (float2(break3_g577.x , break3_g577.z));
				float2 temp_output_8_0_g577 = ( appendResult5_g577 * _Glow_World_Scale );
				float2 break5_g580 = temp_output_8_0_g577;
				float temp_output_11_0_g580 = _Glow_World_Speed;
				float2 appendResult1_g580 = (float2(( break5_g580.x + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_X ) ) ) , ( break5_g580.y + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_Y ) ) )));
				float2 break5_g579 = temp_output_8_0_g577;
				float temp_output_11_0_g579 = _Glow_World_Speed;
				float2 appendResult1_g579 = (float2(( break5_g579.x + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_X ) ) ) , ( break5_g579.y + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_Y ) ) )));
				float2 break5_g583 = temp_output_8_0_g577;
				float temp_output_11_0_g583 = _Glow_World_Speed;
				float2 appendResult1_g583 = (float2(( break5_g583.x + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_X ) ) ) , ( break5_g583.y + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_Y ) ) )));
				float2 break5_g582 = temp_output_8_0_g577;
				float temp_output_11_0_g582 = _Glow_World_Speed;
				float2 appendResult1_g582 = (float2(( break5_g582.x + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_X ) ) ) , ( break5_g582.y + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_Y ) ) )));
				float2 break5_g581 = temp_output_8_0_g577;
				float temp_output_11_0_g581 = _Glow_World_Speed;
				float2 appendResult1_g581 = (float2(( break5_g581.x + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_X ) ) ) , ( break5_g581.y + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_Y ) ) )));
				float lerpResult104 = lerp( _Glow_Amount , _GlowIntensity_Variation , temp_output_48_0);
				float4 temp_output_99_0 = ( ( tex2DNode72.g * _GlowColor ) * ( ( _Glow_Min_Amount + ( ( ( ( tex2D( _GlowWave, appendResult1_g580 ).g * tex2D( _GlowWave, appendResult1_g579 ).g ) + tex2D( _GlowWave, appendResult1_g583 ).g ) * ( tex2D( _GlowWave, appendResult1_g582 ).g + tex2D( _GlowWave, appendResult1_g581 ).g ) ) + 0.0 ) ) * lerpResult104 ) );
				float4 lerpResult88 = lerp( temp_output_99_0 , ( tex2DNode3 * temp_output_99_0 ) , _Glow_MultiplyWithDiffuse);
				float2 texCoord96 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float clampResult92 = clamp( pow( texCoord96.x , _GradientPower ) , 0.0 , 1.0 );
				float lerpResult91 = lerp( 1.0 , 0.0 , clampResult92);
				float4 lerpResult87 = lerp( lerpResult88 , ( lerpResult88 * lerpResult91 ) , _Glow_GradientMultiply);
				#ifdef _METALGLOWSSS_ON
				float4 staticSwitch85 = lerpResult87;
				#else
				float4 staticSwitch85 = temp_cast_13;
				#endif
				
				#ifdef _METALLICFROMTEX_ON
				float staticSwitch74 = tex2DNode72.r;
				#else
				float staticSwitch74 = _Metallic;
				#endif
				
				float lerpResult69 = lerp( _Roughness_A , _Roughness_B , tex2DNode3.a);
				float clampResult70 = clamp( lerpResult69 , 0.0 , 1.0 );
				

				float3 BaseColor = temp_output_49_0;
				float3 Normal = BlendNormal( unpack65 , unpack64 );
				float3 Emission = ( staticSwitch85 + float4( ( _FakeLighting_Night * temp_output_49_0 ) , 0.0 ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = staticSwitch74;
				float Smoothness = ( 1.0 - clampResult70 );
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
			#define _NORMALMAP 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
			#define _NORMALMAP 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
			#pragma shader_feature_local _FUZZYSHADING_ON
			#pragma shader_feature_local _METALGLOWSSS_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord6 : TEXCOORD6;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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
			sampler2D _Diffuse_Detail;
			sampler2D _Diffuse;
			sampler2D _MetallicGlow;
			sampler2D _GlowWave;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			
			inline float4 TriplanarSampling25( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			float3 WorldToAbsoluteWorld3_g578( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.texcoord0.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord6.xyz = ase_worldTangent;
				
				o.ase_texcoord4.xy = v.texcoord0.xy;
				o.ase_tangent = v.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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
				float4 ase_tangent : TANGENT;

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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
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

				float4 color5_g590 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g590 = normalize( color5_g590 );
				float4 transform43 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult44 = (float2(transform43.x , transform43.z));
				float dotResult4_g584 = dot( appendResult44 , float2( 12.9898,78.233 ) );
				float lerpResult10_g584 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g584 ) * 43758.55 ) ));
				float temp_output_48_0 = ( lerpResult10_g584 * ( _Variation_Hue * 0.1 ) );
				float lerpResult50 = lerp( _HueShift_A , _HueShift_B , temp_output_48_0);
				float3 temp_cast_1 = (0.0).xxx;
				float temp_output_1_0_g585 = _Diffuse_Detail_FadeDistance;
				float lerpResult38 = lerp( 1.0 , 0.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g585 ) / ( 0.0 - temp_output_1_0_g585 ) ) ));
				float2 texCoord19 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_cast_2 = (tex2D( _Diffuse_Detail, ( texCoord19 * 8.0 ) ).g).xxxx;
				float2 temp_cast_3 = (_Diffuse_Detail_WS_Scale).xx;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float4 triplanar25 = TriplanarSampling25( _Diffuse_Detail, WorldPosition, ase_worldNormal, 1.0, temp_cast_3, 1.0, 0 );
				#ifdef _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
				float4 staticSwitch27 = triplanar25;
				#else
				float4 staticSwitch27 = temp_cast_2;
				#endif
				float lerpResult32 = lerp( _Diffuse_Detail_Contrast_A , _Diffuse_Detail_Contrast_B , staticSwitch27.y);
				float clampResult36 = clamp( lerpResult32 , 0.0 , 1.0 );
				float clampResult41 = clamp( ( lerpResult38 + ( clampResult36 + _Diffuse_Detail_Add ) ) , 0.0 , 1.0 );
				float2 texCoord1 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode3 = tex2D( _Diffuse, texCoord1 );
				float3 desaturateInitialColor6 = tex2DNode3.rgb;
				float desaturateDot6 = dot( desaturateInitialColor6, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6 = lerp( desaturateInitialColor6, desaturateDot6.xxx, _Diffuse_Desaturation );
				float4 temp_output_4_0 = ( _Diffuse_Brightness * ( float4( desaturateVar6 , 0.0 ) * _Color ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 _Vector1 = float2(1,1);
				float4 appendResult18_g586 = (float4(_Vector1.x , _Vector1.y , ase_vface , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord6.xyz;
				float3 Binormal8_g587 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				float3x3 TBN10_g587 = float3x3(ase_worldTangent, Binormal8_g587, ase_worldNormal);
				float dotResult10_g586 = dot( ase_worldViewDir , mul( ( float4( float3( 0,0,1 ) , 0.0 ) * appendResult18_g586 ).xyz, TBN10_g587 ) );
				float clampResult9_g586 = clamp( dotResult10_g586 , 0.0 , 1.0 );
				float3 temp_output_23_0_g586 = temp_output_4_0.rgb;
				float3 desaturateInitialColor24_g586 = temp_output_23_0_g586;
				float desaturateDot24_g586 = dot( desaturateInitialColor24_g586, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24_g586 = lerp( desaturateInitialColor24_g586, desaturateDot24_g586.xxx, 0.5 );
				float clampResult5_g586 = clamp( ( pow( ( 1.0 - clampResult9_g586 ) , 6.0 ) * 0.8 ) , 0.0 , 1.0 );
				float3 lerpResult2_g586 = lerp( ( ( 1.0 - ( clampResult9_g586 * 0.8 ) ) * temp_output_23_0_g586 ) , ( desaturateVar24_g586 * float3( 1,1,1 ) ) , clampResult5_g586);
				float lerpResult15 = lerp( _FuzzyShading_A , _FuzzyShading_B , tex2DNode3.a);
				float4 lerpResult14 = lerp( temp_output_4_0 , float4( lerpResult2_g586 , 0.0 ) , lerpResult15);
				#ifdef _FUZZYSHADING_ON
				float4 staticSwitch13 = lerpResult14;
				#else
				float4 staticSwitch13 = temp_output_4_0;
				#endif
				float3 temp_output_3_0_g590 = ( clampResult41 * staticSwitch13 ).rgb;
				float3 rotatedValue2_g590 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g590, normalizeResult6_g590.rgb, lerpResult50 );
				float3 temp_output_49_0 = ( rotatedValue2_g590 + temp_output_3_0_g590 );
				
				float4 temp_cast_13 = (0.0).xxxx;
				float2 uv_MetallicGlow = IN.ase_texcoord4.xy * _MetallicGlow_ST.xy + _MetallicGlow_ST.zw;
				float4 tex2DNode72 = tex2D( _MetallicGlow, uv_MetallicGlow );
				float3 In3_g578 = WorldPosition;
				float3 localWorldToAbsoluteWorld3_g578 = WorldToAbsoluteWorld3_g578( In3_g578 );
				float3 break3_g577 = localWorldToAbsoluteWorld3_g578;
				float2 appendResult5_g577 = (float2(break3_g577.x , break3_g577.z));
				float2 temp_output_8_0_g577 = ( appendResult5_g577 * _Glow_World_Scale );
				float2 break5_g580 = temp_output_8_0_g577;
				float temp_output_11_0_g580 = _Glow_World_Speed;
				float2 appendResult1_g580 = (float2(( break5_g580.x + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_X ) ) ) , ( break5_g580.y + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_Y ) ) )));
				float2 break5_g579 = temp_output_8_0_g577;
				float temp_output_11_0_g579 = _Glow_World_Speed;
				float2 appendResult1_g579 = (float2(( break5_g579.x + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_X ) ) ) , ( break5_g579.y + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_Y ) ) )));
				float2 break5_g583 = temp_output_8_0_g577;
				float temp_output_11_0_g583 = _Glow_World_Speed;
				float2 appendResult1_g583 = (float2(( break5_g583.x + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_X ) ) ) , ( break5_g583.y + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_Y ) ) )));
				float2 break5_g582 = temp_output_8_0_g577;
				float temp_output_11_0_g582 = _Glow_World_Speed;
				float2 appendResult1_g582 = (float2(( break5_g582.x + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_X ) ) ) , ( break5_g582.y + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_Y ) ) )));
				float2 break5_g581 = temp_output_8_0_g577;
				float temp_output_11_0_g581 = _Glow_World_Speed;
				float2 appendResult1_g581 = (float2(( break5_g581.x + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_X ) ) ) , ( break5_g581.y + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_Y ) ) )));
				float lerpResult104 = lerp( _Glow_Amount , _GlowIntensity_Variation , temp_output_48_0);
				float4 temp_output_99_0 = ( ( tex2DNode72.g * _GlowColor ) * ( ( _Glow_Min_Amount + ( ( ( ( tex2D( _GlowWave, appendResult1_g580 ).g * tex2D( _GlowWave, appendResult1_g579 ).g ) + tex2D( _GlowWave, appendResult1_g583 ).g ) * ( tex2D( _GlowWave, appendResult1_g582 ).g + tex2D( _GlowWave, appendResult1_g581 ).g ) ) + 0.0 ) ) * lerpResult104 ) );
				float4 lerpResult88 = lerp( temp_output_99_0 , ( tex2DNode3 * temp_output_99_0 ) , _Glow_MultiplyWithDiffuse);
				float2 texCoord96 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float clampResult92 = clamp( pow( texCoord96.x , _GradientPower ) , 0.0 , 1.0 );
				float lerpResult91 = lerp( 1.0 , 0.0 , clampResult92);
				float4 lerpResult87 = lerp( lerpResult88 , ( lerpResult88 * lerpResult91 ) , _Glow_GradientMultiply);
				#ifdef _METALGLOWSSS_ON
				float4 staticSwitch85 = lerpResult87;
				#else
				float4 staticSwitch85 = temp_cast_13;
				#endif
				

				float3 BaseColor = temp_output_49_0;
				float3 Emission = ( staticSwitch85 + float4( ( _FakeLighting_Night * temp_output_49_0 ) , 0.0 ) ).rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
			#pragma shader_feature_local _FUZZYSHADING_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_tangent : TANGENT;
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
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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
			sampler2D _Diffuse_Detail;
			sampler2D _Diffuse;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			
			inline float4 TriplanarSampling25( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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
				float4 ase_tangent : TANGENT;

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
				o.ase_tangent = v.ase_tangent;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
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

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
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

				float4 color5_g590 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g590 = normalize( color5_g590 );
				float4 transform43 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult44 = (float2(transform43.x , transform43.z));
				float dotResult4_g584 = dot( appendResult44 , float2( 12.9898,78.233 ) );
				float lerpResult10_g584 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g584 ) * 43758.55 ) ));
				float temp_output_48_0 = ( lerpResult10_g584 * ( _Variation_Hue * 0.1 ) );
				float lerpResult50 = lerp( _HueShift_A , _HueShift_B , temp_output_48_0);
				float3 temp_cast_1 = (0.0).xxx;
				float temp_output_1_0_g585 = _Diffuse_Detail_FadeDistance;
				float lerpResult38 = lerp( 1.0 , 0.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g585 ) / ( 0.0 - temp_output_1_0_g585 ) ) ));
				float2 texCoord19 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_cast_2 = (tex2D( _Diffuse_Detail, ( texCoord19 * 8.0 ) ).g).xxxx;
				float2 temp_cast_3 = (_Diffuse_Detail_WS_Scale).xx;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float4 triplanar25 = TriplanarSampling25( _Diffuse_Detail, WorldPosition, ase_worldNormal, 1.0, temp_cast_3, 1.0, 0 );
				#ifdef _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
				float4 staticSwitch27 = triplanar25;
				#else
				float4 staticSwitch27 = temp_cast_2;
				#endif
				float lerpResult32 = lerp( _Diffuse_Detail_Contrast_A , _Diffuse_Detail_Contrast_B , staticSwitch27.y);
				float clampResult36 = clamp( lerpResult32 , 0.0 , 1.0 );
				float clampResult41 = clamp( ( lerpResult38 + ( clampResult36 + _Diffuse_Detail_Add ) ) , 0.0 , 1.0 );
				float2 texCoord1 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode3 = tex2D( _Diffuse, texCoord1 );
				float3 desaturateInitialColor6 = tex2DNode3.rgb;
				float desaturateDot6 = dot( desaturateInitialColor6, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6 = lerp( desaturateInitialColor6, desaturateDot6.xxx, _Diffuse_Desaturation );
				float4 temp_output_4_0 = ( _Diffuse_Brightness * ( float4( desaturateVar6 , 0.0 ) * _Color ) );
				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = normalize(ase_worldViewDir);
				float2 _Vector1 = float2(1,1);
				float4 appendResult18_g586 = (float4(_Vector1.x , _Vector1.y , ase_vface , 1.0));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 Binormal8_g587 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( ase_worldNormal , ase_worldTangent ) );
				float3x3 TBN10_g587 = float3x3(ase_worldTangent, Binormal8_g587, ase_worldNormal);
				float dotResult10_g586 = dot( ase_worldViewDir , mul( ( float4( float3( 0,0,1 ) , 0.0 ) * appendResult18_g586 ).xyz, TBN10_g587 ) );
				float clampResult9_g586 = clamp( dotResult10_g586 , 0.0 , 1.0 );
				float3 temp_output_23_0_g586 = temp_output_4_0.rgb;
				float3 desaturateInitialColor24_g586 = temp_output_23_0_g586;
				float desaturateDot24_g586 = dot( desaturateInitialColor24_g586, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24_g586 = lerp( desaturateInitialColor24_g586, desaturateDot24_g586.xxx, 0.5 );
				float clampResult5_g586 = clamp( ( pow( ( 1.0 - clampResult9_g586 ) , 6.0 ) * 0.8 ) , 0.0 , 1.0 );
				float3 lerpResult2_g586 = lerp( ( ( 1.0 - ( clampResult9_g586 * 0.8 ) ) * temp_output_23_0_g586 ) , ( desaturateVar24_g586 * float3( 1,1,1 ) ) , clampResult5_g586);
				float lerpResult15 = lerp( _FuzzyShading_A , _FuzzyShading_B , tex2DNode3.a);
				float4 lerpResult14 = lerp( temp_output_4_0 , float4( lerpResult2_g586 , 0.0 ) , lerpResult15);
				#ifdef _FUZZYSHADING_ON
				float4 staticSwitch13 = lerpResult14;
				#else
				float4 staticSwitch13 = temp_output_4_0;
				#endif
				float3 temp_output_3_0_g590 = ( clampResult41 * staticSwitch13 ).rgb;
				float3 rotatedValue2_g590 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g590, normalizeResult6_g590.rgb, lerpResult50 );
				float3 temp_output_49_0 = ( rotatedValue2_g590 + temp_output_3_0_g590 );
				

				float3 BaseColor = temp_output_49_0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

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
			#define _EMISSION
			#define _NORMALMAP 1
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
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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
			sampler2D _Normal;
			sampler2D _DetailNormal;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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

				float2 uv_Normal = IN.ase_texcoord5.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 unpack65 = UnpackNormalScale( tex2D( _Normal, uv_Normal ), _Normal_Amount );
				unpack65.z = lerp( 1, unpack65.z, saturate(_Normal_Amount) );
				float2 texCoord60 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack64 = UnpackNormalScale( tex2D( _DetailNormal, ( _Detail_Normal_Scale * texCoord60 ) ), _Detail_Normal__Amount );
				unpack64.z = lerp( 1, unpack64.z, saturate(_Detail_Normal__Amount) );
				

				float3 Normal = BlendNormal( unpack65 , unpack64 );
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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

			Blend One Zero, One Zero
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
			#define _EMISSION
			#define _NORMALMAP 1
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
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#pragma shader_feature_local _WIND_ON
			#pragma shader_feature_local _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
			#pragma shader_feature_local _FUZZYSHADING_ON
			#pragma shader_feature_local _METALGLOWSSS_ON
			#pragma shader_feature_local _METALLICFROMTEX_ON


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
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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
			sampler2D _Diffuse_Detail;
			sampler2D _Diffuse;
			sampler2D _Normal;
			sampler2D _DetailNormal;
			sampler2D _MetallicGlow;
			sampler2D _GlowWave;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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
			
			inline float4 TriplanarSampling25( sampler2D topTexMap, float3 worldPos, float3 worldNormal, float falloff, float2 tiling, float3 normalScale, float3 index )
			{
				float3 projNormal = ( pow( abs( worldNormal ), falloff ) );
				projNormal /= ( projNormal.x + projNormal.y + projNormal.z ) + 0.00001;
				float3 nsign = sign( worldNormal );
				half4 xNorm; half4 yNorm; half4 zNorm;
				xNorm = tex2D( topTexMap, tiling * worldPos.zy * float2(  nsign.x, 1.0 ) );
				yNorm = tex2D( topTexMap, tiling * worldPos.xz * float2(  nsign.y, 1.0 ) );
				zNorm = tex2D( topTexMap, tiling * worldPos.xy * float2( -nsign.z, 1.0 ) );
				return xNorm * projNormal.x + yNorm * projNormal.y + zNorm * projNormal.z;
			}
			
			float3 WorldToAbsoluteWorld3_g578( float3 In )
			{
				#if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
				    In += _WorldSpaceCameraPos.xyz;
				#endif
				return In;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_tangent = v.ase_tangent;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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
								, bool ase_vface : SV_IsFrontFace )
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

				float4 color5_g590 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 normalizeResult6_g590 = normalize( color5_g590 );
				float4 transform43 = mul(GetWorldToObjectMatrix(),float4( 0,0,0,1 ));
				float2 appendResult44 = (float2(transform43.x , transform43.z));
				float dotResult4_g584 = dot( appendResult44 , float2( 12.9898,78.233 ) );
				float lerpResult10_g584 = lerp( 0.0 , 1.0 , frac( ( sin( dotResult4_g584 ) * 43758.55 ) ));
				float temp_output_48_0 = ( lerpResult10_g584 * ( _Variation_Hue * 0.1 ) );
				float lerpResult50 = lerp( _HueShift_A , _HueShift_B , temp_output_48_0);
				float3 temp_cast_1 = (0.0).xxx;
				float temp_output_1_0_g585 = _Diffuse_Detail_FadeDistance;
				float lerpResult38 = lerp( 1.0 , 0.0 , saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g585 ) / ( 0.0 - temp_output_1_0_g585 ) ) ));
				float2 texCoord19 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 temp_cast_2 = (tex2D( _Diffuse_Detail, ( texCoord19 * 8.0 ) ).g).xxxx;
				float2 temp_cast_3 = (_Diffuse_Detail_WS_Scale).xx;
				float4 triplanar25 = TriplanarSampling25( _Diffuse_Detail, WorldPosition, WorldNormal, 1.0, temp_cast_3, 1.0, 0 );
				#ifdef _DIFFUSE_DETAIL_IS_WORLDSPACE_ON
				float4 staticSwitch27 = triplanar25;
				#else
				float4 staticSwitch27 = temp_cast_2;
				#endif
				float lerpResult32 = lerp( _Diffuse_Detail_Contrast_A , _Diffuse_Detail_Contrast_B , staticSwitch27.y);
				float clampResult36 = clamp( lerpResult32 , 0.0 , 1.0 );
				float clampResult41 = clamp( ( lerpResult38 + ( clampResult36 + _Diffuse_Detail_Add ) ) , 0.0 , 1.0 );
				float2 texCoord1 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 tex2DNode3 = tex2D( _Diffuse, texCoord1 );
				float3 desaturateInitialColor6 = tex2DNode3.rgb;
				float desaturateDot6 = dot( desaturateInitialColor6, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar6 = lerp( desaturateInitialColor6, desaturateDot6.xxx, _Diffuse_Desaturation );
				float4 temp_output_4_0 = ( _Diffuse_Brightness * ( float4( desaturateVar6 , 0.0 ) * _Color ) );
				float2 _Vector1 = float2(1,1);
				float4 appendResult18_g586 = (float4(_Vector1.x , _Vector1.y , ase_vface , 1.0));
				float3 Binormal8_g587 = ( ( IN.ase_tangent.w > 0.0 ? 1.0 : -1.0 ) * cross( WorldNormal , WorldTangent ) );
				float3x3 TBN10_g587 = float3x3(WorldTangent, Binormal8_g587, WorldNormal);
				float dotResult10_g586 = dot( WorldViewDirection , mul( ( float4( float3( 0,0,1 ) , 0.0 ) * appendResult18_g586 ).xyz, TBN10_g587 ) );
				float clampResult9_g586 = clamp( dotResult10_g586 , 0.0 , 1.0 );
				float3 temp_output_23_0_g586 = temp_output_4_0.rgb;
				float3 desaturateInitialColor24_g586 = temp_output_23_0_g586;
				float desaturateDot24_g586 = dot( desaturateInitialColor24_g586, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24_g586 = lerp( desaturateInitialColor24_g586, desaturateDot24_g586.xxx, 0.5 );
				float clampResult5_g586 = clamp( ( pow( ( 1.0 - clampResult9_g586 ) , 6.0 ) * 0.8 ) , 0.0 , 1.0 );
				float3 lerpResult2_g586 = lerp( ( ( 1.0 - ( clampResult9_g586 * 0.8 ) ) * temp_output_23_0_g586 ) , ( desaturateVar24_g586 * float3( 1,1,1 ) ) , clampResult5_g586);
				float lerpResult15 = lerp( _FuzzyShading_A , _FuzzyShading_B , tex2DNode3.a);
				float4 lerpResult14 = lerp( temp_output_4_0 , float4( lerpResult2_g586 , 0.0 ) , lerpResult15);
				#ifdef _FUZZYSHADING_ON
				float4 staticSwitch13 = lerpResult14;
				#else
				float4 staticSwitch13 = temp_output_4_0;
				#endif
				float3 temp_output_3_0_g590 = ( clampResult41 * staticSwitch13 ).rgb;
				float3 rotatedValue2_g590 = RotateAroundAxis( temp_cast_1, temp_output_3_0_g590, normalizeResult6_g590.rgb, lerpResult50 );
				float3 temp_output_49_0 = ( rotatedValue2_g590 + temp_output_3_0_g590 );
				
				float2 uv_Normal = IN.ase_texcoord8.xy * _Normal_ST.xy + _Normal_ST.zw;
				float3 unpack65 = UnpackNormalScale( tex2D( _Normal, uv_Normal ), _Normal_Amount );
				unpack65.z = lerp( 1, unpack65.z, saturate(_Normal_Amount) );
				float2 texCoord60 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack64 = UnpackNormalScale( tex2D( _DetailNormal, ( _Detail_Normal_Scale * texCoord60 ) ), _Detail_Normal__Amount );
				unpack64.z = lerp( 1, unpack64.z, saturate(_Detail_Normal__Amount) );
				
				float4 temp_cast_13 = (0.0).xxxx;
				float2 uv_MetallicGlow = IN.ase_texcoord8.xy * _MetallicGlow_ST.xy + _MetallicGlow_ST.zw;
				float4 tex2DNode72 = tex2D( _MetallicGlow, uv_MetallicGlow );
				float3 In3_g578 = WorldPosition;
				float3 localWorldToAbsoluteWorld3_g578 = WorldToAbsoluteWorld3_g578( In3_g578 );
				float3 break3_g577 = localWorldToAbsoluteWorld3_g578;
				float2 appendResult5_g577 = (float2(break3_g577.x , break3_g577.z));
				float2 temp_output_8_0_g577 = ( appendResult5_g577 * _Glow_World_Scale );
				float2 break5_g580 = temp_output_8_0_g577;
				float temp_output_11_0_g580 = _Glow_World_Speed;
				float2 appendResult1_g580 = (float2(( break5_g580.x + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_X ) ) ) , ( break5_g580.y + ( _TimeParameters.x * ( temp_output_11_0_g580 * _GlowWave_1_Speed_Y ) ) )));
				float2 break5_g579 = temp_output_8_0_g577;
				float temp_output_11_0_g579 = _Glow_World_Speed;
				float2 appendResult1_g579 = (float2(( break5_g579.x + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_X ) ) ) , ( break5_g579.y + ( _TimeParameters.x * ( temp_output_11_0_g579 * _GlowWave_2_Speed_Y ) ) )));
				float2 break5_g583 = temp_output_8_0_g577;
				float temp_output_11_0_g583 = _Glow_World_Speed;
				float2 appendResult1_g583 = (float2(( break5_g583.x + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_X ) ) ) , ( break5_g583.y + ( _TimeParameters.x * ( temp_output_11_0_g583 * _GlowWave_3_Speed_Y ) ) )));
				float2 break5_g582 = temp_output_8_0_g577;
				float temp_output_11_0_g582 = _Glow_World_Speed;
				float2 appendResult1_g582 = (float2(( break5_g582.x + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_X ) ) ) , ( break5_g582.y + ( _TimeParameters.x * ( temp_output_11_0_g582 * _GlowWave_4_Speed_Y ) ) )));
				float2 break5_g581 = temp_output_8_0_g577;
				float temp_output_11_0_g581 = _Glow_World_Speed;
				float2 appendResult1_g581 = (float2(( break5_g581.x + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_X ) ) ) , ( break5_g581.y + ( _TimeParameters.x * ( temp_output_11_0_g581 * _GlowWave_5_Speed_Y ) ) )));
				float lerpResult104 = lerp( _Glow_Amount , _GlowIntensity_Variation , temp_output_48_0);
				float4 temp_output_99_0 = ( ( tex2DNode72.g * _GlowColor ) * ( ( _Glow_Min_Amount + ( ( ( ( tex2D( _GlowWave, appendResult1_g580 ).g * tex2D( _GlowWave, appendResult1_g579 ).g ) + tex2D( _GlowWave, appendResult1_g583 ).g ) * ( tex2D( _GlowWave, appendResult1_g582 ).g + tex2D( _GlowWave, appendResult1_g581 ).g ) ) + 0.0 ) ) * lerpResult104 ) );
				float4 lerpResult88 = lerp( temp_output_99_0 , ( tex2DNode3 * temp_output_99_0 ) , _Glow_MultiplyWithDiffuse);
				float2 texCoord96 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float clampResult92 = clamp( pow( texCoord96.x , _GradientPower ) , 0.0 , 1.0 );
				float lerpResult91 = lerp( 1.0 , 0.0 , clampResult92);
				float4 lerpResult87 = lerp( lerpResult88 , ( lerpResult88 * lerpResult91 ) , _Glow_GradientMultiply);
				#ifdef _METALGLOWSSS_ON
				float4 staticSwitch85 = lerpResult87;
				#else
				float4 staticSwitch85 = temp_cast_13;
				#endif
				
				#ifdef _METALLICFROMTEX_ON
				float staticSwitch74 = tex2DNode72.r;
				#else
				float staticSwitch74 = _Metallic;
				#endif
				
				float lerpResult69 = lerp( _Roughness_A , _Roughness_B , tex2DNode3.a);
				float clampResult70 = clamp( lerpResult69 , 0.0 , 1.0 );
				

				float3 BaseColor = temp_output_49_0;
				float3 Normal = BlendNormal( unpack65 , unpack64 );
				float3 Emission = ( staticSwitch85 + float4( ( _FakeLighting_Night * temp_output_49_0 ) , 0.0 ) ).rgb;
				float3 Specular = 0.5;
				float Metallic = staticSwitch74;
				float Smoothness = ( 1.0 - clampResult70 );
				float Occlusion = 1;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
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
			#define _EMISSION
			#define _NORMALMAP 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
			#define _EMISSION
			#define _NORMALMAP 1
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _GlowColor;
			float4 _MetallicGlow_ST;
			float4 _WindMask_ST;
			float4 _Normal_ST;
			float4 _Color;
			float _GlowWave_1_Speed_X;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_4_Speed_X;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _Glow_Amount;
			float _GlowIntensity_Variation;
			float _Glow_MultiplyWithDiffuse;
			float _GradientPower;
			float _Glow_GradientMultiply;
			float _FakeLighting_Night;
			float _Metallic;
			float _Glow_World_Speed;
			float _Glow_World_Scale;
			float _Wind_Speed;
			float _Roughness_A;
			float _Wind_Weight;
			float _Wind_Intensity;
			float _HueShift_A;
			float _HueShift_B;
			float _Variation_Hue;
			float _Diffuse_Detail_FadeDistance;
			float _Diffuse_Detail_Contrast_A;
			float _Diffuse_Detail_Contrast_B;
			float _Diffuse_Detail_WS_Scale;
			float _Diffuse_Detail_Add;
			float _Diffuse_Brightness;
			float _Diffuse_Desaturation;
			float _FuzzyShading_A;
			float _FuzzyShading_B;
			float _Normal_Amount;
			float _Detail_Normal_Scale;
			float _Detail_Normal__Amount;
			float _Glow_Min_Amount;
			float _Roughness_B;
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

			float3 WorldToAbsoluteWorld3_g589( float3 In )
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

				float3 temp_cast_0 = (0.0).xxx;
				float4 _0101 = float4(0,1,0,1);
				float3 appendResult13_g588 = (float3(_0101.x , _0101.y , _0101.z));
				float3 normalizeResult14_g588 = normalize( appendResult13_g588 );
				float3 temp_cast_1 = (3.0).xxx;
				float temp_output_19_0_g588 = ( _0101.w * ( ( _TimeParameters.x * _Wind_Speed ) * -0.5 ) );
				float3 ase_worldPos = TransformObjectToWorld( (v.vertex).xyz );
				float3 In3_g589 = ase_worldPos;
				float3 localWorldToAbsoluteWorld3_g589 = WorldToAbsoluteWorld3_g589( In3_g589 );
				float3 temp_output_62_0_g588 = localWorldToAbsoluteWorld3_g589;
				float3 temp_output_45_0_g588 = abs( ( ( frac( ( ( ( normalizeResult14_g588 * temp_output_19_0_g588 ) + ( temp_output_62_0_g588 / 10.24 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float dotResult58_g588 = dot( normalizeResult14_g588 , ( ( ( temp_cast_1 - ( temp_output_45_0_g588 * 2.0 ) ) * temp_output_45_0_g588 ) * temp_output_45_0_g588 ) );
				float3 temp_cast_2 = (3.0).xxx;
				float3 temp_output_46_0_g588 = abs( ( ( frac( ( ( temp_output_19_0_g588 + ( temp_output_62_0_g588 / 2.0 ) ) + 0.5 ) ) * 2.0 ) + -1.0 ) );
				float3 temp_cast_3 = (0.0).xxx;
				float3 temp_cast_4 = (0.0).xxx;
				float3 temp_output_8_0_g588 = temp_cast_4;
				float3 rotatedValue6_g588 = RotateAroundAxis( ( float3(0,0,-10) + temp_output_8_0_g588 ), temp_output_8_0_g588, cross( normalizeResult14_g588 , float3(0,0,1) ), ( dotResult58_g588 + distance( ( ( ( temp_cast_2 - ( temp_output_46_0_g588 * 2.0 ) ) * temp_output_46_0_g588 ) * temp_output_46_0_g588 ) , temp_cast_3 ) ) );
				float2 uv_WindMask = v.ase_texcoord.xy * _WindMask_ST.xy + _WindMask_ST.zw;
				float3 lerpResult82 = lerp( float3( 0,0,0 ) , ( ( ( rotatedValue6_g588 * _Wind_Weight ) * _Wind_Intensity ) + temp_output_8_0_g588 ) , tex2Dlod( _WindMask, float4( uv_WindMask, 0, 0.0) ).g);
				#ifdef _WIND_ON
				float3 staticSwitch75 = lerpResult82;
				#else
				float3 staticSwitch75 = temp_cast_0;
				#endif
				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = staticSwitch75;

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

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

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
Node;AmplifyShaderEditor.RangedFloatNode;20;-2550.008,-469.3211;Inherit;False;Constant;_Diffuse_Detail_Scale;Diffuse_Detail_Scale;13;0;Create;True;0;0;0;False;0;False;8;8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;19;-2557.312,-595.7115;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;23;-2527.492,-705.2986;Inherit;False;Property;_Diffuse_Detail_WS_Scale;Diffuse_Detail_WS_Scale;6;0;Create;True;0;0;0;False;0;False;20;1.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;22;-2557.151,-944.088;Inherit;True;Property;_Diffuse_Detail;Diffuse_Detail;0;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;21;-2322.312,-594.7117;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldToObjectTransfNode;43;-2477.476,741.2552;Inherit;False;1;0;FLOAT4;0,0,0,1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;24;-2140.996,-799.225;Inherit;True;Property;_T_Default_MacroVariation;T_Default_MacroVariation;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TriplanarNode;25;-2233.991,-1010.121;Inherit;True;Spherical;World;False;Top Texture 0;_TopTexture0;white;-1;None;Mid Texture 0;_MidTexture0;white;-1;None;Bot Texture 0;_BotTexture0;white;-1;None;Triplanar Sampler;Tangent;10;0;SAMPLER2D;;False;5;FLOAT;1;False;1;SAMPLER2D;;False;6;FLOAT;0;False;2;SAMPLER2D;;False;7;FLOAT;0;False;9;FLOAT3;0,0,0;False;8;FLOAT;1;False;3;FLOAT2;1,1;False;4;FLOAT;1;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;45;-2290.156,890.3496;Inherit;False;Property;_Variation_Hue;Variation_Hue;12;0;Create;True;0;0;0;False;0;False;0;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;44;-2294.625,777.5302;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;1;-2189.119,-400.6302;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;111;-2294.594,452.2688;Inherit;False;MF_WorldGlowWave;33;;577;11a141a9288bc824f8e394d2132c9683;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;-1972.421,-431.1359;Inherit;True;Property;_Diffuse;Diffuse;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;47;-2157.07,777.285;Inherit;False;Random Range;-1;;584;7b754edb8aebbfb4a9ace907af661cfc;0;3;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;27;-1820.208,-890.3542;Inherit;False;Property;_Diffuse_Detail_is_WorldSpace;Diffuse_Detail_is_WorldSpace;5;0;Create;True;0;0;0;False;0;False;0;1;1;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.WorldSpaceCameraPos;113;-1969.939,-1388.371;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;46;-2112.614,894.435;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0.1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1880.497,-228.0421;Inherit;False;Property;_Diffuse_Desaturation;Diffuse_Desaturation;10;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.WorldPosInputsNode;114;-1906.195,-1233.319;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.RangedFloatNode;31;-1616.174,-1012.855;Inherit;False;Property;_Diffuse_Detail_Contrast_B;Diffuse_Detail_Contrast_B;3;0;Create;True;0;0;0;False;0;False;3;3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;48;-1969.691,841.682;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BreakToComponentsNode;28;-1489.172,-885.8548;Inherit;False;FLOAT4;1;0;FLOAT4;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.DesaturateOpNode;6;-1635.186,-426.7149;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1610.174,-1129.854;Inherit;False;Property;_Diffuse_Detail_Contrast_A;Diffuse_Detail_Contrast_A;2;0;Create;True;0;0;0;False;0;False;-2.5;-2.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;107;-2085.161,371.095;Inherit;False;Property;_Glow_Min_Amount;Glow_Min_Amount;28;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;108;-2013.354,451.8775;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;118;-1901.972,-603.4883;Inherit;False;Property;_Color;Color;7;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;105;-2015.143,578.5697;Inherit;False;Property;_Glow_Amount;Glow_Amount;27;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;112;-1606.748,-1293.64;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1738.573,-1410.145;Inherit;False;Property;_Diffuse_Detail_FadeDistance;Diffuse_Detail_FadeDistance;4;0;Create;True;0;0;0;False;0;False;5;1000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;106;-2075.236,650.0655;Inherit;False;Property;_GlowIntensity_Variation;GlowIntensity_Variation;29;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;32;-1332.173,-1029.855;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2;-1480.321,-529.6996;Inherit;False;Property;_Diffuse_Brightness;Diffuse_Brightness;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;117;-1397.036,-458.0834;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;102;-1889.488,277.6795;Inherit;False;Property;_GlowColor;GlowColor;26;0;Create;True;0;0;0;False;0;False;0,0.1529412,1,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;104;-1811.544,618.1697;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;103;-1793.944,446.1697;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;115;-1430.7,-1386.649;Inherit;False;Inverse Lerp;-1;;585;09cbe79402f023141a4dc1fddd4c9511;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;72;-1966.074,8.573625;Inherit;True;Property;_MetallicGlow;MetallicGlow;22;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;4;-1245.7,-448.5185;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SaturateNode;116;-1260.141,-1381.48;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;96;-1066.107,367.498;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;100;-1607.129,243.3631;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;36;-1161.595,-1029.612;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;37;-1217.086,-911.6966;Inherit;False;Property;_Diffuse_Detail_Add;Diffuse_Detail_Add;1;0;Create;True;0;0;0;False;0;False;0.5;0.85;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;16;-1140.592,-183.8974;Inherit;False;Property;_FuzzyShading_A;FuzzyShading_A;48;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;18;-1141.861,-110.2681;Inherit;False;Property;_FuzzyShading_B;FuzzyShading_B;49;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;94;-1019.255,494.2149;Inherit;False;Property;_GradientPower;GradientPower;32;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;101;-1607.237,344.1783;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;38;-1052.531,-1241.703;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;93;-846.7493,453.7506;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;55;-1072.301,-400.9565;Inherit;False;FuzzeShadingGrass;-1;;586;1ccb3966757eaec4598b29194a98629c;0;7;23;FLOAT3;1,1,1;False;11;FLOAT3;0,0,1;False;25;FLOAT;0.5;False;26;FLOAT3;1,1,1;False;28;FLOAT;0.8;False;27;FLOAT;6;False;20;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleAddOpNode;39;-1006.214,-1027.083;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;99;-1474.432,290.6539;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;15;-937.4769,-175.0111;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;98;-675.8513,206.4243;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;92;-684.8927,453.7507;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-796.0568,345.3051;Inherit;False;Property;_Glow_MultiplyWithDiffuse;Glow_MultiplyWithDiffuse;30;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;40;-870.0861,-1110.696;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;14;-754.0702,-252.9745;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;41;-742.086,-1111.696;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;52;-488.5076,-747.166;Inherit;False;Property;_HueShift_B;HueShift_B;14;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-487.5076,-820.1661;Inherit;False;Property;_HueShift_A;HueShift_A;13;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;91;-538.5563,372.3878;Inherit;False;3;0;FLOAT;1;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;13;-606.4174,-493.2417;Inherit;False;Property;_FuzzyShading;FuzzyShading;47;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;88;-483.6007,254.5517;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;60;-414.7384,-1124.82;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;77;-166.9889,578.4836;Inherit;False;Property;_Wind_Intensity;Wind_Intensity;52;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-151.7843,788.7085;Inherit;False;Constant;_float0;float0;43;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;78;-160.9889,644.4836;Inherit;False;Property;_Wind_Weight;Wind_Weight;54;0;Create;True;0;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;50;-294.4033,-788.9406;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;67;-1646.778,-119.4331;Inherit;False;Property;_Roughness_A;Roughness_A;24;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;42;-319.9754,-621.7061;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;68;-1643.601,-47.71369;Inherit;False;Property;_Roughness_B;Roughness_B;25;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;-320.174,347.6867;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;76;-159.9889,714.4835;Inherit;False;Property;_Wind_Speed;Wind_Speed;53;0;Create;True;0;0;0;False;0;False;0.1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-405.926,434.1704;Inherit;False;Property;_Glow_GradientMultiply;Glow_GradientMultiply;31;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;-402.0094,-1200.66;Inherit;False;Property;_Detail_Normal_Scale;Detail_Normal_Scale;19;0;Create;True;0;0;0;False;0;False;5;30;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-368.7003,-1344.306;Inherit;False;Property;_Normal_Amount;Normal_Amount;16;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;69;-1439.033,-100.5072;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;56;-44.47125,-683.609;Inherit;False;Property;_FakeLighting_Night;FakeLighting_Night;11;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;81;52.27471,593.1976;Inherit;False;SimpleGrassWind;-1;;588;2f5588d2087aaab40a4d9a662ffe0ccd;0;4;5;FLOAT;0;False;7;FLOAT;0;False;23;FLOAT;1;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.FunctionNode;49;-136.2077,-786.4662;Inherit;False;HueShift;-1;;590;3748b6194161e1143a6905ade0b83f9a;0;2;1;FLOAT;0;False;3;FLOAT3;0,1,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;83;-127.1743,484.94;Inherit;False;Constant;_zero;zero;32;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-409.4301,-1001.272;Inherit;False;Property;_Detail_Normal__Amount;Detail_Normal__Amount;18;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;87;-152.502,254.6127;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;61;-196.6074,-1196.76;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;80;20.01117,757.4835;Inherit;True;Property;_WindMask;WindMask;51;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;73;279.0906,-74.77648;Inherit;False;Property;_Metallic;Metallic;23;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;82;347.0524,641.2226;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SamplerNode;65;-52.16121,-1413.033;Inherit;True;Property;_Normal;Normal;15;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;58;221.0783,-808.3912;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.ClampOpNode;70;-1273.007,-90.32206;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;64;-52.10725,-1226.074;Inherit;True;Property;_DetailNormal;DetailNormal;17;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.StaticSwitch;85;45.4791,220.3717;Inherit;False;Property;_MetalGlowSSS;MetalGlowSSS;21;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;71;-993.3604,-16.89336;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;57;420.9521,-386.1409;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;74;439.7777,-63.03357;Inherit;False;Property;_MetallicFromTex;MetallicFromTex;20;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;66;261.8898,-1409.219;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;75;559.9774,489.1743;Inherit;False;Property;_Wind;Wind;50;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;119;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;120;814.6988,-319.1255;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;Davis3D/AlienPlants_Vol3/Nature/Plants;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;41;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;121;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;122;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;123;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;124;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;125;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;126;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;127;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;128;814.6988,-319.1255;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
WireConnection;21;0;19;0
WireConnection;21;1;20;0
WireConnection;24;0;22;0
WireConnection;24;1;21;0
WireConnection;24;7;22;1
WireConnection;25;0;22;0
WireConnection;25;3;23;0
WireConnection;44;0;43;1
WireConnection;44;1;43;3
WireConnection;3;1;1;0
WireConnection;47;1;44;0
WireConnection;27;1;24;2
WireConnection;27;0;25;0
WireConnection;46;0;45;0
WireConnection;48;0;47;0
WireConnection;48;1;46;0
WireConnection;28;0;27;0
WireConnection;6;0;3;0
WireConnection;6;1;11;0
WireConnection;108;0;111;0
WireConnection;112;0;113;0
WireConnection;112;1;114;0
WireConnection;32;0;29;0
WireConnection;32;1;31;0
WireConnection;32;2;28;1
WireConnection;117;0;6;0
WireConnection;117;1;118;0
WireConnection;104;0;105;0
WireConnection;104;1;106;0
WireConnection;104;2;48;0
WireConnection;103;0;107;0
WireConnection;103;1;108;0
WireConnection;115;1;33;0
WireConnection;115;3;112;0
WireConnection;4;0;2;0
WireConnection;4;1;117;0
WireConnection;116;0;115;0
WireConnection;100;0;72;2
WireConnection;100;1;102;0
WireConnection;36;0;32;0
WireConnection;101;0;103;0
WireConnection;101;1;104;0
WireConnection;38;2;116;0
WireConnection;93;0;96;1
WireConnection;93;1;94;0
WireConnection;55;23;4;0
WireConnection;39;0;36;0
WireConnection;39;1;37;0
WireConnection;99;0;100;0
WireConnection;99;1;101;0
WireConnection;15;0;16;0
WireConnection;15;1;18;0
WireConnection;15;2;3;4
WireConnection;98;0;3;0
WireConnection;98;1;99;0
WireConnection;92;0;93;0
WireConnection;40;0;38;0
WireConnection;40;1;39;0
WireConnection;14;0;4;0
WireConnection;14;1;55;0
WireConnection;14;2;15;0
WireConnection;41;0;40;0
WireConnection;91;2;92;0
WireConnection;13;1;4;0
WireConnection;13;0;14;0
WireConnection;88;0;99;0
WireConnection;88;1;98;0
WireConnection;88;2;97;0
WireConnection;50;0;51;0
WireConnection;50;1;52;0
WireConnection;50;2;48;0
WireConnection;42;0;41;0
WireConnection;42;1;13;0
WireConnection;89;0;88;0
WireConnection;89;1;91;0
WireConnection;69;0;67;0
WireConnection;69;1;68;0
WireConnection;69;2;3;4
WireConnection;81;5;77;0
WireConnection;81;7;78;0
WireConnection;81;23;76;0
WireConnection;81;8;79;0
WireConnection;49;1;50;0
WireConnection;49;3;42;0
WireConnection;87;0;88;0
WireConnection;87;1;89;0
WireConnection;87;2;90;0
WireConnection;61;0;59;0
WireConnection;61;1;60;0
WireConnection;82;1;81;0
WireConnection;82;2;80;2
WireConnection;65;5;63;0
WireConnection;58;0;56;0
WireConnection;58;1;49;0
WireConnection;70;0;69;0
WireConnection;64;1;61;0
WireConnection;64;5;62;0
WireConnection;85;1;83;0
WireConnection;85;0;87;0
WireConnection;71;0;70;0
WireConnection;57;0;85;0
WireConnection;57;1;58;0
WireConnection;74;1;73;0
WireConnection;74;0;72;1
WireConnection;66;0;65;0
WireConnection;66;1;64;0
WireConnection;75;1;83;0
WireConnection;75;0;82;0
WireConnection;120;0;49;0
WireConnection;120;1;66;0
WireConnection;120;2;57;0
WireConnection;120;3;74;0
WireConnection;120;4;71;0
WireConnection;120;8;75;0
ASEEND*/
//CHKSM=73418BFE795A342C7908BA63044FB18C983BDA55