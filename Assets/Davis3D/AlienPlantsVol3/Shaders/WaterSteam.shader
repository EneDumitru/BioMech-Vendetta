// Made with Amplify Shader Editor v1.9.2
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Davis3D/AlienPlants_Vol3/Enviroment/WaterSteam"
{
	Properties
	{
		_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,0.5)
		_MainTex ("Particle Texture", 2D) = "white" {}
		_InvFade ("Soft Particles Factor", Range(0.01,3.0)) = 1.0
		_Color("Color", Color) = (1,1,1,1)
		_Texture("Texture", 2D) = "white" {}
		_Opacity("Opacity", Float) = 1
		_FlowMap("FlowMap", 2D) = "white" {}
		_Flowmap_scale("Flowmap_scale", Float) = 1
		_Flowmap_Intensity("Flowmap_Intensity", Float) = 0.05
		_Flowmap_Speed("Flowmap_Speed", Float) = 0.5
		_DepthFade_Distance("DepthFade_Distance", Float) = 20
		_Distance_Fade_Distance("Distance_Fade_Distance", Float) = 3000
		_Distance_Fade_Hardness("Distance_Fade_Hardness", Float) = 0.5
		_Camera_Fade_Distance("Camera_Fade_Distance", Float) = 300
		_Camera_Fade_Hardness("Camera_Fade_Hardness", Float) = 0

	}


	Category 
	{
		SubShader
		{
		LOD 0

			Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" }
			Blend SrcAlpha OneMinusSrcAlpha
			ColorMask RGB
			Cull Off
			Lighting Off 
			ZWrite Off
			ZTest LEqual
			
			Pass {
			
				CGPROGRAM
				
				#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
				#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
				#endif
				
				#pragma vertex vert
				#pragma fragment frag
				#pragma target 2.0
				#pragma multi_compile_instancing
				#pragma multi_compile_particles
				#pragma multi_compile_fog
				#include "UnityShaderVariables.cginc"
				#define ASE_NEEDS_FRAG_COLOR


				#include "UnityCG.cginc"

				struct appdata_t 
				{
					float4 vertex : POSITION;
					fixed4 color : COLOR;
					float4 texcoord : TEXCOORD0;
					UNITY_VERTEX_INPUT_INSTANCE_ID
					
				};

				struct v2f 
				{
					float4 vertex : SV_POSITION;
					fixed4 color : COLOR;
					float4 texcoord : TEXCOORD0;
					UNITY_FOG_COORDS(1)
					#ifdef SOFTPARTICLES_ON
					float4 projPos : TEXCOORD2;
					#endif
					UNITY_VERTEX_INPUT_INSTANCE_ID
					UNITY_VERTEX_OUTPUT_STEREO
					float4 ase_texcoord3 : TEXCOORD3;
					float4 ase_texcoord4 : TEXCOORD4;
				};
				
				
				#if UNITY_VERSION >= 560
				UNITY_DECLARE_DEPTH_TEXTURE( _CameraDepthTexture );
				#else
				uniform sampler2D_float _CameraDepthTexture;
				#endif

				//Don't delete this comment
				// uniform sampler2D_float _CameraDepthTexture;

				uniform sampler2D _MainTex;
				uniform fixed4 _TintColor;
				uniform float4 _MainTex_ST;
				uniform float _InvFade;
				uniform float4 _Color;
				uniform float4 _CameraDepthTexture_TexelSize;
				uniform float _DepthFade_Distance;
				uniform sampler2D _Texture;
				uniform sampler2D _FlowMap;
				uniform float _Flowmap_scale;
				uniform float _Flowmap_Speed;
				uniform float _Flowmap_Intensity;
				uniform float _Opacity;
				uniform float _Camera_Fade_Distance;
				uniform float _Camera_Fade_Hardness;
				uniform float _Distance_Fade_Distance;
				uniform float _Distance_Fade_Hardness;


				v2f vert ( appdata_t v  )
				{
					v2f o;
					UNITY_SETUP_INSTANCE_ID(v);
					UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
					UNITY_TRANSFER_INSTANCE_ID(v, o);
					float4 ase_clipPos = UnityObjectToClipPos(v.vertex);
					float4 screenPos = ComputeScreenPos(ase_clipPos);
					o.ase_texcoord3 = screenPos;
					float3 ase_worldPos = mul(unity_ObjectToWorld, float4( (v.vertex).xyz, 1 )).xyz;
					o.ase_texcoord4.xyz = ase_worldPos;
					
					
					//setting value to unused interpolator channels and avoid initialization warnings
					o.ase_texcoord4.w = 0;

					v.vertex.xyz +=  float3( 0, 0, 0 ) ;
					o.vertex = UnityObjectToClipPos(v.vertex);
					#ifdef SOFTPARTICLES_ON
						o.projPos = ComputeScreenPos (o.vertex);
						COMPUTE_EYEDEPTH(o.projPos.z);
					#endif
					o.color = v.color;
					o.texcoord = v.texcoord;
					UNITY_TRANSFER_FOG(o,o.vertex);
					return o;
				}

				fixed4 frag ( v2f i  ) : SV_Target
				{
					UNITY_SETUP_INSTANCE_ID( i );
					UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( i );

					#ifdef SOFTPARTICLES_ON
						float sceneZ = LinearEyeDepth (SAMPLE_DEPTH_TEXTURE_PROJ(_CameraDepthTexture, UNITY_PROJ_COORD(i.projPos)));
						float partZ = i.projPos.z;
						float fade = saturate (_InvFade * (sceneZ-partZ));
						i.color.a *= fade;
					#endif

					float4 screenPos = i.ase_texcoord3;
					float4 ase_screenPosNorm = screenPos / screenPos.w;
					ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
					float screenDepth39 = LinearEyeDepth(SAMPLE_DEPTH_TEXTURE( _CameraDepthTexture, ase_screenPosNorm.xy ));
					float distanceDepth39 = saturate( abs( ( screenDepth39 - LinearEyeDepth( ase_screenPosNorm.z ) ) / ( _DepthFade_Distance ) ) );
					float2 texCoord21 = i.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
					float temp_output_2_0_g4 = ( _Time.y * _Flowmap_Speed );
					float2 texCoord28 = i.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
					float2 panner26 = ( temp_output_2_0_g4 * float2( 0.1,0.1 ) + texCoord28);
					float2 lerpResult20 = lerp( texCoord21 , (tex2D( _FlowMap, ( _Flowmap_scale * panner26 ) )).rg , _Flowmap_Intensity);
					float3 ase_worldPos = i.ase_texcoord4.xyz;
					float3 temp_output_5_0_g17 = ( ( ase_worldPos - _WorldSpaceCameraPos ) / _Camera_Fade_Distance );
					float dotResult8_g17 = dot( temp_output_5_0_g17 , temp_output_5_0_g17 );
					float3 temp_output_5_0_g18 = ( ( ase_worldPos - _WorldSpaceCameraPos ) / _Distance_Fade_Distance );
					float dotResult8_g18 = dot( temp_output_5_0_g18 , temp_output_5_0_g18 );
					float4 appendResult47 = (float4(_Color.r , _Color.g , _Color.b , saturate( ( ( ( distanceDepth39 * ( i.color.a * ( tex2D( _Texture, lerpResult20 ).g * _Opacity ) ) ) * ( 1.0 - pow( saturate( dotResult8_g17 ) , _Camera_Fade_Hardness ) ) ) * pow( saturate( dotResult8_g18 ) , _Distance_Fade_Hardness ) ) )));
					

					fixed4 col = appendResult47;
					UNITY_APPLY_FOG(i.fogCoord, col);
					return col;
				}
				ENDCG 
			}
		}	
	}
	CustomEditor "ASEMaterialInspector"
	
	Fallback Off
}
/*ASEBEGIN
Version=19200
Node;AmplifyShaderEditor.RangedFloatNode;30;-2964.892,27.35114;Inherit;False;Property;_Flowmap_Speed;Flowmap_Speed;6;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;28;-2777.892,-118.6489;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;29;-2762.892,34.35114;Inherit;False;TimeWithSpeedVariable;-1;;4;6c6258ddca69992488e84eb5db994d7b;0;1;3;FLOAT;0;False;2;FLOAT;0;FLOAT;5
Node;AmplifyShaderEditor.PannerNode;26;-2519.892,-119.6489;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0.1,0.1;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;27;-2522.892,-196.6489;Inherit;False;Property;_Flowmap_scale;Flowmap_scale;4;0;Create;True;0;0;0;False;0;False;1;2;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;25;-2319.177,-164.4199;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;23;-2144.221,-193.0592;Inherit;True;Property;_FlowMap;FlowMap;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;22;-1810.949,-93.47516;Inherit;False;Property;_Flowmap_Intensity;Flowmap_Intensity;5;0;Create;True;0;0;0;False;0;False;0.05;0.05;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;21;-1878.911,-310.4605;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;24;-1857.422,-191.7314;Inherit;False;True;True;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;20;-1615.765,-208.9928;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SamplerNode;19;-1425.891,-236.8762;Inherit;True;Property;_Texture;Texture;1;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;18;-1136.434,-76.21387;Inherit;False;Property;_Opacity;Opacity;2;0;Create;True;0;0;0;False;0;False;1;118.4;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;31;-1101.621,-455.589;Inherit;False;Property;_DepthFade_Distance;DepthFade_Distance;7;0;Create;True;0;0;0;False;0;False;20;20;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;38;-1042.534,-375.0952;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.WorldSpaceCameraPos;4;-1582.572,115.8475;Inherit;False;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;17;-987.7208,-162.5202;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;13;-1174.167,165.0005;Inherit;False;Property;_Camera_Fade_Distance;Camera_Fade_Distance;10;0;Create;True;0;0;0;False;0;False;300;300;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;14;-1179.167,236.0005;Inherit;False;Property;_Camera_Fade_Hardness;Camera_Fade_Hardness;11;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;49;-896.6675,138.5005;Inherit;False;SphereMask;-1;;17;988803ee12caf5f4690caee3c8c4a5bb;0;3;15;FLOAT3;0,0,0;False;14;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;16;-851.8231,-220.0603;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DepthFade;39;-696.4421,-288.0274;Inherit;False;True;True;True;2;1;FLOAT3;0,0,0;False;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;40;-426.7515,-177.6722;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;5;-827.2761,521.2541;Inherit;False;Property;_Distance_Fade_Distance;Distance_Fade_Distance;8;0;Create;True;0;0;0;False;0;False;3000;3000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;8;-600.8716,140.8169;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;6;-810.5,690.5;Inherit;False;Property;_Distance_Fade_Hardness;Distance_Fade_Hardness;9;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;48;-492.5,380.5;Inherit;False;SphereMask;-1;;18;988803ee12caf5f4690caee3c8c4a5bb;0;3;15;FLOAT3;0,0,0;False;14;FLOAT;0;False;12;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;7;-312.5488,106.2461;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;2;-214.9568,250.5;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;1;-80.5,-1.5;Inherit;False;Property;_Color;Color;0;0;Create;True;0;0;0;False;0;False;1,1,1,1;1,1,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SaturateNode;45;-27.84155,239.98;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;47;145.1584,45.98;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;46;309.5247,42.17775;Float;False;True;-1;2;ASEMaterialInspector;0;11;Davis3D/AlienPlants_Vol3/Enviroment/WaterSteam;0b6a9f8b4f707c74ca64c0be8e590de0;True;SubShader 0 Pass 0;0;0;SubShader 0 Pass 0;2;False;True;2;5;False;;10;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;True;True;True;True;False;0;False;;False;False;False;False;False;False;False;False;False;True;2;False;;True;3;False;;False;True;4;Queue=Transparent=Queue=0;IgnoreProjector=True;RenderType=Transparent=RenderType;PreviewType=Plane;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;29;3;30;0
WireConnection;26;0;28;0
WireConnection;26;1;29;0
WireConnection;25;0;27;0
WireConnection;25;1;26;0
WireConnection;23;1;25;0
WireConnection;24;0;23;0
WireConnection;20;0;21;0
WireConnection;20;1;24;0
WireConnection;20;2;22;0
WireConnection;19;1;20;0
WireConnection;17;0;19;2
WireConnection;17;1;18;0
WireConnection;49;15;4;0
WireConnection;49;14;13;0
WireConnection;49;12;14;0
WireConnection;16;0;38;4
WireConnection;16;1;17;0
WireConnection;39;0;31;0
WireConnection;40;0;39;0
WireConnection;40;1;16;0
WireConnection;8;0;49;0
WireConnection;48;15;4;0
WireConnection;48;14;5;0
WireConnection;48;12;6;0
WireConnection;7;0;40;0
WireConnection;7;1;8;0
WireConnection;2;0;7;0
WireConnection;2;1;48;0
WireConnection;45;0;2;0
WireConnection;47;0;1;1
WireConnection;47;1;1;2
WireConnection;47;2;1;3
WireConnection;47;3;45;0
WireConnection;46;0;47;0
ASEEND*/
//CHKSM=6DE6F407648E26896EBD8BDE09677831E29E6338