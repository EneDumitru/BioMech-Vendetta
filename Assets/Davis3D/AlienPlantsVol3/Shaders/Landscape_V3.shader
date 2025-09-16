// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Davis3D/AlienPlants_Vol3/Enviroment/Landscape_V3"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		_Color("Color", Color) = (1,1,1,1)
		_Brightness("Brightness", Float) = 1
		_Contrast("Contrast", Float) = 0
		_Desaturation("Desaturation", Float) = 0
		_Dirt_A_Dif("Dirt_A_Dif", 2D) = "white" {}
		_Dirt_A_Scale("Dirt_A_Scale", Float) = 4
		_Macro_Multiplier("Macro_Multiplier", 2D) = "white" {}
		_Dirt_A_Norm("Dirt_A_Norm", 2D) = "bump" {}
		_Dirt_A_Norm2_Scale("Dirt_A_Norm2_Scale", Float) = 5
		_Dirt_A_Metal_A("Dirt_A_Metal_A", Range( -1 , 1)) = -0.3200632
		_Dirt_A_Metal_B("Dirt_A_Metal_B", Range( -1 , 1)) = 1
		_Dirt_A_Rough_A("Dirt_A_Rough_A", Float) = 0
		_Dirt_A_Rough_B("Dirt_A_Rough_B", Float) = 1
		_Dirt_A_Rough_Distance("Dirt_A_Rough_Distance", Float) = 1
		_Dirt_A_Spec("Dirt_A_Spec", 2D) = "gray" {}
		_Fuzzy_EdgeColor("Fuzzy_EdgeColor", Color) = (1,1,1,1)
		_FuzzyShading_CoreDarkness("FuzzyShading_CoreDarkness", Float) = 0.8
		_FuzzyShading_Power("FuzzyShading_Power", Float) = 6
		_FuzzyShading_EdgeBrightness("FuzzyShading_EdgeBrightness", Float) = 0.8
		_WeightMapScale("WeightMapScale", Float) = 1
		_Dirt_Glow("Dirt_Glow", 2D) = "white" {}
		_Dirt_Plain("Dirt_Plain", 2D) = "white" {}
		_GlowWave("GlowWave", 2D) = "white" {}
		_GlowColor("GlowColor", Color) = (0,0.6745098,1,1)
		_DistanceColor("DistanceColor", Color) = (0.8962264,0.8512375,0.5191349,1)
		_Glow_Amount("Glow_Amount", Float) = 3
		_Glow_MASTER_SCALE("Glow_MASTER_SCALE", Float) = 400
		_Glow_DistanceOffset("Glow_DistanceOffset", Float) = 5
		_DistanceBrightness("DistanceBrightness", Float) = 1
		_DistanceBrightnessToggle("DistanceBrightnessToggle", Float) = 0
		_Glow_DistanceFade("Glow_DistanceFade", Float) = 25
		_Glow_Multiplier_Close("Glow_Multiplier_Close", Float) = 0.3
		_Glow_Multiplier_Far("Glow_Multiplier_Far", Float) = 1
		_GlowWaveSpeed("GlowWaveSpeed", Float) = 5000
		_GlowWave_1_Scale("GlowWave_1_Scale", Float) = 0.01
		_GlowWave_2_Scale("GlowWave_2_Scale", Float) = 0.015
		_GlowWave_3_Scale("GlowWave_3_Scale", Float) = 0.08
		_GlowWave_4_Scale("GlowWave_4_Scale", Float) = 0.25
		_GlowWave_5_Scale("GlowWave_5_Scale", Float) = 0.003
		_GlowWave_1_Speed_X("GlowWave_1_Speed_X", Float) = -0.05
		_GlowWave_2_Speed_X("GlowWave_2_Speed_X", Float) = 0.005
		_GlowWave_3_Speed_X("GlowWave_3_Speed_X", Float) = 0.02
		_GlowWave_4_Speed_X("GlowWave_4_Speed_X", Float) = 0.2
		_GlowWave_5_Speed_X("GlowWave_5_Speed_X", Float) = 0.006
		_GlowWave_1_Speed_Y("GlowWave_1_Speed_Y", Float) = 0.01
		_GlowWave_2_Speed_Y("GlowWave_2_Speed_Y", Float) = -0.01
		_GlowWave_3_Speed_Y("GlowWave_3_Speed_Y", Float) = 0.005
		_GlowWave_4_Speed_Y("GlowWave_4_Speed_Y", Float) = -0.002
		_GlowWave_5_Speed_Y("GlowWave_5_Speed_Y", Float) = 0.001
		_Macro_Distance("Macro_Distance", Float) = 1000
		_Macro_Multiplier_A("Macro_Multiplier_A", Float) = 0
		_Macro_Multiplier_B("Macro_Multiplier_B", Float) = 1
		_Macro_Multiplier_Scale("Macro_Multiplier_Scale", Float) = 0.4
		_Macro_Norm2_Scale("Macro_Norm2_Scale", Float) = 0.1
		_Macro_Norm("Macro_Norm", 2D) = "bump" {}
		_Macro_Norm_Amount("Macro_Norm_Amount", Float) = 1
		_Macro_Scale_Dif("Macro_Scale_Dif", Float) = 0.2


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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION


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
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			sampler2D _Macro_Multiplier;
			sampler2D _Dirt_A_Dif;
			sampler2D _Dirt_A_Norm;
			sampler2D _Macro_Norm;
			sampler2D _Dirt_Glow;
			sampler2D _Dirt_Plain;
			sampler2D _GlowWave;
			sampler2D _Dirt_A_Spec;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 MyCustomExpression73( float Dirt_GlowWeight, float Dirt_PlainWeight, float3 Dirt_Glow, float Dirt_Plain )
			{
				float  lerpres;
				float  Local0;
				float  AllWeightsAndHeights = Dirt_GlowWeight.r + Dirt_PlainWeight.r + 0;
				float  Divider = ( 1.0 / AllWeightsAndHeights );
				float3  Layer0Contribution = Divider.rrr * Dirt_GlowWeight.rrr * Dirt_Glow;
				float3  Layer1Contribution = Divider.rrr * Dirt_PlainWeight.rrr * Dirt_Plain;
				float3  Result = Layer0Contribution + Layer1Contribution + float3(0,0,0);
				return Result;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord8.z = eyeDepth;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float3 appendResult2_g685 = (float3(1.0 , 1.0 , ase_vface));
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir10_g685 = mul( ase_tangentToWorldFast, ( float3( 0,0,1 ) * appendResult2_g685 ) );
				float dotResult12_g685 = dot( WorldViewDirection , tangentToWorldDir10_g685 );
				float clampResult13_g685 = clamp( dotResult12_g685 , 0.0 , 1.0 );
				float2 texCoord44 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_39_0 = ( ( ( float2( 0.001982,0.001982 ) + texCoord44 ) * float2( 1009,1009 ) ) * _Dirt_A_Scale );
				float lerpResult32 = lerp( _Macro_Multiplier_A , _Macro_Multiplier_B , tex2D( _Macro_Multiplier, ( temp_output_39_0 * _Macro_Multiplier_Scale ) ).g);
				float4 tex2DNode48 = tex2D( _Dirt_A_Dif, temp_output_39_0 );
				float temp_output_1_0_g686 = 0.0;
				float temp_output_299_0 = saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g686 ) / ( _Macro_Distance - temp_output_1_0_g686 ) ) );
				float4 lerpResult31 = lerp( tex2DNode48 , tex2D( _Dirt_A_Dif, ( temp_output_39_0 * _Macro_Scale_Dif ) ) , temp_output_299_0);
				float3 desaturateInitialColor24 = CalculateContrast(_Contrast,( ( _Color * ( lerpResult32 * lerpResult31 ) ) * _Brightness )).rgb;
				float desaturateDot24 = dot( desaturateInitialColor24, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24 = lerp( desaturateInitialColor24, desaturateDot24.xxx, _Desaturation );
				float3 temp_output_26_0_g685 = desaturateVar24;
				float3 desaturateInitialColor27_g685 = temp_output_26_0_g685;
				float desaturateDot27_g685 = dot( desaturateInitialColor27_g685, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar27_g685 = lerp( desaturateInitialColor27_g685, desaturateDot27_g685.xxx, 0.5 );
				float clampResult21_g685 = clamp( ( pow( ( 1.0 - clampResult13_g685 ) , _FuzzyShading_Power ) * _FuzzyShading_EdgeBrightness ) , 0.0 , 1.0 );
				float3 lerpResult23_g685 = lerp( ( ( 1.0 - ( clampResult13_g685 * _FuzzyShading_CoreDarkness ) ) * temp_output_26_0_g685 ) , ( desaturateVar27_g685 * _Fuzzy_EdgeColor.rgb ) , clampResult21_g685);
				float3 temp_output_279_0 = lerpResult23_g685;
				float3 desaturateInitialColor336 = temp_output_279_0;
				float desaturateDot336 = dot( desaturateInitialColor336, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar336 = lerp( desaturateInitialColor336, desaturateDot336.xxx, 1.0 );
				float eyeDepth = IN.ase_texcoord8.z;
				float cameraDepthFade306 = (( eyeDepth -_ProjectionParams.y - _Glow_DistanceOffset ) / _Glow_DistanceFade);
				float DistanceLerp325 = cameraDepthFade306;
				float4 lerpResult329 = lerp( float4( temp_output_279_0 , 0.0 ) , ( ( _DistanceColor * _DistanceBrightness ) * float4( desaturateVar336 , 0.0 ) ) , DistanceLerp325);
				float4 lerpResult333 = lerp( float4( temp_output_279_0 , 0.0 ) , lerpResult329 , _DistanceBrightnessToggle);
				
				float2 texCoord23 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack12 = UnpackNormalScale( tex2D( _Macro_Norm, ( ( ( texCoord23 + float2( 0.001982,0.001982 ) ) * float2( 1009,1009 ) ) * _Macro_Norm2_Scale ) ), _Macro_Norm_Amount );
				unpack12.z = lerp( 1, unpack12.z, saturate(_Macro_Norm_Amount) );
				float3 lerpResult3 = lerp( float3(0,0,1) , unpack12 , temp_output_299_0);
				
				float2 texCoord80 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_74_0 = ( texCoord80 * _WeightMapScale );
				float Dirt_GlowWeight73 = tex2D( _Dirt_Glow, temp_output_74_0 ).r;
				float Dirt_PlainWeight73 = tex2D( _Dirt_Plain, temp_output_74_0 ).r;
				float lerpResult86 = lerp( ( tex2DNode48.r * _Glow_Multiplier_Close ) , _Glow_Multiplier_Far , temp_output_299_0);
				float2 appendResult14_g697 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g698 = appendResult14_g697;
				float temp_output_11_0_g698 = _GlowWaveSpeed;
				float2 appendResult1_g698 = (float2(( break5_g698.x + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_X ) ) ) , ( break5_g698.y + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g697 = (float3(appendResult1_g698 , WorldPosition.z));
				float3 temp_cast_6 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g699 = ( appendResult8_g697 / -abs( temp_cast_6 ) );
				float4 tex2DNode16_g699 = tex2D( _GlowWave, (temp_output_3_0_g699).xz );
				float2 appendResult14_g707 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g708 = appendResult14_g707;
				float temp_output_11_0_g708 = _GlowWaveSpeed;
				float2 appendResult1_g708 = (float2(( break5_g708.x + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_X ) ) ) , ( break5_g708.y + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g707 = (float3(appendResult1_g708 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g709 = ( appendResult8_g707 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g709 = tex2D( _GlowWave, (temp_output_3_0_g709).xz );
				float2 appendResult14_g692 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g693 = appendResult14_g692;
				float temp_output_11_0_g693 = _GlowWaveSpeed;
				float2 appendResult1_g693 = (float2(( break5_g693.x + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_X ) ) ) , ( break5_g693.y + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g692 = (float3(appendResult1_g693 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g694 = ( appendResult8_g692 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g694 = tex2D( _GlowWave, (temp_output_3_0_g694).xz );
				float2 appendResult14_g687 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g688 = appendResult14_g687;
				float temp_output_11_0_g688 = _GlowWaveSpeed;
				float2 appendResult1_g688 = (float2(( break5_g688.x + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_X ) ) ) , ( break5_g688.y + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g687 = (float3(appendResult1_g688 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g689 = ( appendResult8_g687 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g689 = tex2D( _GlowWave, (temp_output_3_0_g689).xz );
				float2 appendResult14_g702 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g703 = appendResult14_g702;
				float temp_output_11_0_g703 = _GlowWaveSpeed;
				float2 appendResult1_g703 = (float2(( break5_g703.x + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_X ) ) ) , ( break5_g703.y + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g702 = (float3(appendResult1_g703 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g704 = ( appendResult8_g702 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g704 = tex2D( _GlowWave, (temp_output_3_0_g704).xz );
				float3 Dirt_Glow73 = ( lerpResult86 * ( ( ( ( ( (tex2DNode16_g699).r * (tex2DNode16_g709).r ) + (tex2DNode16_g694).r ) * ( (tex2DNode16_g689).r + (tex2DNode16_g704).r ) ) * _GlowColor ) * _Glow_Amount ) ).rgb;
				float Dirt_Plain73 = 0.0;
				float3 localMyCustomExpression73 = MyCustomExpression73( Dirt_GlowWeight73 , Dirt_PlainWeight73 , Dirt_Glow73 , Dirt_Plain73 );
				
				float4 tex2DNode60 = tex2D( _Dirt_A_Spec, temp_output_39_0 );
				float lerpResult61 = lerp( _Dirt_A_Metal_A , _Dirt_A_Metal_B , tex2DNode60.r);
				
				float lerpResult66 = lerp( _Dirt_A_Rough_A , _Dirt_A_Rough_B , tex2DNode60.r);
				float lerpResult68 = lerp( lerpResult66 , _Dirt_A_Rough_Distance , temp_output_299_0);
				

				float3 BaseColor = lerpResult333.rgb;
				float3 Normal = BlendNormal( BlendNormal( UnpackNormalScale( tex2D( _Dirt_A_Norm, temp_output_39_0 ), 1.0f ) , UnpackNormalScale( tex2D( _Dirt_A_Norm, ( temp_output_39_0 * _Dirt_A_Norm2_Scale ) ), 1.0f ) ) , lerpResult3 );
				float3 Emission = ( localMyCustomExpression73 * cameraDepthFade306 );
				float3 Specular = 0.5;
				float Metallic = lerpResult61;
				float Smoothness = ( 1.0 - lerpResult68 );
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
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
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
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
			#define ASE_NEEDS_VERT_POSITION


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
				float4 ase_texcoord7 : TEXCOORD7;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			sampler2D _Macro_Multiplier;
			sampler2D _Dirt_A_Dif;
			sampler2D _Dirt_Glow;
			sampler2D _Dirt_Plain;
			sampler2D _GlowWave;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 MyCustomExpression73( float Dirt_GlowWeight, float Dirt_PlainWeight, float3 Dirt_Glow, float Dirt_Plain )
			{
				float  lerpres;
				float  Local0;
				float  AllWeightsAndHeights = Dirt_GlowWeight.r + Dirt_PlainWeight.r + 0;
				float  Divider = ( 1.0 / AllWeightsAndHeights );
				float3  Layer0Contribution = Divider.rrr * Dirt_GlowWeight.rrr * Dirt_Glow;
				float3  Layer1Contribution = Divider.rrr * Dirt_PlainWeight.rrr * Dirt_Plain;
				float3  Result = Layer0Contribution + Layer1Contribution + float3(0,0,0);
				return Result;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord5.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord6.xyz = ase_worldBitangent;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord4.w = eyeDepth;
				
				o.ase_texcoord7.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.w = 0;
				o.ase_texcoord6.w = 0;
				o.ase_texcoord7.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 appendResult2_g685 = (float3(1.0 , 1.0 , ase_vface));
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldNormal = IN.ase_texcoord5.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord6.xyz;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToWorldDir10_g685 = mul( ase_tangentToWorldFast, ( float3( 0,0,1 ) * appendResult2_g685 ) );
				float dotResult12_g685 = dot( ase_worldViewDir , tangentToWorldDir10_g685 );
				float clampResult13_g685 = clamp( dotResult12_g685 , 0.0 , 1.0 );
				float2 texCoord44 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_39_0 = ( ( ( float2( 0.001982,0.001982 ) + texCoord44 ) * float2( 1009,1009 ) ) * _Dirt_A_Scale );
				float lerpResult32 = lerp( _Macro_Multiplier_A , _Macro_Multiplier_B , tex2D( _Macro_Multiplier, ( temp_output_39_0 * _Macro_Multiplier_Scale ) ).g);
				float4 tex2DNode48 = tex2D( _Dirt_A_Dif, temp_output_39_0 );
				float temp_output_1_0_g686 = 0.0;
				float temp_output_299_0 = saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g686 ) / ( _Macro_Distance - temp_output_1_0_g686 ) ) );
				float4 lerpResult31 = lerp( tex2DNode48 , tex2D( _Dirt_A_Dif, ( temp_output_39_0 * _Macro_Scale_Dif ) ) , temp_output_299_0);
				float3 desaturateInitialColor24 = CalculateContrast(_Contrast,( ( _Color * ( lerpResult32 * lerpResult31 ) ) * _Brightness )).rgb;
				float desaturateDot24 = dot( desaturateInitialColor24, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24 = lerp( desaturateInitialColor24, desaturateDot24.xxx, _Desaturation );
				float3 temp_output_26_0_g685 = desaturateVar24;
				float3 desaturateInitialColor27_g685 = temp_output_26_0_g685;
				float desaturateDot27_g685 = dot( desaturateInitialColor27_g685, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar27_g685 = lerp( desaturateInitialColor27_g685, desaturateDot27_g685.xxx, 0.5 );
				float clampResult21_g685 = clamp( ( pow( ( 1.0 - clampResult13_g685 ) , _FuzzyShading_Power ) * _FuzzyShading_EdgeBrightness ) , 0.0 , 1.0 );
				float3 lerpResult23_g685 = lerp( ( ( 1.0 - ( clampResult13_g685 * _FuzzyShading_CoreDarkness ) ) * temp_output_26_0_g685 ) , ( desaturateVar27_g685 * _Fuzzy_EdgeColor.rgb ) , clampResult21_g685);
				float3 temp_output_279_0 = lerpResult23_g685;
				float3 desaturateInitialColor336 = temp_output_279_0;
				float desaturateDot336 = dot( desaturateInitialColor336, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar336 = lerp( desaturateInitialColor336, desaturateDot336.xxx, 1.0 );
				float eyeDepth = IN.ase_texcoord4.w;
				float cameraDepthFade306 = (( eyeDepth -_ProjectionParams.y - _Glow_DistanceOffset ) / _Glow_DistanceFade);
				float DistanceLerp325 = cameraDepthFade306;
				float4 lerpResult329 = lerp( float4( temp_output_279_0 , 0.0 ) , ( ( _DistanceColor * _DistanceBrightness ) * float4( desaturateVar336 , 0.0 ) ) , DistanceLerp325);
				float4 lerpResult333 = lerp( float4( temp_output_279_0 , 0.0 ) , lerpResult329 , _DistanceBrightnessToggle);
				
				float2 texCoord80 = IN.ase_texcoord7.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_74_0 = ( texCoord80 * _WeightMapScale );
				float Dirt_GlowWeight73 = tex2D( _Dirt_Glow, temp_output_74_0 ).r;
				float Dirt_PlainWeight73 = tex2D( _Dirt_Plain, temp_output_74_0 ).r;
				float lerpResult86 = lerp( ( tex2DNode48.r * _Glow_Multiplier_Close ) , _Glow_Multiplier_Far , temp_output_299_0);
				float2 appendResult14_g697 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g698 = appendResult14_g697;
				float temp_output_11_0_g698 = _GlowWaveSpeed;
				float2 appendResult1_g698 = (float2(( break5_g698.x + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_X ) ) ) , ( break5_g698.y + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g697 = (float3(appendResult1_g698 , WorldPosition.z));
				float3 temp_cast_6 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g699 = ( appendResult8_g697 / -abs( temp_cast_6 ) );
				float4 tex2DNode16_g699 = tex2D( _GlowWave, (temp_output_3_0_g699).xz );
				float2 appendResult14_g707 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g708 = appendResult14_g707;
				float temp_output_11_0_g708 = _GlowWaveSpeed;
				float2 appendResult1_g708 = (float2(( break5_g708.x + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_X ) ) ) , ( break5_g708.y + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g707 = (float3(appendResult1_g708 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g709 = ( appendResult8_g707 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g709 = tex2D( _GlowWave, (temp_output_3_0_g709).xz );
				float2 appendResult14_g692 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g693 = appendResult14_g692;
				float temp_output_11_0_g693 = _GlowWaveSpeed;
				float2 appendResult1_g693 = (float2(( break5_g693.x + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_X ) ) ) , ( break5_g693.y + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g692 = (float3(appendResult1_g693 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g694 = ( appendResult8_g692 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g694 = tex2D( _GlowWave, (temp_output_3_0_g694).xz );
				float2 appendResult14_g687 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g688 = appendResult14_g687;
				float temp_output_11_0_g688 = _GlowWaveSpeed;
				float2 appendResult1_g688 = (float2(( break5_g688.x + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_X ) ) ) , ( break5_g688.y + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g687 = (float3(appendResult1_g688 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g689 = ( appendResult8_g687 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g689 = tex2D( _GlowWave, (temp_output_3_0_g689).xz );
				float2 appendResult14_g702 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g703 = appendResult14_g702;
				float temp_output_11_0_g703 = _GlowWaveSpeed;
				float2 appendResult1_g703 = (float2(( break5_g703.x + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_X ) ) ) , ( break5_g703.y + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g702 = (float3(appendResult1_g703 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g704 = ( appendResult8_g702 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g704 = tex2D( _GlowWave, (temp_output_3_0_g704).xz );
				float3 Dirt_Glow73 = ( lerpResult86 * ( ( ( ( ( (tex2DNode16_g699).r * (tex2DNode16_g709).r ) + (tex2DNode16_g694).r ) * ( (tex2DNode16_g689).r + (tex2DNode16_g704).r ) ) * _GlowColor ) * _Glow_Amount ) ).rgb;
				float Dirt_Plain73 = 0.0;
				float3 localMyCustomExpression73 = MyCustomExpression73( Dirt_GlowWeight73 , Dirt_PlainWeight73 , Dirt_Glow73 , Dirt_Plain73 );
				

				float3 BaseColor = lerpResult333.rgb;
				float3 Emission = ( localMyCustomExpression73 * cameraDepthFade306 );
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
			#define ASE_NEEDS_VERT_POSITION


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
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			sampler2D _Macro_Multiplier;
			sampler2D _Dirt_A_Dif;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord2.xyz = ase_worldTangent;
				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float ase_vertexTangentSign = v.ase_tangent.w * ( unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0 );
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord4.xyz = ase_worldBitangent;
				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord2.w = eyeDepth;
				
				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float3 ase_worldViewDir = ( _WorldSpaceCameraPos.xyz - WorldPosition );
				ase_worldViewDir = SafeNormalize( ase_worldViewDir );
				float3 appendResult2_g685 = (float3(1.0 , 1.0 , ase_vface));
				float3 ase_worldTangent = IN.ase_texcoord2.xyz;
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord4.xyz;
				float3x3 ase_tangentToWorldFast = float3x3(ase_worldTangent.x,ase_worldBitangent.x,ase_worldNormal.x,ase_worldTangent.y,ase_worldBitangent.y,ase_worldNormal.y,ase_worldTangent.z,ase_worldBitangent.z,ase_worldNormal.z);
				float3 tangentToWorldDir10_g685 = mul( ase_tangentToWorldFast, ( float3( 0,0,1 ) * appendResult2_g685 ) );
				float dotResult12_g685 = dot( ase_worldViewDir , tangentToWorldDir10_g685 );
				float clampResult13_g685 = clamp( dotResult12_g685 , 0.0 , 1.0 );
				float2 texCoord44 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_39_0 = ( ( ( float2( 0.001982,0.001982 ) + texCoord44 ) * float2( 1009,1009 ) ) * _Dirt_A_Scale );
				float lerpResult32 = lerp( _Macro_Multiplier_A , _Macro_Multiplier_B , tex2D( _Macro_Multiplier, ( temp_output_39_0 * _Macro_Multiplier_Scale ) ).g);
				float4 tex2DNode48 = tex2D( _Dirt_A_Dif, temp_output_39_0 );
				float temp_output_1_0_g686 = 0.0;
				float temp_output_299_0 = saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g686 ) / ( _Macro_Distance - temp_output_1_0_g686 ) ) );
				float4 lerpResult31 = lerp( tex2DNode48 , tex2D( _Dirt_A_Dif, ( temp_output_39_0 * _Macro_Scale_Dif ) ) , temp_output_299_0);
				float3 desaturateInitialColor24 = CalculateContrast(_Contrast,( ( _Color * ( lerpResult32 * lerpResult31 ) ) * _Brightness )).rgb;
				float desaturateDot24 = dot( desaturateInitialColor24, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24 = lerp( desaturateInitialColor24, desaturateDot24.xxx, _Desaturation );
				float3 temp_output_26_0_g685 = desaturateVar24;
				float3 desaturateInitialColor27_g685 = temp_output_26_0_g685;
				float desaturateDot27_g685 = dot( desaturateInitialColor27_g685, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar27_g685 = lerp( desaturateInitialColor27_g685, desaturateDot27_g685.xxx, 0.5 );
				float clampResult21_g685 = clamp( ( pow( ( 1.0 - clampResult13_g685 ) , _FuzzyShading_Power ) * _FuzzyShading_EdgeBrightness ) , 0.0 , 1.0 );
				float3 lerpResult23_g685 = lerp( ( ( 1.0 - ( clampResult13_g685 * _FuzzyShading_CoreDarkness ) ) * temp_output_26_0_g685 ) , ( desaturateVar27_g685 * _Fuzzy_EdgeColor.rgb ) , clampResult21_g685);
				float3 temp_output_279_0 = lerpResult23_g685;
				float3 desaturateInitialColor336 = temp_output_279_0;
				float desaturateDot336 = dot( desaturateInitialColor336, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar336 = lerp( desaturateInitialColor336, desaturateDot336.xxx, 1.0 );
				float eyeDepth = IN.ase_texcoord2.w;
				float cameraDepthFade306 = (( eyeDepth -_ProjectionParams.y - _Glow_DistanceOffset ) / _Glow_DistanceFade);
				float DistanceLerp325 = cameraDepthFade306;
				float4 lerpResult329 = lerp( float4( temp_output_279_0 , 0.0 ) , ( ( _DistanceColor * _DistanceBrightness ) * float4( desaturateVar336 , 0.0 ) ) , DistanceLerp325);
				float4 lerpResult333 = lerp( float4( temp_output_279_0 , 0.0 ) , lerpResult329 , _DistanceBrightnessToggle);
				

				float3 BaseColor = lerpResult333.rgb;
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

			#define ASE_NEEDS_FRAG_WORLD_POSITION


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
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			sampler2D _Dirt_A_Norm;
			sampler2D _Macro_Norm;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord5.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord5.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float2 texCoord44 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_39_0 = ( ( ( float2( 0.001982,0.001982 ) + texCoord44 ) * float2( 1009,1009 ) ) * _Dirt_A_Scale );
				float2 texCoord23 = IN.ase_texcoord5.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack12 = UnpackNormalScale( tex2D( _Macro_Norm, ( ( ( texCoord23 + float2( 0.001982,0.001982 ) ) * float2( 1009,1009 ) ) * _Macro_Norm2_Scale ) ), _Macro_Norm_Amount );
				unpack12.z = lerp( 1, unpack12.z, saturate(_Macro_Norm_Amount) );
				float temp_output_1_0_g686 = 0.0;
				float temp_output_299_0 = saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g686 ) / ( _Macro_Distance - temp_output_1_0_g686 ) ) );
				float3 lerpResult3 = lerp( float3(0,0,1) , unpack12 , temp_output_299_0);
				

				float3 Normal = BlendNormal( BlendNormal( UnpackNormalScale( tex2D( _Dirt_A_Norm, temp_output_39_0 ), 1.0f ) , UnpackNormalScale( tex2D( _Dirt_A_Norm, ( temp_output_39_0 * _Dirt_A_Norm2_Scale ) ), 1.0f ) ) , lerpResult3 );
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

			#define ASE_NEEDS_FRAG_WORLD_VIEW_DIR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_POSITION


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
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			sampler2D _Macro_Multiplier;
			sampler2D _Dirt_A_Dif;
			sampler2D _Dirt_A_Norm;
			sampler2D _Macro_Norm;
			sampler2D _Dirt_Glow;
			sampler2D _Dirt_Plain;
			sampler2D _GlowWave;
			sampler2D _Dirt_A_Spec;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

			float4 CalculateContrast( float contrastValue, float4 colorTarget )
			{
				float t = 0.5 * ( 1.0 - contrastValue );
				return mul( float4x4( contrastValue,0,0,t, 0,contrastValue,0,t, 0,0,contrastValue,t, 0,0,0,1 ), colorTarget );
			}
			float3 MyCustomExpression73( float Dirt_GlowWeight, float Dirt_PlainWeight, float3 Dirt_Glow, float Dirt_Plain )
			{
				float  lerpres;
				float  Local0;
				float  AllWeightsAndHeights = Dirt_GlowWeight.r + Dirt_PlainWeight.r + 0;
				float  Divider = ( 1.0 / AllWeightsAndHeights );
				float3  Layer0Contribution = Divider.rrr * Dirt_GlowWeight.rrr * Dirt_Glow;
				float3  Layer1Contribution = Divider.rrr * Dirt_PlainWeight.rrr * Dirt_Plain;
				float3  Result = Layer0Contribution + Layer1Contribution + float3(0,0,0);
				return Result;
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 objectToViewPos = TransformWorldToView(TransformObjectToWorld(v.vertex.xyz));
				float eyeDepth = -objectToViewPos.z;
				o.ase_texcoord8.z = eyeDepth;
				
				o.ase_texcoord8.xy = v.texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord8.w = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				float3 appendResult2_g685 = (float3(1.0 , 1.0 , ase_vface));
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir10_g685 = mul( ase_tangentToWorldFast, ( float3( 0,0,1 ) * appendResult2_g685 ) );
				float dotResult12_g685 = dot( WorldViewDirection , tangentToWorldDir10_g685 );
				float clampResult13_g685 = clamp( dotResult12_g685 , 0.0 , 1.0 );
				float2 texCoord44 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_39_0 = ( ( ( float2( 0.001982,0.001982 ) + texCoord44 ) * float2( 1009,1009 ) ) * _Dirt_A_Scale );
				float lerpResult32 = lerp( _Macro_Multiplier_A , _Macro_Multiplier_B , tex2D( _Macro_Multiplier, ( temp_output_39_0 * _Macro_Multiplier_Scale ) ).g);
				float4 tex2DNode48 = tex2D( _Dirt_A_Dif, temp_output_39_0 );
				float temp_output_1_0_g686 = 0.0;
				float temp_output_299_0 = saturate( ( ( distance( _WorldSpaceCameraPos , WorldPosition ) - temp_output_1_0_g686 ) / ( _Macro_Distance - temp_output_1_0_g686 ) ) );
				float4 lerpResult31 = lerp( tex2DNode48 , tex2D( _Dirt_A_Dif, ( temp_output_39_0 * _Macro_Scale_Dif ) ) , temp_output_299_0);
				float3 desaturateInitialColor24 = CalculateContrast(_Contrast,( ( _Color * ( lerpResult32 * lerpResult31 ) ) * _Brightness )).rgb;
				float desaturateDot24 = dot( desaturateInitialColor24, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar24 = lerp( desaturateInitialColor24, desaturateDot24.xxx, _Desaturation );
				float3 temp_output_26_0_g685 = desaturateVar24;
				float3 desaturateInitialColor27_g685 = temp_output_26_0_g685;
				float desaturateDot27_g685 = dot( desaturateInitialColor27_g685, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar27_g685 = lerp( desaturateInitialColor27_g685, desaturateDot27_g685.xxx, 0.5 );
				float clampResult21_g685 = clamp( ( pow( ( 1.0 - clampResult13_g685 ) , _FuzzyShading_Power ) * _FuzzyShading_EdgeBrightness ) , 0.0 , 1.0 );
				float3 lerpResult23_g685 = lerp( ( ( 1.0 - ( clampResult13_g685 * _FuzzyShading_CoreDarkness ) ) * temp_output_26_0_g685 ) , ( desaturateVar27_g685 * _Fuzzy_EdgeColor.rgb ) , clampResult21_g685);
				float3 temp_output_279_0 = lerpResult23_g685;
				float3 desaturateInitialColor336 = temp_output_279_0;
				float desaturateDot336 = dot( desaturateInitialColor336, float3( 0.299, 0.587, 0.114 ));
				float3 desaturateVar336 = lerp( desaturateInitialColor336, desaturateDot336.xxx, 1.0 );
				float eyeDepth = IN.ase_texcoord8.z;
				float cameraDepthFade306 = (( eyeDepth -_ProjectionParams.y - _Glow_DistanceOffset ) / _Glow_DistanceFade);
				float DistanceLerp325 = cameraDepthFade306;
				float4 lerpResult329 = lerp( float4( temp_output_279_0 , 0.0 ) , ( ( _DistanceColor * _DistanceBrightness ) * float4( desaturateVar336 , 0.0 ) ) , DistanceLerp325);
				float4 lerpResult333 = lerp( float4( temp_output_279_0 , 0.0 ) , lerpResult329 , _DistanceBrightnessToggle);
				
				float2 texCoord23 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float3 unpack12 = UnpackNormalScale( tex2D( _Macro_Norm, ( ( ( texCoord23 + float2( 0.001982,0.001982 ) ) * float2( 1009,1009 ) ) * _Macro_Norm2_Scale ) ), _Macro_Norm_Amount );
				unpack12.z = lerp( 1, unpack12.z, saturate(_Macro_Norm_Amount) );
				float3 lerpResult3 = lerp( float3(0,0,1) , unpack12 , temp_output_299_0);
				
				float2 texCoord80 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float2 temp_output_74_0 = ( texCoord80 * _WeightMapScale );
				float Dirt_GlowWeight73 = tex2D( _Dirt_Glow, temp_output_74_0 ).r;
				float Dirt_PlainWeight73 = tex2D( _Dirt_Plain, temp_output_74_0 ).r;
				float lerpResult86 = lerp( ( tex2DNode48.r * _Glow_Multiplier_Close ) , _Glow_Multiplier_Far , temp_output_299_0);
				float2 appendResult14_g697 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g698 = appendResult14_g697;
				float temp_output_11_0_g698 = _GlowWaveSpeed;
				float2 appendResult1_g698 = (float2(( break5_g698.x + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_X ) ) ) , ( break5_g698.y + ( _TimeParameters.x * ( temp_output_11_0_g698 * _GlowWave_1_Speed_Y ) ) )));
				float3 appendResult8_g697 = (float3(appendResult1_g698 , WorldPosition.z));
				float3 temp_cast_6 = (( ( 1.0 / _GlowWave_1_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g699 = ( appendResult8_g697 / -abs( temp_cast_6 ) );
				float4 tex2DNode16_g699 = tex2D( _GlowWave, (temp_output_3_0_g699).xz );
				float2 appendResult14_g707 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g708 = appendResult14_g707;
				float temp_output_11_0_g708 = _GlowWaveSpeed;
				float2 appendResult1_g708 = (float2(( break5_g708.x + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_X ) ) ) , ( break5_g708.y + ( _TimeParameters.x * ( temp_output_11_0_g708 * _GlowWave_2_Speed_Y ) ) )));
				float3 appendResult8_g707 = (float3(appendResult1_g708 , WorldPosition.z));
				float3 temp_cast_7 = (( ( 1.0 / _GlowWave_2_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g709 = ( appendResult8_g707 / -abs( temp_cast_7 ) );
				float4 tex2DNode16_g709 = tex2D( _GlowWave, (temp_output_3_0_g709).xz );
				float2 appendResult14_g692 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g693 = appendResult14_g692;
				float temp_output_11_0_g693 = _GlowWaveSpeed;
				float2 appendResult1_g693 = (float2(( break5_g693.x + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_X ) ) ) , ( break5_g693.y + ( _TimeParameters.x * ( temp_output_11_0_g693 * _GlowWave_3_Speed_Y ) ) )));
				float3 appendResult8_g692 = (float3(appendResult1_g693 , WorldPosition.z));
				float3 temp_cast_8 = (( ( 1.0 / _GlowWave_3_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g694 = ( appendResult8_g692 / -abs( temp_cast_8 ) );
				float4 tex2DNode16_g694 = tex2D( _GlowWave, (temp_output_3_0_g694).xz );
				float2 appendResult14_g687 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g688 = appendResult14_g687;
				float temp_output_11_0_g688 = _GlowWaveSpeed;
				float2 appendResult1_g688 = (float2(( break5_g688.x + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_X ) ) ) , ( break5_g688.y + ( _TimeParameters.x * ( temp_output_11_0_g688 * _GlowWave_4_Speed_Y ) ) )));
				float3 appendResult8_g687 = (float3(appendResult1_g688 , WorldPosition.z));
				float3 temp_cast_9 = (( ( 1.0 / _GlowWave_4_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g689 = ( appendResult8_g687 / -abs( temp_cast_9 ) );
				float4 tex2DNode16_g689 = tex2D( _GlowWave, (temp_output_3_0_g689).xz );
				float2 appendResult14_g702 = (float2(WorldPosition.x , WorldPosition.y));
				float2 break5_g703 = appendResult14_g702;
				float temp_output_11_0_g703 = _GlowWaveSpeed;
				float2 appendResult1_g703 = (float2(( break5_g703.x + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_X ) ) ) , ( break5_g703.y + ( _TimeParameters.x * ( temp_output_11_0_g703 * _GlowWave_5_Speed_Y ) ) )));
				float3 appendResult8_g702 = (float3(appendResult1_g703 , WorldPosition.z));
				float3 temp_cast_10 = (( ( 1.0 / _GlowWave_5_Scale ) * _Glow_MASTER_SCALE )).xxx;
				float3 temp_output_3_0_g704 = ( appendResult8_g702 / -abs( temp_cast_10 ) );
				float4 tex2DNode16_g704 = tex2D( _GlowWave, (temp_output_3_0_g704).xz );
				float3 Dirt_Glow73 = ( lerpResult86 * ( ( ( ( ( (tex2DNode16_g699).r * (tex2DNode16_g709).r ) + (tex2DNode16_g694).r ) * ( (tex2DNode16_g689).r + (tex2DNode16_g704).r ) ) * _GlowColor ) * _Glow_Amount ) ).rgb;
				float Dirt_Plain73 = 0.0;
				float3 localMyCustomExpression73 = MyCustomExpression73( Dirt_GlowWeight73 , Dirt_PlainWeight73 , Dirt_Glow73 , Dirt_Plain73 );
				
				float4 tex2DNode60 = tex2D( _Dirt_A_Spec, temp_output_39_0 );
				float lerpResult61 = lerp( _Dirt_A_Metal_A , _Dirt_A_Metal_B , tex2DNode60.r);
				
				float lerpResult66 = lerp( _Dirt_A_Rough_A , _Dirt_A_Rough_B , tex2DNode60.r);
				float lerpResult68 = lerp( lerpResult66 , _Dirt_A_Rough_Distance , temp_output_299_0);
				

				float3 BaseColor = lerpResult333.rgb;
				float3 Normal = BlendNormal( BlendNormal( UnpackNormalScale( tex2D( _Dirt_A_Norm, temp_output_39_0 ), 1.0f ) , UnpackNormalScale( tex2D( _Dirt_A_Norm, ( temp_output_39_0 * _Dirt_A_Norm2_Scale ) ), 1.0f ) ) , lerpResult3 );
				float3 Emission = ( localMyCustomExpression73 * cameraDepthFade306 );
				float3 Specular = 0.5;
				float Metallic = lerpResult61;
				float Smoothness = ( 1.0 - lerpResult68 );
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

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Color;
			float4 _GlowColor;
			float4 _Fuzzy_EdgeColor;
			float4 _DistanceColor;
			float _FuzzyShading_CoreDarkness;
			float _GlowWave_1_Scale;
			float _Glow_MASTER_SCALE;
			float _GlowWave_2_Speed_X;
			float _GlowWave_2_Speed_Y;
			float _GlowWave_2_Scale;
			float _GlowWave_3_Speed_X;
			float _GlowWave_3_Speed_Y;
			float _GlowWave_3_Scale;
			float _GlowWave_4_Speed_Y;
			float _GlowWave_1_Speed_Y;
			float _GlowWave_4_Scale;
			float _GlowWave_5_Speed_X;
			float _GlowWave_5_Speed_Y;
			float _GlowWave_5_Scale;
			float _Glow_Amount;
			float _Dirt_A_Metal_A;
			float _Dirt_A_Metal_B;
			float _Dirt_A_Rough_A;
			float _GlowWave_4_Speed_X;
			float _GlowWave_1_Speed_X;
			float _Glow_Multiplier_Far;
			float _Dirt_A_Rough_B;
			float _Contrast;
			float _Macro_Multiplier_A;
			float _Macro_Multiplier_B;
			float _Dirt_A_Scale;
			float _Macro_Multiplier_Scale;
			float _Macro_Scale_Dif;
			float _Macro_Distance;
			float _Brightness;
			float _Desaturation;
			float _GlowWaveSpeed;
			float _FuzzyShading_Power;
			float _DistanceBrightness;
			float _Glow_DistanceFade;
			float _Glow_DistanceOffset;
			float _DistanceBrightnessToggle;
			float _Dirt_A_Norm2_Scale;
			float _Macro_Norm2_Scale;
			float _Macro_Norm_Amount;
			float _WeightMapScale;
			float _Glow_Multiplier_Close;
			float _FuzzyShading_EdgeBrightness;
			float _Dirt_A_Rough_Distance;
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

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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
Node;AmplifyShaderEditor.TextureCoordinatesNode;44;-3259.6,-566.8255;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;291;-1362.016,-801.0542;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;86;-3402.916,1294.674;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;12;-1106.009,1537.264;Inherit;True;Property;_TextureSample2;Texture Sample 2;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;9;-1183.338,1145.154;Inherit;True;Property;_TextureSample1;Texture Sample 1;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector3Node;5;-973.9009,1359.285;Inherit;False;Constant;_NormalVector;NormalVector;0;0;Create;True;0;0;0;False;0;False;0,0,1;0,0,0;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleContrastOpNode;293;-1078.954,-524.7337;Inherit;False;2;1;COLOR;0,0,0,0;False;0;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.TexturePropertyNode;78;-3389.027,491.3028;Inherit;True;Property;_Dirt_Glow;Dirt_Glow;20;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;8;-1482.744,1062.276;Inherit;True;Property;_Dirt_A_Norm;Dirt_A_Norm;7;0;Create;True;0;0;0;False;0;False;None;abc00000000008153448977717058690;False;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;28;-1244.75,-551.3798;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-1464.838,413.9993;Inherit;False;Property;_Dirt_A_Rough_B;Dirt_A_Rough_B;12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-1275.75,-419.3797;Inherit;False;Property;_Contrast;Contrast;2;0;Create;True;0;0;0;False;0;False;0;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;60;-1809.253,177.5566;Inherit;True;Property;_TextureSample6;Texture Sample 6;17;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;69;-1228.152,542.2112;Inherit;False;Property;_Dirt_A_Rough_Distance;Dirt_A_Rough_Distance;13;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;10;-1377.058,1250.079;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;85;-3582.061,1518.146;Inherit;False;Property;_Glow_Amount;Glow_Amount;25;0;Create;True;0;0;0;False;0;False;3;15;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;84;-3545.061,1420.146;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;90;-3663.801,1318.295;Inherit;False;Property;_Glow_Multiplier_Far;Glow_Multiplier_Far;33;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-1369.231,1732.778;Inherit;False;Property;_Macro_Norm_Amount;Macro_Norm_Amount;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;13;-1385.537,1366.071;Inherit;True;Property;_Macro_Norm;Macro_Norm;56;0;Create;True;0;0;0;False;0;False;None;abc00000000012926404437582418172;True;bump;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;64;-1320.838,289.9992;Inherit;False;Property;_Dirt_A_Rough_A;Dirt_A_Rough_A;11;0;Create;True;0;0;0;False;0;False;0;0.3;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;80;-3822.027,684.3028;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-1319.275,1566.762;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;79;-3802.027,806.3028;Inherit;False;Property;_WeightMapScale;WeightMapScale;19;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;92;-3986.03,1431.021;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;15;-1512.68,1509.125;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;7;-1187.23,950.9354;Inherit;True;Property;_TextureSample0;Texture Sample 0;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;-3591.027,703.3028;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;57;-4511.622,-30.69364;Inherit;False;Property;_Macro_Fade;Macro_Fade;51;0;Create;True;0;0;0;False;0;False;1000;60;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;59;-2063.496,204.9711;Inherit;True;Property;_Dirt_A_Spec;Dirt_A_Spec;14;0;Create;True;0;0;0;False;0;False;None;None;False;gray;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleDivideOpNode;56;-4375.235,-309.6825;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;68;-748.1522,404.2112;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;76;-3118.027,488.3028;Inherit;True;Property;_TextureSample7;Texture Sample 7;23;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;58;-4243.235,-306.6825;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.ScreenPosInputsNode;53;-4941.234,-415.6825;Float;False;0;False;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ScreenDepthNode;52;-4734.235,-416.6825;Inherit;False;0;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;61;-1102.506,168.8643;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleSubtractOpNode;54;-4533.235,-373.6825;Inherit;False;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.CustomExpressionNode;73;-2777.79,658.5245;Inherit;False;float  lerpres@$float  Local0@$$$float  AllWeightsAndHeights = Dirt_GlowWeight.r + Dirt_PlainWeight.r + 0@$float  Divider = ( 1.0 / AllWeightsAndHeights )@$float3  Layer0Contribution = Divider.rrr * Dirt_GlowWeight.rrr * Dirt_Glow@$float3  Layer1Contribution = Divider.rrr * Dirt_PlainWeight.rrr * Dirt_Plain@$float3  Result = Layer0Contribution + Layer1Contribution + float3(0,0,0)@$return Result@;3;Create;4;False;Dirt_GlowWeight;FLOAT;0;In;;Inherit;False;False;Dirt_PlainWeight;FLOAT;0;In;;Inherit;False;False;Dirt_Glow;FLOAT3;1,1,1;In;;Inherit;False;False;Dirt_Plain;FLOAT;0;In;;Inherit;False;My Custom Expression;True;False;0;;False;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT3;1,1,1;False;3;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;272;-815.6812,-206.0119;Inherit;False;Property;_FuzzyShading_CoreDarkness;FuzzyShading_CoreDarkness;16;0;Create;True;0;0;0;False;0;False;0.8;0.8;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;279;-482.3111,-342.787;Inherit;False;FuzzyShadingGrass;-1;;685;8d9ecc9cff62bbe4aad0d715e0768ba6;0;7;28;FLOAT;0.5;False;30;FLOAT3;1.5,1.5,1.5;False;26;FLOAT3;0.5,0.5,0.5;False;5;FLOAT3;0,0,1;False;16;FLOAT;0.8;False;19;FLOAT;6;False;22;FLOAT;0.8;False;1;FLOAT3;0
Node;AmplifyShaderEditor.OneMinusNode;70;-474.1555,363.4984;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;2;-559.2303,1342.935;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;62;-1393.505,111.7155;Inherit;False;Property;_Dirt_A_Metal_A;Dirt_A_Metal_A;9;0;Create;True;0;0;0;False;0;False;-0.3200632;0;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;273;-770.6366,-129.9364;Inherit;False;Property;_FuzzyShading_Power;FuzzyShading_Power;17;0;Create;True;0;0;0;False;0;False;6;10;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;3;-718.2303,1399.935;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.DesaturateOpNode;24;-906.983,-383.306;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;83;-3393.061,1421.146;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;82;-3228.727,1346.046;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;274;-835.7012,-59.86707;Inherit;False;Property;_FuzzyShading_EdgeBrightness;FuzzyShading_EdgeBrightness;18;0;Create;True;0;0;0;False;0;False;0.8;6;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;63;-1401.505,187.7155;Inherit;False;Property;_Dirt_A_Metal_B;Dirt_A_Metal_B;10;0;Create;True;0;0;0;False;0;False;1;0.5;-1;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.BlendNormalsNode;1;-764.7222,1305.659;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;66;-1112.059,351.8387;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;81;-3390.656,754.5082;Inherit;True;Property;_Dirt_Plain;Dirt_Plain;21;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;89;-3548.05,1184.456;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;11;-1613.058,1345.079;Inherit;False;Property;_Dirt_A_Norm2_Scale;Dirt_A_Norm2_Scale;8;0;Create;True;0;0;0;False;0;False;5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-1584.406,1606.467;Inherit;False;Property;_Macro_Norm2_Scale;Macro_Norm2_Scale;55;0;Create;True;0;0;0;False;0;False;0.1;0.004;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;29;-1413.75,-491.3797;Inherit;False;Property;_Brightness;Brightness;1;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;124;-5442.783,1265.827;Inherit;False;Property;_GlowWaveSpeed;GlowWaveSpeed;34;0;Create;True;0;0;0;False;0;False;5000;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;119;-5061.811,1115.453;Inherit;False;Property;_GlowWave_1_Speed_Y;GlowWave_1_Speed_Y;45;0;Create;True;0;0;0;False;0;False;0.01;0.0001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;114;-5061.699,1046.654;Inherit;False;Property;_GlowWave_1_Speed_X;GlowWave_1_Speed_X;40;0;Create;True;0;0;0;False;0;False;-0.05;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;120;-5075.041,1320.035;Inherit;False;Property;_GlowWave_2_Speed_Y;GlowWave_2_Speed_Y;46;0;Create;True;0;0;0;False;0;False;-0.01;-0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;298;-4461.488,-740.9911;Inherit;False;Inverse Lerp;-1;;686;09cbe79402f023141a4dc1fddd4c9511;0;3;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;46;-2126.7,-227.5424;Inherit;True;Property;_Dirt_A_Dif;Dirt_A_Dif;4;0;Create;True;0;0;0;False;0;False;None;abc00000000005741188293289972553;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;37;-2098.97,-425.5807;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;110;-5061.46,1185.573;Inherit;False;Property;_GlowWave_2_Scale;GlowWave_2_Scale;36;0;Create;True;0;0;0;False;0;False;0.015;-0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;115;-5076.98,1253.83;Inherit;False;Property;_GlowWave_2_Speed_X;GlowWave_2_Speed_X;41;0;Create;True;0;0;0;False;0;False;0.005;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;50;-2033.281,-6.912522;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;109;-5042.89,976.5031;Inherit;False;Property;_GlowWave_1_Scale;GlowWave_1_Scale;35;0;Create;True;0;0;0;False;0;False;0.01;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;146;-5449.571,1069.377;Inherit;True;Property;_GlowWave;GlowWave;22;0;Create;True;0;0;0;False;0;False;None;abc00000000009268592609891549869;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TexturePropertyNode;36;-2228.139,-611.328;Inherit;True;Property;_Macro_Multiplier;Macro_Multiplier;6;0;Create;True;0;0;0;False;0;False;None;6a1ec1d037d593a499572b631287700b;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RangedFloatNode;38;-2492.491,-465.5917;Inherit;False;Property;_Macro_Multiplier_Scale;Macro_Multiplier_Scale;54;0;Create;True;0;0;0;False;0;False;0.4;0.01;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-1928.423,-753.6252;Inherit;False;Property;_Macro_Multiplier_A;Macro_Multiplier_A;52;0;Create;True;0;0;0;False;0;False;0;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DistanceOpNode;296;-4637.537,-647.9821;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;51;-2236.31,74.27321;Inherit;False;Property;_Macro_Scale_Dif;Macro_Scale_Dif;58;0;Create;True;0;0;0;False;0;False;0.2;0.2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;55;-4721.05,-799.409;Inherit;False;Property;_Macro_Distance;Macro_Distance;50;0;Create;True;0;0;0;False;0;False;1000;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;39;-2707.035,-364.5878;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.WorldPosInputsNode;294;-4936.983,-587.6611;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.WorldSpaceCameraPos;295;-5000.728,-742.7131;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-2856.102,-418.2136;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;40;-2870.385,-261.1031;Inherit;False;Property;_Dirt_A_Scale;Dirt_A_Scale;5;0;Create;True;0;0;0;False;0;False;4;0.125;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;42;-2991.365,-481.9122;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;45;-3194.192,-320.6059;Inherit;False;Constant;_Vector1;Vector 1;5;0;Create;True;0;0;0;False;0;False;1009,1009;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;43;-3199.688,-448.1735;Inherit;False;Constant;_Vector0;Vector 0;5;0;Create;True;0;0;0;False;0;False;0.001982,0.001982;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;112;-5055.67,1587.973;Inherit;False;Property;_GlowWave_4_Scale;GlowWave_4_Scale;38;0;Create;True;0;0;0;False;0;False;0.25;0.25;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;35;-1962.872,-610.7082;Inherit;True;Property;_TextureSample3;Texture Sample 3;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;111;-5053.167,1388.707;Inherit;False;Property;_GlowWave_3_Scale;GlowWave_3_Scale;37;0;Create;True;0;0;0;False;0;False;0.08;0.08;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;123;-5064.629,1935.507;Inherit;False;Property;_GlowWave_5_Speed_Y;GlowWave_5_Speed_Y;49;0;Create;True;0;0;0;False;0;False;0.001;0.001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;122;-5070.097,1726.471;Inherit;False;Property;_GlowWave_4_Speed_Y;GlowWave_4_Speed_Y;48;0;Create;True;0;0;0;False;0;False;-0.002;-0.002;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;94;-4156.603,1485.692;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;93;-4158.789,1393.844;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;292;-1604.277,-911.7773;Inherit;False;Property;_Color;Color;0;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;30;-1460.417,-637.3643;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;95;-4331.684,1172.437;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;31;-1536.14,-223.5212;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-1742.747,1524.481;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;288;-4723.629,1562.696;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;26;;687;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;289;-4727.585,1402.856;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;26;;692;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;121;-5065.997,1520.166;Inherit;False;Property;_GlowWave_3_Speed_Y;GlowWave_3_Speed_Y;47;0;Create;True;0;0;0;False;0;False;0.005;0.005;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;49;-1865.875,-125.9039;Inherit;True;Property;_TextureSample5;Texture Sample 5;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;113;-5049.36,1795.077;Inherit;False;Property;_GlowWave_5_Scale;GlowWave_5_Scale;39;0;Create;True;0;0;0;False;0;False;0.003;0.007;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;32;-1651.856,-687.7452;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;117;-5074.478,1656.822;Inherit;False;Property;_GlowWave_4_Speed_X;GlowWave_4_Speed_X;43;0;Create;True;0;0;0;False;0;False;0.2;0.02;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SaturateNode;299;-4290.929,-735.8221;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;286;-4728.625,1065.033;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;26;;697;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;34;-1926.427,-679.6274;Inherit;False;Property;_Macro_Multiplier_B;Macro_Multiplier_B;53;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;287;-4718.406,1731.811;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;26;;702;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;48;-1867.007,-310.2756;Inherit;True;Property;_TextureSample4;Texture Sample 4;13;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;118;-5068.379,1867.402;Inherit;False;Property;_GlowWave_5_Speed_X;GlowWave_5_Speed_X;44;0;Create;True;0;0;0;False;0;False;0.006;0.001;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;116;-5067.013,1455.707;Inherit;False;Property;_GlowWave_3_Speed_X;GlowWave_3_Speed_X;42;0;Create;True;0;0;0;False;0;False;0.02;0.015;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;285;-4726.713,1227.962;Inherit;False;MF_Davis3D_WorldAlignedGlowWave;26;;707;d13e22b35e7408b4ca811f5cb053c474;0;5;21;SAMPLER2D;0;False;7;FLOAT;1;False;11;FLOAT;0;False;12;FLOAT;0;False;13;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;77;-3126.027,751.3028;Inherit;True;Property;_TextureSample8;Texture Sample 8;24;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector2Node;18;-1831.747,1615.481;Inherit;False;Constant;_1009;1009;5;0;Create;True;0;0;0;False;0;False;1009,1009;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.Vector2Node;21;-1973.747,1547.481;Inherit;False;Constant;_0002;0.002;5;0;Create;True;0;0;0;False;0;False;0.001982,0.001982;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.TextureCoordinatesNode;23;-2001.747,1430.481;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;130;-2943.05,963.6752;Inherit;False;Constant;_0;0;45;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;91;-3839.843,1215.806;Inherit;False;Property;_Glow_Multiplier_Close;Glow_Multiplier_Close;32;0;Create;True;0;0;0;False;0;False;0.3;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-2752.041,1139.448;Inherit;False;Property;_Glow_DistanceOffset;Glow_DistanceOffset;28;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;310;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;311;0,0;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;Davis3D/AlienPlants_Vol3/Enviroment/Landscape_V3;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;20;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;;0;0;Standard;41;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,;0;Translucency;0;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;312;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;313;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;314;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;315;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;316;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;317;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;318;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;319;0,0;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CameraDepthFade;306;-2491.648,1081.027;Inherit;False;3;2;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;307;-2195.041,754.4483;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RangedFloatNode;26;-1115.084,-304.3846;Inherit;False;Property;_Desaturation;Desaturation;3;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;308;-2739.041,1065.448;Inherit;False;Property;_Glow_DistanceFade;Glow_DistanceFade;31;0;Create;True;0;0;0;False;0;False;25;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;327;-3911.35,1745.954;Inherit;False;GlowColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;290;-714.575,-497.5349;Inherit;False;Property;_Fuzzy_EdgeColor;Fuzzy_EdgeColor;15;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;88;-4187.41,1759.789;Inherit;False;Property;_GlowColor;GlowColor;23;0;Create;True;0;0;0;False;0;False;0,0.6745098,1,1;1,0.5098038,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;326;-126.9775,-287.3679;Inherit;False;325;DistanceLerp;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;329;1.022524,-415.3679;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;333;225.0225,-367.3679;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;334;-126.9775,-191.3678;Inherit;False;Property;_DistanceBrightnessToggle;DistanceBrightnessToggle;30;0;Create;True;0;0;0;False;0;False;0;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;331;-120.7677,-650.9673;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT3;0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.DesaturateOpNode;336;-297.7677,-570.9673;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;1;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;330;-289.7677,-677.9673;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;323;-506.6425,-608.0209;Inherit;False;Property;_DistanceBrightness;DistanceBrightness;29;0;Create;True;0;0;0;False;0;False;1;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;340;-549.012,-816.722;Inherit;False;Property;_DistanceColor;DistanceColor;24;0;Create;True;0;0;0;False;0;False;0.8962264,0.8512375,0.5191349,1;1,0.5098038,0,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;325;-2222.053,1129.486;Inherit;False;DistanceLerp;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
WireConnection;291;0;292;0
WireConnection;291;1;30;0
WireConnection;86;0;89;0
WireConnection;86;1;90;0
WireConnection;86;2;299;0
WireConnection;12;0;13;0
WireConnection;12;1;14;0
WireConnection;12;5;6;0
WireConnection;12;7;13;1
WireConnection;9;0;8;0
WireConnection;9;1;10;0
WireConnection;9;7;8;1
WireConnection;293;1;28;0
WireConnection;293;0;27;0
WireConnection;28;0;291;0
WireConnection;28;1;29;0
WireConnection;60;0;59;0
WireConnection;60;1;39;0
WireConnection;60;7;59;1
WireConnection;10;0;39;0
WireConnection;10;1;11;0
WireConnection;84;0;92;0
WireConnection;84;1;88;0
WireConnection;14;0;15;0
WireConnection;14;1;17;0
WireConnection;92;0;93;0
WireConnection;92;1;94;0
WireConnection;15;0;19;0
WireConnection;15;1;18;0
WireConnection;7;0;8;0
WireConnection;7;1;39;0
WireConnection;7;7;8;1
WireConnection;74;0;80;0
WireConnection;74;1;79;0
WireConnection;56;0;54;0
WireConnection;56;1;57;0
WireConnection;68;0;66;0
WireConnection;68;1;69;0
WireConnection;68;2;299;0
WireConnection;76;0;78;0
WireConnection;76;1;74;0
WireConnection;76;7;78;1
WireConnection;58;0;56;0
WireConnection;52;0;53;0
WireConnection;61;0;62;0
WireConnection;61;1;63;0
WireConnection;61;2;60;1
WireConnection;54;0;52;0
WireConnection;54;1;55;0
WireConnection;73;0;76;1
WireConnection;73;1;77;1
WireConnection;73;2;82;0
WireConnection;73;3;130;0
WireConnection;279;30;290;0
WireConnection;279;26;24;0
WireConnection;279;16;272;0
WireConnection;279;19;273;0
WireConnection;279;22;274;0
WireConnection;70;0;68;0
WireConnection;2;0;1;0
WireConnection;2;1;3;0
WireConnection;3;0;5;0
WireConnection;3;1;12;0
WireConnection;3;2;299;0
WireConnection;24;0;293;0
WireConnection;24;1;26;0
WireConnection;83;0;84;0
WireConnection;83;1;85;0
WireConnection;82;0;86;0
WireConnection;82;1;83;0
WireConnection;1;0;7;0
WireConnection;1;1;9;0
WireConnection;66;0;64;0
WireConnection;66;1;65;0
WireConnection;66;2;60;1
WireConnection;89;0;48;1
WireConnection;89;1;91;0
WireConnection;298;2;55;0
WireConnection;298;3;296;0
WireConnection;37;0;39;0
WireConnection;37;1;38;0
WireConnection;50;0;39;0
WireConnection;50;1;51;0
WireConnection;296;0;295;0
WireConnection;296;1;294;0
WireConnection;39;0;41;0
WireConnection;39;1;40;0
WireConnection;41;0;42;0
WireConnection;41;1;45;0
WireConnection;42;0;43;0
WireConnection;42;1;44;0
WireConnection;35;0;36;0
WireConnection;35;1;37;0
WireConnection;35;7;36;1
WireConnection;94;0;288;0
WireConnection;94;1;287;0
WireConnection;93;0;95;0
WireConnection;93;1;289;0
WireConnection;30;0;32;0
WireConnection;30;1;31;0
WireConnection;95;0;286;0
WireConnection;95;1;285;0
WireConnection;31;0;48;0
WireConnection;31;1;49;0
WireConnection;31;2;299;0
WireConnection;19;0;23;0
WireConnection;19;1;21;0
WireConnection;288;21;146;0
WireConnection;288;7;112;0
WireConnection;288;11;117;0
WireConnection;288;12;122;0
WireConnection;288;13;124;0
WireConnection;289;21;146;0
WireConnection;289;7;111;0
WireConnection;289;11;116;0
WireConnection;289;12;121;0
WireConnection;289;13;124;0
WireConnection;49;0;46;0
WireConnection;49;1;50;0
WireConnection;49;7;46;1
WireConnection;32;0;33;0
WireConnection;32;1;34;0
WireConnection;32;2;35;2
WireConnection;299;0;298;0
WireConnection;286;21;146;0
WireConnection;286;7;109;0
WireConnection;286;11;114;0
WireConnection;286;12;119;0
WireConnection;286;13;124;0
WireConnection;287;21;146;0
WireConnection;287;7;113;0
WireConnection;287;11;118;0
WireConnection;287;12;123;0
WireConnection;287;13;124;0
WireConnection;48;0;46;0
WireConnection;48;1;39;0
WireConnection;48;7;46;1
WireConnection;285;21;146;0
WireConnection;285;7;110;0
WireConnection;285;11;115;0
WireConnection;285;12;120;0
WireConnection;285;13;124;0
WireConnection;77;0;81;0
WireConnection;77;1;74;0
WireConnection;77;7;81;1
WireConnection;311;0;333;0
WireConnection;311;1;2;0
WireConnection;311;2;307;0
WireConnection;311;3;61;0
WireConnection;311;4;70;0
WireConnection;306;0;308;0
WireConnection;306;1;309;0
WireConnection;307;0;73;0
WireConnection;307;1;306;0
WireConnection;327;0;88;0
WireConnection;329;0;279;0
WireConnection;329;1;331;0
WireConnection;329;2;326;0
WireConnection;333;0;279;0
WireConnection;333;1;329;0
WireConnection;333;2;334;0
WireConnection;331;0;330;0
WireConnection;331;1;336;0
WireConnection;336;0;279;0
WireConnection;330;0;340;0
WireConnection;330;1;323;0
WireConnection;325;0;306;0
ASEEND*/
//CHKSM=657E0C93B20A6415C939B8560FB367F92FF84F64