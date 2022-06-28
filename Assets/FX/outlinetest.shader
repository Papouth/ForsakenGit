Shader "Outline"
{
	Properties
	{
		[HDR] _EmissiveColor("HighlightColor", Color) = (2.996078, 2.996078, 2.996078, 0)
		[NoScaleOffset]_ObjectTexture("BaseMat", 2D) = "white" {}
		[NoScaleOffset]_EmissifMat("EmissifMat", 2D) = "white" {}
		[NoScaleOffset]_NormalMat("NormalMat", 2D) = "white" {}
		[HideInInspector]_EmissionColor("Color", Color) = (1, 1, 1, 1)
		[HideInInspector]_RenderQueueType("Float", Float) = 1
		[HideInInspector][ToggleUI]_AddPrecomputedVelocity("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_DepthOffsetEnable("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_ConservativeDepthOffsetEnable("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_TransparentWritingMotionVec("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_AlphaCutoffEnable("Boolean", Float) = 0
		[HideInInspector]_TransparentSortPriority("_TransparentSortPriority", Float) = 0
		[HideInInspector][ToggleUI]_UseShadowThreshold("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_DoubleSidedEnable("Boolean", Float) = 0
		[HideInInspector][Enum(Flip, 0, Mirror, 1, None, 2)]_DoubleSidedNormalMode("Float", Float) = 2
		[HideInInspector]_DoubleSidedConstants("Vector4", Vector) = (1, 1, -1, 0)
		[HideInInspector][Enum(Auto, 0, On, 1, Off, 2)]_DoubleSidedGIMode("Float", Float) = 0
		[HideInInspector][ToggleUI]_TransparentDepthPrepassEnable("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_TransparentDepthPostpassEnable("Boolean", Float) = 0
		[HideInInspector]_SurfaceType("Float", Float) = 0
		[HideInInspector]_BlendMode("Float", Float) = 0
		[HideInInspector]_SrcBlend("Float", Float) = 1
		[HideInInspector]_DstBlend("Float", Float) = 0
		[HideInInspector]_AlphaSrcBlend("Float", Float) = 1
		[HideInInspector]_AlphaDstBlend("Float", Float) = 0
		[HideInInspector][ToggleUI]_AlphaToMask("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_AlphaToMaskInspectorValue("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_ZWrite("Boolean", Float) = 1
		[HideInInspector][ToggleUI]_TransparentZWrite("Boolean", Float) = 0
		[HideInInspector]_CullMode("Float", Float) = 2
		[HideInInspector][ToggleUI]_EnableFogOnTransparent("Boolean", Float) = 1
		[HideInInspector]_CullModeForward("Float", Float) = 2
		[HideInInspector][Enum(Front, 1, Back, 2)]_TransparentCullMode("Float", Float) = 2
		[HideInInspector][Enum(UnityEditor.Rendering.HighDefinition.OpaqueCullMode)]_OpaqueCullMode("Float", Float) = 2
		[HideInInspector]_ZTestDepthEqualForOpaque("Float", Int) = 4
		[HideInInspector][Enum(UnityEngine.Rendering.CompareFunction)]_ZTestTransparent("Float", Float) = 4
		[HideInInspector][ToggleUI]_TransparentBackfaceEnable("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_RequireSplitLighting("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_ReceivesSSR("Boolean", Float) = 1
		[HideInInspector][ToggleUI]_ReceivesSSRTransparent("Boolean", Float) = 0
		[HideInInspector][ToggleUI]_EnableBlendModePreserveSpecularLighting("Boolean", Float) = 1
		[HideInInspector][ToggleUI]_SupportDecals("Boolean", Float) = 1
		[HideInInspector]_StencilRef("Float", Int) = 0
		[HideInInspector]_StencilWriteMask("Float", Int) = 6
		[HideInInspector]_StencilRefDepth("Float", Int) = 8
		[HideInInspector]_StencilWriteMaskDepth("Float", Int) = 8
		[HideInInspector]_StencilRefMV("Float", Int) = 40
		[HideInInspector]_StencilWriteMaskMV("Float", Int) = 40
		[HideInInspector]_StencilRefDistortionVec("Float", Int) = 4
		[HideInInspector]_StencilWriteMaskDistortionVec("Float", Int) = 4
		[HideInInspector]_StencilWriteMaskGBuffer("Float", Int) = 14
		[HideInInspector]_StencilRefGBuffer("Float", Int) = 10
		[HideInInspector]_ZTestGBuffer("Float", Int) = 4
		[HideInInspector][ToggleUI]_RayTracing("Boolean", Float) = 0
		[HideInInspector][Enum(None, 0, Box, 1, Sphere, 2, Thin, 3)]_RefractionModel("Float", Float) = 0
		[HideInInspector][NoScaleOffset]unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
		[HideInInspector][NoScaleOffset]unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
		[HideInInspector][NoScaleOffset]unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
		[HideInInspector]_BUILTIN_QueueOffset("Float", Float) = 0
		[HideInInspector]_BUILTIN_QueueControl("Float", Float) = -1
	}
		SubShader
		{
			Tags
			{
				"RenderPipeline" = "HDRenderPipeline"
				"RenderType" = "HDLitShader"
				"Queue" = "Geometry+225"
				"ShaderGraphShader" = "true"
				"ShaderGraphTargetId" = "HDLitSubTarget"
			}
			Pass
			{
				Name "ShadowCaster"
				Tags
				{
					"LightMode" = "ShadowCaster"
				}

			// Render State
			Cull[_CullMode]
		ZWrite On
		ColorMask 0
		ZClip[_ZClip]

			// Debug
			// <None>

			// --------------------------------------------------
			// Pass

			HLSLPROGRAM

			// Pragmas
			#pragma instancing_options renderinglayer
		#pragma target 4.5
		#pragma vertex Vert
		#pragma fragment Frag
		#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
		#pragma multi_compile_instancing

			// Keywords
			#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
		#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
		#pragma shader_feature_local _ _DOUBLESIDED_ON
		#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
		#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
		#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
		#pragma shader_feature_local_fragment _ _DISABLE_DECALS
		#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
		#pragma shader_feature_local_fragment _ _DISABLE_SSR
		#pragma shader_feature_local_raytracing _ _DISABLE_SSR
		#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
		#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
		#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
			// GraphKeywords: <None>

			// Early Instancing Defines
			// DotsInstancingOptions: <None>

			// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
			// HybridV1InjectedBuiltinProperties: <None>

			// For custom interpolators to inject a substruct definition before FragInputs definition,
			// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
			struct CustomInterpolators
		{
		};
		#define USE_CUSTOMINTERP_SUBSTRUCT



		// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
		#ifdef HAVE_VFX_MODIFICATION
		struct FragInputsVFX
		{
			/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
		};
		#endif

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

		// --------------------------------------------------
		// Defines

		// Attribute
		#define ATTRIBUTES_NEED_NORMAL
		#define ATTRIBUTES_NEED_TANGENT

		#define HAVE_MESH_MODIFICATION



		#define SHADERPASS SHADERPASS_SHADOWS


		// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
		// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
		// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
		// to still allow us to rename the field and keyword of this node without breaking existing code.
		#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
		#define RAYTRACING_SHADER_GRAPH_HIGH
		#endif

		#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
		#define RAYTRACING_SHADER_GRAPH_LOW
		#endif
		// end

		#ifndef SHADER_UNLIT
		// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
		// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
		#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
			#define VARYINGS_NEED_CULLFACE
		#endif
		#endif

		// Specific Material Define
	#define _SPECULAR_OCCLUSION_FROM_AO 1
	#define _ENERGY_CONSERVING_SPECULAR 1

	// If we use subsurface scattering, enable output split lighting (for forward pass)
	#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define OUTPUT_SPLIT_LIGHTING
	#endif

	// This shader support recursive rendering for raytracing
	#define HAVE_RECURSIVE_RENDERING
		// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

		// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
		// we should have a code like this:
		// if !defined(_DISABLE_SSR_TRANSPARENT)
		// pragma multi_compile _ WRITE_NORMAL_BUFFER
		// endif
		// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
		// it based on if SSR transparent in frame settings and not (and stripper can strip it).
		// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
		// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
		// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
			#define WRITE_NORMAL_BUFFER
		#endif
		#endif

		#ifndef DEBUG_DISPLAY
			// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
			// Don't do it with debug display mode as it is possible there is no depth prepass in this case
			#if !defined(_SURFACE_TYPE_TRANSPARENT)
				#if SHADERPASS == SHADERPASS_FORWARD
				#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
				#elif SHADERPASS == SHADERPASS_GBUFFER
				#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
				#endif
			#endif
		#endif

		// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
		#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
			#define _DEFERRED_CAPABLE_MATERIAL
		#endif

		// Translate transparent motion vector define
		#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
			#define _WRITE_TRANSPARENT_MOTION_VECTOR
		#endif

		// -- Graph Properties
		CBUFFER_START(UnityPerMaterial)
	float4 _EmissiveColor;
	float4 _ObjectTexture_TexelSize;
	float4 _EmissifMat_TexelSize;
	float4 _NormalMat_TexelSize;
	float4 _EmissionColor;
	float _UseShadowThreshold;
	float4 _DoubleSidedConstants;
	float _BlendMode;
	float _EnableBlendModePreserveSpecularLighting;
	float _RayTracing;
	float _RefractionModel;
	CBUFFER_END

		// Object and Global properties
		SAMPLER(SamplerState_Linear_Repeat);
		TEXTURE2D(_ObjectTexture);
		SAMPLER(sampler_ObjectTexture);
		TEXTURE2D(_EmissifMat);
		SAMPLER(sampler_EmissifMat);
		TEXTURE2D(_NormalMat);
		SAMPLER(sampler_NormalMat);

		// -- Property used by ScenePickingPass
		#ifdef SCENEPICKINGPASS
		float4 _SelectionID;
		#endif

		// -- Properties used by SceneSelectionPass
		#ifdef SCENESELECTIONPASS
		int _ObjectId;
		int _PassValue;
		#endif

		// Includes
		#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
	#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
		// GraphIncludes: <None>

		// --------------------------------------------------
		// Structs and Packing

		struct AttributesMesh
	{
		 float3 positionOS : POSITION;
		 float3 normalOS : NORMAL;
		 float4 tangentOS : TANGENT;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : INSTANCEID_SEMANTIC;
		#endif
	};
	struct VaryingsMeshToPS
	{
		SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : CUSTOM_INSTANCE_ID;
		#endif
	};
	struct VertexDescriptionInputs
	{
		 float3 ObjectSpaceNormal;
		 float3 ObjectSpaceTangent;
		 float3 ObjectSpacePosition;
	};
	struct SurfaceDescriptionInputs
	{
	};
	struct PackedVaryingsMeshToPS
	{
		SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : CUSTOM_INSTANCE_ID;
		#endif
	};

		PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
	{
		PackedVaryingsMeshToPS output;
		ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
		output.positionCS = input.positionCS;
		#if UNITY_ANY_INSTANCING_ENABLED
		output.instanceID = input.instanceID;
		#endif
		return output;
	}

	VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
	{
		VaryingsMeshToPS output;
		output.positionCS = input.positionCS;
		#if UNITY_ANY_INSTANCING_ENABLED
		output.instanceID = input.instanceID;
		#endif
		return output;
	}


	// --------------------------------------------------
	// Graph


	// Graph Functions
	// GraphFunctions: <None>

	// Graph Vertex
	struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float Alpha;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	surface.Alpha = 1;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position


#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;


	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit


	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "META"
	Tags
	{
		"LightMode" = "META"
	}

	// Render State
	Cull Off

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ EDITOR_VISUALIZATION
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define ATTRIBUTES_NEED_TEXCOORD3
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_POSITIONPREDISPLACEMENT_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2
#define VARYINGS_NEED_TEXCOORD3

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_LIGHT_TRANSPORT
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	 float4 uv1 : TEXCOORD1;
	 float4 uv2 : TEXCOORD2;
	 float4 uv3 : TEXCOORD3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 positionPredisplacementRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	 float4 texCoord1;
	 float4 texCoord2;
	 float4 texCoord3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float3 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	 float4 interp4 : INTERP4;
	 float4 interp5 : INTERP5;
	 float4 interp6 : INTERP6;
	 float4 interp7 : INTERP7;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.positionPredisplacementRWS;
	output.interp2.xyz = input.normalWS;
	output.interp3.xyzw = input.tangentWS;
	output.interp4.xyzw = input.texCoord0;
	output.interp5.xyzw = input.texCoord1;
	output.interp6.xyzw = input.texCoord2;
	output.interp7.xyzw = input.texCoord3;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.positionPredisplacementRWS = input.interp1.xyz;
	output.normalWS = input.interp2.xyz;
	output.tangentWS = input.interp3.xyzw;
	output.texCoord0 = input.interp4.xyzw;
	output.texCoord1 = input.interp5.xyzw;
	output.texCoord2 = input.interp6.xyzw;
	output.texCoord3 = input.interp7.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);


	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results

	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorVertMeshCustomInterpolation' */

	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.positionPredisplacementRWS = input.positionPredisplacementRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;
	output.texCoord1 = input.texCoord1;
	output.texCoord2 = input.texCoord2;
	output.texCoord3 = input.texCoord3;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorVaryingsToFragInputs' */

	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassLightTransport.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "ScenePickingPass"
	Tags
	{
		"LightMode" = "Picking"
	}

	// Render State
	Cull[_CullMode]

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma instancing_options renderinglayer
#pragma editor_sync_compilation
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_DEPTH_ONLY
#define SCENEPICKINGPASS 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "SceneSelectionPass"
	Tags
	{
		"LightMode" = "SceneSelectionPass"
	}

	// Render State
	Cull Off

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma instancing_options renderinglayer
#pragma editor_sync_compilation
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_DEPTH_ONLY
#define RAYTRACING_SHADER_GRAPH_DEFAULT
#define SCENESELECTIONPASS 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/PickingSpaceTransforms.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "MotionVectors"
	Tags
	{
		"LightMode" = "MotionVectors"
	}

	// Render State
	Cull[_CullMode]
ZWrite On
Stencil
{
WriteMask[_StencilWriteMaskMV]
Ref[_StencilRefMV]
CompFront Always
PassFront Replace
CompBack Always
PassBack Replace
}

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ WRITE_NORMAL_BUFFER
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ WRITE_DECAL_BUFFER
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_MOTION_VECTORS
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	 float4 uv1 : TEXCOORD1;
	 float4 uv2 : TEXCOORD2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	 float4 texCoord1;
	 float4 texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	 float4 interp4 : INTERP4;
	 float4 interp5 : INTERP5;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	output.interp4.xyzw = input.texCoord1;
	output.interp5.xyzw = input.texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	output.texCoord1 = input.interp4.xyzw;
	output.texCoord2 = input.interp5.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;
	output.texCoord1 = input.texCoord1;
	output.texCoord2 = input.texCoord2;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassMotionVectors.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "TransparentDepthPrepass"
	Tags
	{
		"LightMode" = "TransparentDepthPrepass"
	}

	// Render State
	Cull[_CullMode]
Blend One Zero
ZWrite On
Stencil
{
WriteMask[_StencilWriteMaskDepth]
Ref[_StencilRefDepth]
CompFront Always
PassFront Replace
CompBack Always
PassBack Replace
}

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define VARYINGS_NEED_TANGENT_TO_WORLD

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_TRANSPARENT_DEPTH_PREPASS
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 normalWS;
	 float4 tangentWS;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 TangentSpaceNormal;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float4 interp1 : INTERP1;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.normalWS;
	output.interp1.xyzw = input.tangentWS;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.normalWS = input.interp0.xyz;
	output.tangentWS = input.interp1.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions
// GraphFunctions: <None>

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float Alpha;
	float3 NormalTS;
	float Smoothness;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	surface.Alpha = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Smoothness = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit


	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "FullScreenDebug"
	Tags
	{
		"LightMode" = "FullScreenDebug"
	}

	// Render State
	Cull[_CullMode]
ZTest LEqual
ZWrite Off

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_FULL_SCREEN_DEBUG
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassFullScreenDebug.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "DepthOnly"
	Tags
	{
		"LightMode" = "DepthOnly"
	}

	// Render State
	Cull[_CullMode]
ZWrite On
Stencil
{
WriteMask[_StencilWriteMaskDepth]
Ref[_StencilRefDepth]
CompFront Always
PassFront Replace
CompBack Always
PassBack Replace
}

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma multi_compile _ WRITE_NORMAL_BUFFER
#pragma multi_compile_fragment _ WRITE_MSAA_DEPTH
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ WRITE_DECAL_BUFFER
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_DEPTH_ONLY
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassDepthOnly.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "GBuffer"
	Tags
	{
		"LightMode" = "GBuffer"
	}

	// Render State
	Cull[_CullMode]
ZTest[_ZTestGBuffer]
Stencil
{
WriteMask[_StencilWriteMaskGBuffer]
Ref[_StencilRefGBuffer]
CompFront Always
PassFront Replace
CompBack Always
PassBack Replace
}

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma multi_compile_fragment _ LIGHT_LAYERS
#pragma multi_compile_raytracing _ LIGHT_LAYERS
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ DEBUG_DISPLAY
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ LIGHTMAP_ON
#pragma multi_compile _ DIRLIGHTMAP_COMBINED
#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile _ DYNAMICLIGHTMAP_ON
#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
#pragma multi_compile_raytracing _ SHADOWS_SHADOWMASK
#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_GBUFFER
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	 float4 uv1 : TEXCOORD1;
	 float4 uv2 : TEXCOORD2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	 float4 texCoord1;
	 float4 texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	 float4 interp4 : INTERP4;
	 float4 interp5 : INTERP5;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	output.interp4.xyzw = input.texCoord1;
	output.interp5.xyzw = input.texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	output.texCoord1 = input.interp4.xyzw;
	output.texCoord2 = input.interp5.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
	float4 VTPackedFeedback;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	{
		surface.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
	}
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;
	output.texCoord1 = input.texCoord1;
	output.texCoord2 = input.texCoord2;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassGBuffer.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "Forward"
	Tags
	{
		"LightMode" = "Forward"
	}

	// Render State
	Cull[_CullModeForward]
Blend[_SrcBlend][_DstBlend],[_AlphaSrcBlend][_AlphaDstBlend]
ZTest[_ZTestDepthEqualForOpaque]
ZWrite[_ZWrite]
ColorMask[_ColorMaskTransparentVelOne] 1
ColorMask[_ColorMaskTransparentVelTwo] 2
Stencil
{
WriteMask[_StencilWriteMask]
Ref[_StencilRef]
CompFront Always
PassFront Replace
CompBack Always
PassBack Replace
}

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma instancing_options renderinglayer
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ DEBUG_DISPLAY
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ LIGHTMAP_ON
#pragma multi_compile _ DIRLIGHTMAP_COMBINED
#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile _ DYNAMICLIGHTMAP_ON
#pragma multi_compile_fragment _ SHADOWS_SHADOWMASK
#pragma multi_compile_raytracing _ SHADOWS_SHADOWMASK
#pragma multi_compile_fragment DECALS_OFF DECALS_3RT DECALS_4RT
#pragma multi_compile_fragment _ DECAL_SURFACE_GRADIENT
#pragma multi_compile_fragment SHADOW_LOW SHADOW_MEDIUM SHADOW_HIGH SHADOW_VERY_HIGH
#pragma multi_compile_fragment SCREEN_SPACE_SHADOWS_OFF SCREEN_SPACE_SHADOWS_ON
#pragma multi_compile_fragment USE_FPTL_LIGHTLIST USE_CLUSTERED_LIGHTLIST
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_FORWARD
#define SUPPORT_BLENDMODE_PRESERVE_SPECULAR_LIGHTING 1
#define HAS_LIGHTLOOP 1
#define RAYTRACING_SHADER_GRAPH_DEFAULT
#define SHADER_LIT 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	 float4 uv1 : TEXCOORD1;
	 float4 uv2 : TEXCOORD2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	 float4 texCoord1;
	 float4 texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	 float4 interp4 : INTERP4;
	 float4 interp5 : INTERP5;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	output.interp4.xyzw = input.texCoord1;
	output.interp5.xyzw = input.texCoord2;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	output.texCoord1 = input.interp4.xyzw;
	output.texCoord2 = input.interp5.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
	float4 VTPackedFeedback;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	{
		surface.VTPackedFeedback = float4(1.0f,1.0f,1.0f,1.0f);
	}
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;
	output.texCoord1 = input.texCoord1;
	output.texCoord2 = input.texCoord2;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	builtinData.vtPackedFeedback = surfaceDescription.VTPackedFeedback;
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassForward.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "RayTracingPrepass"
	Tags
	{
		"LightMode" = "RayTracingPrepass"
	}

	// Render State
	Cull[_CullMode]
Blend One Zero
ZWrite On

// Debug
// <None>

// --------------------------------------------------
// Pass

HLSLPROGRAM

// Pragmas
#pragma target 4.5
#pragma vertex Vert
#pragma fragment Frag
#pragma only_renderers d3d11 playstation xboxone xboxseries vulkan metal switch
#pragma multi_compile_instancing

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	struct CustomInterpolators
{
};
#define USE_CUSTOMINTERP_SUBSTRUCT



// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
#ifdef HAVE_VFX_MODIFICATION
struct FragInputsVFX
{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0

#define HAVE_MESH_MODIFICATION



#define SHADERPASS SHADERPASS_CONSTANT
#define RAYTRACING_SHADER_GRAPH_DEFAULT


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Debug/DebugDisplay.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/NormalSurfaceGradient.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Decal/DecalUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitDecalData.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct AttributesMesh
{
	 float3 positionOS : POSITION;
	 float3 normalOS : NORMAL;
	 float4 tangentOS : TANGENT;
	 float4 uv0 : TEXCOORD0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : INSTANCEID_SEMANTIC;
	#endif
};
struct VaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 positionRWS;
	 float3 normalWS;
	 float4 tangentWS;
	 float4 texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};
struct VertexDescriptionInputs
{
	 float3 ObjectSpaceNormal;
	 float3 ObjectSpaceTangent;
	 float3 ObjectSpacePosition;
};
struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};
struct PackedVaryingsMeshToPS
{
	SV_POSITION_QUALIFIERS float4 positionCS : SV_POSITION;
	 float3 interp0 : INTERP0;
	 float3 interp1 : INTERP1;
	 float4 interp2 : INTERP2;
	 float4 interp3 : INTERP3;
	#if UNITY_ANY_INSTANCING_ENABLED
	 uint instanceID : CUSTOM_INSTANCE_ID;
	#endif
};

	PackedVaryingsMeshToPS PackVaryingsMeshToPS(VaryingsMeshToPS input)
{
	PackedVaryingsMeshToPS output;
	ZERO_INITIALIZE(PackedVaryingsMeshToPS, output);
	output.positionCS = input.positionCS;
	output.interp0.xyz = input.positionRWS;
	output.interp1.xyz = input.normalWS;
	output.interp2.xyzw = input.tangentWS;
	output.interp3.xyzw = input.texCoord0;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}

VaryingsMeshToPS UnpackVaryingsMeshToPS(PackedVaryingsMeshToPS input)
{
	VaryingsMeshToPS output;
	output.positionCS = input.positionCS;
	output.positionRWS = input.interp0.xyz;
	output.normalWS = input.interp1.xyz;
	output.tangentWS = input.interp2.xyzw;
	output.texCoord0 = input.interp3.xyzw;
	#if UNITY_ANY_INSTANCING_ENABLED
	output.instanceID = input.instanceID;
	#endif
	return output;
}


// --------------------------------------------------
// Graph


// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
struct VertexDescription
{
	float3 Position;
	float3 Normal;
	float3 Tangent;
};

VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
{
	VertexDescription description = (VertexDescription)0;
	description.Position = IN.ObjectSpacePosition;
	description.Normal = IN.ObjectSpaceNormal;
	description.Tangent = IN.ObjectSpaceTangent;
	return description;
}

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif

VertexDescriptionInputs AttributesMeshToVertexDescriptionInputs(AttributesMesh input)
{
	VertexDescriptionInputs output;
	ZERO_INITIALIZE(VertexDescriptionInputs, output);

	output.ObjectSpaceNormal = input.normalOS;
	output.ObjectSpaceTangent = input.tangentOS.xyz;
	output.ObjectSpacePosition = input.positionOS;

	return output;
}

AttributesMesh ApplyMeshModification(AttributesMesh input, float3 timeParameters
#ifdef USE_CUSTOMINTERP_SUBSTRUCT
	#ifdef TESSELLATION_ON
	, inout VaryingsMeshToDS varyings
	#else
	, inout VaryingsMeshToPS varyings
	#endif
#endif
#ifdef HAVE_VFX_MODIFICATION
		, AttributesElement element
#endif
	)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	// Override time parameters with used one (This is required to correctly handle motion vector for vertex animation based on time)

	// evaluate vertex graph
#ifdef HAVE_VFX_MODIFICATION
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	// Fetch the vertex graph properties for the particle instance.
	GetElementVertexProperties(element, properties);

	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs, properties);
#else
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
#endif

	// copy graph output to the results
	input.positionOS = vertexDescription.Position;
	input.normalOS = vertexDescription.Normal;
	input.tangentOS.xyz = vertexDescription.Tangent;



	return input;
}

#if defined(_ADD_CUSTOM_VELOCITY) // For shader graph custom velocity
// Return precomputed Velocity in object space
float3 GetCustomVelocity(AttributesMesh input)
{
	// build graph inputs
	VertexDescriptionInputs vertexDescriptionInputs = AttributesMeshToVertexDescriptionInputs(input);
	VertexDescription vertexDescription = VertexDescriptionFunction(vertexDescriptionInputs);
	return vertexDescription.CustomVelocity;
}
#endif

FragInputs BuildFragInputs(VaryingsMeshToPS input)
{
	FragInputs output;
	ZERO_INITIALIZE(FragInputs, output);

	// Init to some default value to make the computer quiet (else it output 'divide by zero' warning even if value is not used).
	// TODO: this is a really poor workaround, but the variable is used in a bunch of places
	// to compute normals which are then passed on elsewhere to compute other values...
	output.tangentToWorld = k_identity3x3;
	output.positionSS = input.positionCS;       // input.positionCS is SV_Position

	output.positionRWS = input.positionRWS;
	output.tangentToWorld = BuildTangentToWorld(input.tangentWS, input.normalWS);
	output.texCoord0 = input.texCoord0;

#ifdef HAVE_VFX_MODIFICATION
	// FragInputs from VFX come from two places: Interpolator or CBuffer.
	/* WARNING: $splice Could not find named fragment 'VFXSetFragInputs' */

#endif

	// splice point to copy custom interpolator fields from varyings to frag inputs


	return output;
}

// existing HDRP code uses the combined function to go directly from packed to frag inputs
FragInputs UnpackVaryingsMeshToFragInputs(PackedVaryingsMeshToPS input)
{
	UNITY_SETUP_INSTANCE_ID(input);
	VaryingsMeshToPS unpacked = UnpackVaryingsMeshToPS(input);
	return BuildFragInputs(unpacked);
}
	SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI


	return output;
}

	// --------------------------------------------------
	// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassConstant.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
		}
			SubShader
{
	Tags
	{
		"RenderPipeline" = "HDRenderPipeline"
		"RenderType" = "HDLitShader"
		"Queue" = "Geometry+225"
		"ShaderGraphShader" = "true"
		"ShaderGraphTargetId" = "HDLitSubTarget"
	}
	Pass
	{
		Name "IndirectDXR"
		Tags
		{
			"LightMode" = "IndirectDXR"
		}

	// Render State
	// RenderState: <None>

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 5.0
#pragma raytracing surface_shader
#pragma only_renderers d3d11 ps5

	// Keywords
	#pragma multi_compile _ MULTI_BOUNCE_INDIRECT
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ DEBUG_DISPLAY
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ LIGHTMAP_ON
#pragma multi_compile _ DIRLIGHTMAP_COMBINED
#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile _ DYNAMICLIGHTMAP_ON
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2




#define SHADERPASS SHADERPASS_RAYTRACING_INDIRECT
#define SHADOW_LOW
#define RAYTRACING_SHADER_GRAPH_RAYTRACED
#define HAS_LIGHTLOOP 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};

	//Interpolator Packs: <None>

	// --------------------------------------------------
	// Graph


	// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
// GraphVertex: <None>

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif
SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

// --------------------------------------------------
// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingIndirect.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "VisibilityDXR"
	Tags
	{
		"LightMode" = "VisibilityDXR"
	}

	// Render State
	// RenderState: <None>

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 5.0
#pragma raytracing surface_shader
#pragma only_renderers d3d11 ps5

	// Keywords
	#pragma multi_compile _ TRANSPARENT_COLOR_SHADOW
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0




#define SHADERPASS SHADERPASS_RAYTRACING_VISIBILITY
#define RAYTRACING_SHADER_GRAPH_RAYTRACED


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};

	//Interpolator Packs: <None>

	// --------------------------------------------------
	// Graph


	// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
// GraphVertex: <None>

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif
SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

// --------------------------------------------------
// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingVisibility.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "ForwardDXR"
	Tags
	{
		"LightMode" = "ForwardDXR"
	}

	// Render State
	// RenderState: <None>

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 5.0
#pragma raytracing surface_shader
#pragma only_renderers d3d11 ps5

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ DEBUG_DISPLAY
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ LIGHTMAP_ON
#pragma multi_compile _ DIRLIGHTMAP_COMBINED
#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile _ DYNAMICLIGHTMAP_ON
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2




#define SHADERPASS SHADERPASS_RAYTRACING_FORWARD
#define SHADOW_LOW
#define RAYTRACING_SHADER_GRAPH_RAYTRACED
#define HAS_LIGHTLOOP 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};

	//Interpolator Packs: <None>

	// --------------------------------------------------
	// Graph


	// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
// GraphVertex: <None>

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif
SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

// --------------------------------------------------
// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingForward.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "GBufferDXR"
	Tags
	{
		"LightMode" = "GBufferDXR"
	}

	// Render State
	// RenderState: <None>

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 5.0
#pragma raytracing surface_shader
#pragma only_renderers d3d11 ps5

	// Keywords
	#pragma multi_compile _ MINIMAL_GBUFFER
#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma multi_compile _ DEBUG_DISPLAY
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma multi_compile _ LIGHTMAP_ON
#pragma multi_compile _ DIRLIGHTMAP_COMBINED
#pragma multi_compile_fragment PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile_raytracing PROBE_VOLUMES_OFF PROBE_VOLUMES_L1 PROBE_VOLUMES_L2
#pragma multi_compile _ DYNAMICLIGHTMAP_ON
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2




#define SHADERPASS SHADERPASS_RAYTRACING_GBUFFER
#define SHADOW_LOW
#define RAYTRACING_SHADER_GRAPH_RAYTRACED


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/Deferred/RaytracingIntersectonGBuffer.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/StandardLit/StandardLit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};

	//Interpolator Packs: <None>

	// --------------------------------------------------
	// Graph


	// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
// GraphVertex: <None>

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif
SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

// --------------------------------------------------
// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassRaytracingGBuffer.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
Pass
{
	Name "PathTracingDXR"
	Tags
	{
		"LightMode" = "PathTracingDXR"
	}

	// Render State
	// RenderState: <None>

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 5.0
#pragma raytracing surface_shader
#pragma only_renderers d3d11 ps5

	// Keywords
	#pragma shader_feature _ _SURFACE_TYPE_TRANSPARENT
#pragma shader_feature_local _BLENDMODE_OFF _BLENDMODE_ALPHA _BLENDMODE_ADD _BLENDMODE_PRE_MULTIPLY
#pragma shader_feature_local _ _DOUBLESIDED_ON
#pragma shader_feature_local _ _ADD_PRECOMPUTED_VELOCITY
#pragma shader_feature_local _ _TRANSPARENT_WRITES_MOTION_VEC
#pragma shader_feature_local_fragment _ _ENABLE_FOG_ON_TRANSPARENT
#pragma shader_feature_local_fragment _ _DISABLE_DECALS
#pragma shader_feature_local_raytracing _ _DISABLE_DECALS
#pragma shader_feature_local_fragment _ _DISABLE_SSR
#pragma shader_feature_local_raytracing _ _DISABLE_SSR
#pragma shader_feature_local_fragment _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local_raytracing _ _DISABLE_SSR_TRANSPARENT
#pragma shader_feature_local _REFRACTION_OFF _REFRACTION_PLANE _REFRACTION_SPHERE _REFRACTION_THIN
	// GraphKeywords: <None>

	// Early Instancing Defines
	// DotsInstancingOptions: <None>

	// Injected Instanced Properties (must be included before UnityInstancing.hlsl)
	// HybridV1InjectedBuiltinProperties: <None>

	// For custom interpolators to inject a substruct definition before FragInputs definition,
	// allowing for FragInputs to capture CI's intended for ShaderGraph's SDI.
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreInclude' */


	// TODO: Merge FragInputsVFX substruct with CustomInterpolators.
	#ifdef HAVE_VFX_MODIFICATION
	struct FragInputsVFX
	{
	/* WARNING: $splice Could not find named fragment 'FragInputsVFX' */
};
#endif

#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl" // Required by Tessellation.hlsl
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Tessellation.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderVariables.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/FragInputs.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPass.cs.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl" // Required to be include before we include properties as it define DECLARE_STACK_CB
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphHeader.hlsl" // Need to be here for Gradient struct definition

// --------------------------------------------------
// Defines

// Attribute
#define ATTRIBUTES_NEED_NORMAL
#define ATTRIBUTES_NEED_TANGENT
#define ATTRIBUTES_NEED_TEXCOORD0
#define ATTRIBUTES_NEED_TEXCOORD1
#define ATTRIBUTES_NEED_TEXCOORD2
#define VARYINGS_NEED_POSITION_WS
#define VARYINGS_NEED_TANGENT_TO_WORLD
#define VARYINGS_NEED_TEXCOORD0
#define VARYINGS_NEED_TEXCOORD1
#define VARYINGS_NEED_TEXCOORD2




#define SHADERPASS SHADERPASS_PATH_TRACING
#define SHADOW_LOW
#define RAYTRACING_SHADER_GRAPH_DEFAULT
#define HAS_LIGHTLOOP 1


	// Following two define are a workaround introduce in 10.1.x for RaytracingQualityNode
	// The ShaderGraph don't support correctly migration of this node as it serialize all the node data
	// in the json file making it impossible to uprgrade. Until we get a fix, we do a workaround here
	// to still allow us to rename the field and keyword of this node without breaking existing code.
	#ifdef RAYTRACING_SHADER_GRAPH_DEFAULT
	#define RAYTRACING_SHADER_GRAPH_HIGH
	#endif

	#ifdef RAYTRACING_SHADER_GRAPH_RAYTRACED
	#define RAYTRACING_SHADER_GRAPH_LOW
	#endif
	// end

	#ifndef SHADER_UNLIT
	// We need isFrontFace when using double sided - it is not required for unlit as in case of unlit double sided only drive the cullmode
	// VARYINGS_NEED_CULLFACE can be define by VaryingsMeshToPS.FaceSign input if a IsFrontFace Node is included in the shader graph.
	#if defined(_DOUBLESIDED_ON) && !defined(VARYINGS_NEED_CULLFACE)
		#define VARYINGS_NEED_CULLFACE
	#endif
	#endif

	// Specific Material Define
#define _SPECULAR_OCCLUSION_FROM_AO 1
#define _ENERGY_CONSERVING_SPECULAR 1

// If we use subsurface scattering, enable output split lighting (for forward pass)
#if defined(_MATERIAL_FEATURE_SUBSURFACE_SCATTERING) && !defined(_SURFACE_TYPE_TRANSPARENT)
	#define OUTPUT_SPLIT_LIGHTING
#endif

// This shader support recursive rendering for raytracing
#define HAVE_RECURSIVE_RENDERING
	// Caution: we can use the define SHADER_UNLIT onlit after the above Material include as it is the Unlit template who define it

	// To handle SSR on transparent correctly with a possibility to enable/disable it per framesettings
	// we should have a code like this:
	// if !defined(_DISABLE_SSR_TRANSPARENT)
	// pragma multi_compile _ WRITE_NORMAL_BUFFER
	// endif
	// i.e we enable the multicompile only if we can receive SSR or not, and then C# code drive
	// it based on if SSR transparent in frame settings and not (and stripper can strip it).
	// this is currently not possible with our current preprocessor as _DISABLE_SSR_TRANSPARENT is a keyword not a define
	// so instead we used this and chose to pay the extra cost of normal write even if SSR transaprent is disabled.
	// Ideally the shader graph generator should handle it but condition below can't be handle correctly for now.
	#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
	#if !defined(_DISABLE_SSR_TRANSPARENT) && !defined(SHADER_UNLIT)
		#define WRITE_NORMAL_BUFFER
	#endif
	#endif

	#ifndef DEBUG_DISPLAY
		// In case of opaque we don't want to perform the alpha test, it is done in depth prepass and we use depth equal for ztest (setup from UI)
		// Don't do it with debug display mode as it is possible there is no depth prepass in this case
		#if !defined(_SURFACE_TYPE_TRANSPARENT)
			#if SHADERPASS == SHADERPASS_FORWARD
			#define SHADERPASS_FORWARD_BYPASS_ALPHA_TEST
			#elif SHADERPASS == SHADERPASS_GBUFFER
			#define SHADERPASS_GBUFFER_BYPASS_ALPHA_TEST
			#endif
		#endif
	#endif

	// Define _DEFERRED_CAPABLE_MATERIAL for shader capable to run in deferred pass
	#if defined(SHADER_LIT) && !defined(_SURFACE_TYPE_TRANSPARENT)
		#define _DEFERRED_CAPABLE_MATERIAL
	#endif

	// Translate transparent motion vector define
	#if defined(_TRANSPARENT_WRITES_MOTION_VEC) && defined(_SURFACE_TYPE_TRANSPARENT)
		#define _WRITE_TRANSPARENT_MOTION_VECTOR
	#endif

	// -- Graph Properties
	CBUFFER_START(UnityPerMaterial)
float4 _EmissiveColor;
float4 _ObjectTexture_TexelSize;
float4 _EmissifMat_TexelSize;
float4 _NormalMat_TexelSize;
float4 _EmissionColor;
float _UseShadowThreshold;
float4 _DoubleSidedConstants;
float _BlendMode;
float _EnableBlendModePreserveSpecularLighting;
float _RayTracing;
float _RefractionModel;
CBUFFER_END

// Object and Global properties
SAMPLER(SamplerState_Linear_Repeat);
TEXTURE2D(_ObjectTexture);
SAMPLER(sampler_ObjectTexture);
TEXTURE2D(_EmissifMat);
SAMPLER(sampler_EmissifMat);
TEXTURE2D(_NormalMat);
SAMPLER(sampler_NormalMat);

// -- Property used by ScenePickingPass
#ifdef SCENEPICKINGPASS
float4 _SelectionID;
#endif

// -- Properties used by SceneSelectionPass
#ifdef SCENESELECTIONPASS
int _ObjectId;
int _PassValue;
#endif

// Includes
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingMacros.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Material.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/ShaderVariablesRaytracingLightLoop.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RaytracingIntersection.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/Lighting.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightLoop/LightLoopDef.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/Lit.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/Lit/LitPathTracing.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/BuiltinUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/Material/MaterialUtilities.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/Raytracing/Shaders/RayTracingCommon.hlsl"
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/ShaderGraphFunctions.hlsl"
	// GraphIncludes: <None>

	// --------------------------------------------------
	// Structs and Packing

	struct SurfaceDescriptionInputs
{
	 float3 WorldSpaceNormal;
	 float3 TangentSpaceNormal;
	 float3 WorldSpaceViewDirection;
	 float3 ViewSpacePosition;
	 float4 uv0;
	 float3 TimeParameters;
};

	//Interpolator Packs: <None>

	// --------------------------------------------------
	// Graph


	// Graph Functions

void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
{
	Out = Base - Blend;
	Out = lerp(Base, Out, Opacity);
}

void Unity_Multiply_float_float(float A, float B, out float Out)
{
	Out = A * B;
}

void Unity_Subtract_float(float A, float B, out float Out)
{
	Out = A - B;
}

void Unity_Cosine_float(float In, out float Out)
{
	Out = cos(In);
}

void Unity_Clamp_float(float In, float Min, float Max, out float Out)
{
	Out = clamp(In, Min, Max);
}

void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
{
	Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
}

void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
{
	Out = lerp(A, B, T);
}

// Graph Vertex
// GraphVertex: <None>

// Graph Pixel
struct SurfaceDescription
{
	float3 BaseColor;
	float3 Emission;
	float Alpha;
	float3 BentNormal;
	float Smoothness;
	float Occlusion;
	float3 NormalTS;
	float Metallic;
};

SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
{
	SurfaceDescription surface = (SurfaceDescription)0;
	UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
	float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
	float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
	UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
	float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
	float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
	float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
	Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
	float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
	float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
	Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
	float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
	float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
	float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
	float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
	float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
	Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
	float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
	Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
	float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
	Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
	float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
	Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
	float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
	Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
	float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
	Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
	float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
	Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
	UnityTexture2D _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0 = UnityBuildTexture2DStructNoScale(_NormalMat);
	float4 _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0 = SAMPLE_TEXTURE2D(_Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.tex, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.samplerstate, _Property_61793d7dd0714dce8c11dc64b80b25fa_Out_0.GetTransformedUV(IN.uv0.xy));
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_R_4 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.r;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_G_5 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.g;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_B_6 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.b;
	float _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_A_7 = _SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.a;
	surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
	surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
	surface.Alpha = 1;
	surface.BentNormal = (_SampleTexture2D_9544b1c6f8fc4c469a6d9a4f0fbdc5cb_RGBA_0.xyz);
	surface.Smoothness = 0.5;
	surface.Occlusion = 1;
	surface.NormalTS = IN.TangentSpaceNormal;
	surface.Metallic = 0.5;
	return surface;
}

// --------------------------------------------------
// Build Graph Inputs
#ifdef HAVE_VFX_MODIFICATION
#define VFX_SRP_ATTRIBUTES AttributesMesh
#define VaryingsMeshType VaryingsMeshToPS
#define VFX_SRP_VARYINGS VaryingsMeshType
#define VFX_SRP_SURFACE_INPUTS FragInputs
#endif
SurfaceDescriptionInputs FragInputsToSurfaceDescriptionInputs(FragInputs input, float3 viewWS)
{
	SurfaceDescriptionInputs output;
	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);

	output.WorldSpaceNormal = normalize(input.tangentToWorld[2].xyz);
	#if defined(SHADER_STAGE_RAY_TRACING)
	#else
	#endif
	output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);
	output.WorldSpaceViewDirection = normalize(viewWS);
	output.ViewSpacePosition = TransformWorldToView(input.positionRWS);
	output.uv0 = input.texCoord0;
	output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value

	// splice point to copy frag inputs custom interpolator pack into the SDI
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorCopyToSDI' */

	return output;
}

// --------------------------------------------------
// Build Surface Data (Specific Material)

void BuildSurfaceData(FragInputs fragInputs, inout SurfaceDescription surfaceDescription, float3 V, PositionInputs posInput, out SurfaceData surfaceData, out float3 bentNormalWS)
{
	ZERO_INITIALIZE(SurfaceData, surfaceData);

	// specularOcclusion need to be init ahead of decal to quiet the compiler that modify the SurfaceData struct
	// however specularOcclusion can come from the graph, so need to be init here so it can be override.
	surfaceData.specularOcclusion = 1.0;

	surfaceData.baseColor = surfaceDescription.BaseColor;
	surfaceData.perceptualSmoothness = surfaceDescription.Smoothness;
	surfaceData.ambientOcclusion = surfaceDescription.Occlusion;
	surfaceData.metallic = surfaceDescription.Metallic;

	#if defined(_REFRACTION_PLANE) || defined(_REFRACTION_SPHERE) || defined(_REFRACTION_THIN)
		if (_EnableSSRefraction)
		{

			surfaceData.transmittanceMask = (1.0 - surfaceDescription.Alpha);
			surfaceDescription.Alpha = 1.0;
		}
		else
		{
			surfaceData.ior = 1.0;
			surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
			surfaceData.atDistance = 1.0;
			surfaceData.transmittanceMask = 0.0;
			surfaceDescription.Alpha = 1.0;
		}
	#else
		surfaceData.ior = 1.0;
		surfaceData.transmittanceColor = float3(1.0, 1.0, 1.0);
		surfaceData.atDistance = 1.0;
		surfaceData.transmittanceMask = 0.0;
	#endif

		// These static material feature allow compile time optimization
		surfaceData.materialFeatures = MATERIALFEATUREFLAGS_LIT_STANDARD;
		#ifdef _MATERIAL_FEATURE_SUBSURFACE_SCATTERING
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SUBSURFACE_SCATTERING;
		#endif

		#ifdef _MATERIAL_FEATURE_TRANSMISSION
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_TRANSMISSION;
		#endif

		#ifdef _MATERIAL_FEATURE_ANISOTROPY
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_ANISOTROPY;

			// Initialize the normal to something non-zero to avoid a div-zero warning for anisotropy.
			surfaceData.normalWS = float3(0, 1, 0);
		#endif

		#ifdef _MATERIAL_FEATURE_IRIDESCENCE
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_IRIDESCENCE;
		#endif

		#ifdef _MATERIAL_FEATURE_SPECULAR_COLOR
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_SPECULAR_COLOR;
		#endif

		#ifdef _MATERIAL_FEATURE_CLEAR_COAT
			surfaceData.materialFeatures |= MATERIALFEATUREFLAGS_LIT_CLEAR_COAT;
		#endif

		#if defined (_MATERIAL_FEATURE_SPECULAR_COLOR) && defined (_ENERGY_CONSERVING_SPECULAR)
			// Require to have setup baseColor
			// Reproduce the energy conservation done in legacy Unity. Not ideal but better for compatibility and users can unchek it
			surfaceData.baseColor *= (1.0 - Max3(surfaceData.specularColor.r, surfaceData.specularColor.g, surfaceData.specularColor.b));
		#endif

		#ifdef _DOUBLESIDED_ON
			float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
		#else
			float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
		#endif

			// normal delivered to master node
			GetNormalWS(fragInputs, surfaceDescription.NormalTS, surfaceData.normalWS, doubleSidedConstants);

			surfaceData.geomNormalWS = fragInputs.tangentToWorld[2];

			surfaceData.tangentWS = normalize(fragInputs.tangentToWorld[0].xyz);    // The tangent is not normalize in tangentToWorld for mikkt. TODO: Check if it expected that we normalize with Morten. Tag: SURFACE_GRADIENT


			#if HAVE_DECALS
				if (_EnableDecals)
				{
					float alpha = 1.0;
					alpha = surfaceDescription.Alpha;

					// Both uses and modifies 'surfaceData.normalWS'.
					DecalSurfaceData decalSurfaceData = GetDecalSurfaceData(posInput, fragInputs, alpha);
					ApplyDecalToSurfaceData(decalSurfaceData, fragInputs.tangentToWorld[2], surfaceData);
				}
			#endif

			bentNormalWS = surfaceData.normalWS;
			GetNormalWS(fragInputs, surfaceDescription.BentNormal, bentNormalWS, doubleSidedConstants);

			surfaceData.tangentWS = Orthonormalize(surfaceData.tangentWS, surfaceData.normalWS);

			#ifdef DEBUG_DISPLAY
				if (_DebugMipMapMode != DEBUGMIPMAPMODE_NONE)
				{
					// TODO: need to update mip info
					surfaceData.metallic = 0;
				}

				// We need to call ApplyDebugToSurfaceData after filling the surfarcedata and before filling builtinData
				// as it can modify attribute use for static lighting
				ApplyDebugToSurfaceData(fragInputs.tangentToWorld, surfaceData);
			#endif

				// By default we use the ambient occlusion with Tri-ace trick (apply outside) for specular occlusion.
				// If user provide bent normal then we process a better term
				#if defined(_SPECULAR_OCCLUSION_CUSTOM)
					// Just use the value passed through via the slot (not active otherwise)
				#elif defined(_SPECULAR_OCCLUSION_FROM_AO_BENT_NORMAL)
					// If we have bent normal and ambient occlusion, process a specular occlusion
					surfaceData.specularOcclusion = GetSpecularOcclusionFromBentAO(V, bentNormalWS, surfaceData.normalWS, surfaceData.ambientOcclusion, PerceptualSmoothnessToPerceptualRoughness(surfaceData.perceptualSmoothness));
				#elif defined(_AMBIENT_OCCLUSION) && defined(_SPECULAR_OCCLUSION_FROM_AO)
					surfaceData.specularOcclusion = GetSpecularOcclusionFromAmbientOcclusion(ClampNdotV(dot(surfaceData.normalWS, V)), surfaceData.ambientOcclusion, PerceptualSmoothnessToRoughness(surfaceData.perceptualSmoothness));
				#endif

				#if defined(_ENABLE_GEOMETRIC_SPECULAR_AA) && !defined(SHADER_STAGE_RAY_TRACING)
					surfaceData.perceptualSmoothness = GeometricNormalFiltering(surfaceData.perceptualSmoothness, fragInputs.tangentToWorld[2], surfaceDescription.SpecularAAScreenSpaceVariance, surfaceDescription.SpecularAAThreshold);
				#endif
			}

// --------------------------------------------------
// Get Surface And BuiltinData

void GetSurfaceAndBuiltinData(FragInputs fragInputs, float3 V, inout PositionInputs posInput, out SurfaceData surfaceData, out BuiltinData builtinData RAY_TRACING_OPTIONAL_PARAMETERS)
{
	// Don't dither if displaced tessellation (we're fading out the displacement instead to match the next LOD)
	#if !defined(SHADER_STAGE_RAY_TRACING) && !defined(_TESSELLATION_DISPLACEMENT)
	#ifdef LOD_FADE_CROSSFADE // enable dithering LOD transition if user select CrossFade transition in LOD group
	LODDitheringTransition(ComputeFadeMaskSeed(V, posInput.positionSS), unity_LODFade.x);
	#endif
	#endif

	#ifndef SHADER_UNLIT
	#ifdef _DOUBLESIDED_ON
		float3 doubleSidedConstants = _DoubleSidedConstants.xyz;
	#else
		float3 doubleSidedConstants = float3(1.0, 1.0, 1.0);
	#endif

	ApplyDoubleSidedFlipOrMirror(fragInputs, doubleSidedConstants); // Apply double sided flip on the vertex normal
	#endif // SHADER_UNLIT

	SurfaceDescriptionInputs surfaceDescriptionInputs = FragInputsToSurfaceDescriptionInputs(fragInputs, V);

	#if defined(HAVE_VFX_MODIFICATION)
	GraphProperties properties;
	ZERO_INITIALIZE(GraphProperties, properties);

	GetElementPixelProperties(fragInputs, properties);

	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs, properties);
	#else
	SurfaceDescription surfaceDescription = SurfaceDescriptionFunction(surfaceDescriptionInputs);
	#endif

	// Perform alpha test very early to save performance (a killed pixel will not sample textures)
	// TODO: split graph evaluation to grab just alpha dependencies first? tricky..
	#ifdef _ALPHATEST_ON
		float alphaCutoff = surfaceDescription.AlphaClipThreshold;
		#if SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_PREPASS
		// The TransparentDepthPrepass is also used with SSR transparent.
		// If an artists enable transaprent SSR but not the TransparentDepthPrepass itself, then we use AlphaClipThreshold
		// otherwise if TransparentDepthPrepass is enabled we use AlphaClipThresholdDepthPrepass
		#elif SHADERPASS == SHADERPASS_TRANSPARENT_DEPTH_POSTPASS
		// DepthPostpass always use its own alpha threshold
		alphaCutoff = surfaceDescription.AlphaClipThresholdDepthPostpass;
		#elif (SHADERPASS == SHADERPASS_SHADOWS) || (SHADERPASS == SHADERPASS_RAYTRACING_VISIBILITY)
		// If use shadow threshold isn't enable we don't allow any test
		#endif

		GENERIC_ALPHA_TEST(surfaceDescription.Alpha, alphaCutoff);
	#endif

	#if !defined(SHADER_STAGE_RAY_TRACING) && _DEPTHOFFSET_ON
	ApplyDepthOffsetPositionInput(V, surfaceDescription.DepthOffset, GetViewForwardDir(), GetWorldToHClipMatrix(), posInput);
	#endif

	#ifndef SHADER_UNLIT
	float3 bentNormalWS;
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData, bentNormalWS);

	// Builtin Data
	// For back lighting we use the oposite vertex normal
	InitBuiltinData(posInput, surfaceDescription.Alpha, bentNormalWS, -fragInputs.tangentToWorld[2], fragInputs.texCoord1, fragInputs.texCoord2, builtinData);

	#else
	BuildSurfaceData(fragInputs, surfaceDescription, V, posInput, surfaceData);

	ZERO_BUILTIN_INITIALIZE(builtinData); // No call to InitBuiltinData as we don't have any lighting
	builtinData.opacity = surfaceDescription.Alpha;

	#if defined(DEBUG_DISPLAY)
	// Light Layers are currently not used for the Unlit shader (because it is not lit)
	// But Unlit objects do cast shadows according to their rendering layer mask, which is what we want to
	// display in the light layers visualization mode, therefore we need the renderingLayers
	builtinData.renderingLayers = GetMeshRenderingLightLayer();
#endif

#endif // SHADER_UNLIT

#ifdef _ALPHATEST_ON
	// Used for sharpening by alpha to mask - Alpha to covertage is only used with depth only and forward pass (no shadow pass, no transparent pass)
	builtinData.alphaClipTreshold = alphaCutoff;
#endif

	// override sampleBakedGI - not used by Unlit

	builtinData.emissiveColor = surfaceDescription.Emission;

	// Note this will not fully work on transparent surfaces (can check with _SURFACE_TYPE_TRANSPARENT define)
	// We will always overwrite vt feeback with the nearest. So behind transparent surfaces vt will not be resolved
	// This is a limitation of the current MRT approach.
	#ifdef UNITY_VIRTUAL_TEXTURING
	#endif

	#if _DEPTHOFFSET_ON
	builtinData.depthOffset = surfaceDescription.DepthOffset;
	#endif

	// TODO: We should generate distortion / distortionBlur for non distortion pass
	#if (SHADERPASS == SHADERPASS_DISTORTION)
	builtinData.distortion = surfaceDescription.Distortion;
	builtinData.distortionBlur = surfaceDescription.DistortionBlur;
	#endif

	#ifndef SHADER_UNLIT
	// PostInitBuiltinData call ApplyDebugToBuiltinData
	PostInitBuiltinData(V, posInput, surfaceData, builtinData);
	#else
	ApplyDebugToBuiltinData(builtinData);
	#endif

	RAY_TRACING_OPTIONAL_ALPHA_TEST_PASS
}

// --------------------------------------------------
// Main

#include "Packages/com.unity.render-pipelines.high-definition/Runtime/RenderPipeline/ShaderPass/ShaderPassPathTracing.hlsl"

// --------------------------------------------------
// Visual Effect Vertex Invocations

#ifdef HAVE_VFX_MODIFICATION
#include "Packages/com.unity.render-pipelines.high-definition/Runtime/ShaderLibrary/VisualEffectVertex.hlsl"
#endif

ENDHLSL
}
}
CustomEditorForRenderPipeline "Rendering.HighDefinition.LitShaderGraphGUI" "UnityEngine.Rendering.HighDefinition.HDRenderPipelineAsset"
CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
SubShader
{
	Tags
	{
		// RenderPipeline: <None>
		"RenderType" = "Opaque"
		"BuiltInMaterialType" = "Lit"
		"Queue" = "Geometry"
		"ShaderGraphShader" = "true"
		"ShaderGraphTargetId" = "BuiltInLitSubTarget"
	}
	Pass
	{
		Name "BuiltIn Forward"
		Tags
		{
			"LightMode" = "ForwardBase"
		}

	// Render State
	Cull Back
	Blend One Zero
	ZTest LEqual
	ZWrite On

	// Debug
	// <None>

	// --------------------------------------------------
	// Pass

	HLSLPROGRAM

	// Pragmas
	#pragma target 3.0
	#pragma multi_compile_instancing
	#pragma multi_compile_fog
	#pragma multi_compile_fwdbase
	#pragma vertex vert
	#pragma fragment frag

	// DotsInstancingOptions: <None>
	// HybridV1InjectedBuiltinProperties: <None>

	// Keywords
	#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
	#pragma multi_compile _ LIGHTMAP_ON
	#pragma multi_compile _ DIRLIGHTMAP_COMBINED
	#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
	#pragma multi_compile _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
	#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
	#pragma multi_compile _ _SHADOWS_SOFT
	#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
	#pragma multi_compile _ SHADOWS_SHADOWMASK
	// GraphKeywords: <None>

	// Defines
	#define _NORMALMAP 1
	#define _NORMAL_DROPOFF_TS 1
	#define ATTRIBUTES_NEED_NORMAL
	#define ATTRIBUTES_NEED_TANGENT
	#define ATTRIBUTES_NEED_TEXCOORD0
	#define ATTRIBUTES_NEED_TEXCOORD1
	#define VARYINGS_NEED_POSITION_WS
	#define VARYINGS_NEED_NORMAL_WS
	#define VARYINGS_NEED_TANGENT_WS
	#define VARYINGS_NEED_TEXCOORD0
	#define VARYINGS_NEED_VIEWDIRECTION_WS
	#define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
	#define FEATURES_GRAPH_VERTEX
	/* WARNING: $splice Could not find named fragment 'PassInstancing' */
	#define SHADERPASS SHADERPASS_FORWARD
	#define BUILTIN_TARGET_API 1
	/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
	#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
	#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
	#endif
	#ifdef _BUILTIN_ALPHATEST_ON
	#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
	#endif
	#ifdef _BUILTIN_AlphaClip
	#define _AlphaClip _BUILTIN_AlphaClip
	#endif
	#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
	#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
	#endif


	// custom interpolator pre-include
	/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

	// Includes
	#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
	#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
	#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
	#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
	#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
	#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

	// --------------------------------------------------
	// Structs and Packing

	// custom interpolators pre packing
	/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

	struct Attributes
	{
		 float3 positionOS : POSITION;
		 float3 normalOS : NORMAL;
		 float4 tangentOS : TANGENT;
		 float4 uv0 : TEXCOORD0;
		 float4 uv1 : TEXCOORD1;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : INSTANCEID_SEMANTIC;
		#endif
	};
	struct Varyings
	{
		 float4 positionCS : SV_POSITION;
		 float3 positionWS;
		 float3 normalWS;
		 float4 tangentWS;
		 float4 texCoord0;
		 float3 viewDirectionWS;
		#if defined(LIGHTMAP_ON)
		 float2 lightmapUV;
		#endif
		#if !defined(LIGHTMAP_ON)
		 float3 sh;
		#endif
		 float4 fogFactorAndVertexLight;
		 float4 shadowCoord;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : CUSTOM_INSTANCE_ID;
		#endif
		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
		 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
		#endif
		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
		 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
		#endif
		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
		 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
		#endif
	};
	struct SurfaceDescriptionInputs
	{
		 float3 WorldSpaceNormal;
		 float3 TangentSpaceNormal;
		 float3 WorldSpaceViewDirection;
		 float3 ViewSpacePosition;
		 float4 uv0;
		 float3 TimeParameters;
	};
	struct VertexDescriptionInputs
	{
		 float3 ObjectSpaceNormal;
		 float3 ObjectSpaceTangent;
		 float3 ObjectSpacePosition;
	};
	struct PackedVaryings
	{
		 float4 positionCS : SV_POSITION;
		 float3 interp0 : INTERP0;
		 float3 interp1 : INTERP1;
		 float4 interp2 : INTERP2;
		 float4 interp3 : INTERP3;
		 float3 interp4 : INTERP4;
		 float2 interp5 : INTERP5;
		 float3 interp6 : INTERP6;
		 float4 interp7 : INTERP7;
		 float4 interp8 : INTERP8;
		#if UNITY_ANY_INSTANCING_ENABLED
		 uint instanceID : CUSTOM_INSTANCE_ID;
		#endif
		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
		 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
		#endif
		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
		 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
		#endif
		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
		 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
		#endif
	};

	PackedVaryings PackVaryings(Varyings input)
	{
		PackedVaryings output;
		ZERO_INITIALIZE(PackedVaryings, output);
		output.positionCS = input.positionCS;
		output.interp0.xyz = input.positionWS;
		output.interp1.xyz = input.normalWS;
		output.interp2.xyzw = input.tangentWS;
		output.interp3.xyzw = input.texCoord0;
		output.interp4.xyz = input.viewDirectionWS;
		#if defined(LIGHTMAP_ON)
		output.interp5.xy = input.lightmapUV;
		#endif
		#if !defined(LIGHTMAP_ON)
		output.interp6.xyz = input.sh;
		#endif
		output.interp7.xyzw = input.fogFactorAndVertexLight;
		output.interp8.xyzw = input.shadowCoord;
		#if UNITY_ANY_INSTANCING_ENABLED
		output.instanceID = input.instanceID;
		#endif
		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
		output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
		#endif
		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
		output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
		#endif
		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
		output.cullFace = input.cullFace;
		#endif
		return output;
	}

	Varyings UnpackVaryings(PackedVaryings input)
	{
		Varyings output;
		output.positionCS = input.positionCS;
		output.positionWS = input.interp0.xyz;
		output.normalWS = input.interp1.xyz;
		output.tangentWS = input.interp2.xyzw;
		output.texCoord0 = input.interp3.xyzw;
		output.viewDirectionWS = input.interp4.xyz;
		#if defined(LIGHTMAP_ON)
		output.lightmapUV = input.interp5.xy;
		#endif
		#if !defined(LIGHTMAP_ON)
		output.sh = input.interp6.xyz;
		#endif
		output.fogFactorAndVertexLight = input.interp7.xyzw;
		output.shadowCoord = input.interp8.xyzw;
		#if UNITY_ANY_INSTANCING_ENABLED
		output.instanceID = input.instanceID;
		#endif
		#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
		output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
		#endif
		#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
		output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
		#endif
		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
		output.cullFace = input.cullFace;
		#endif
		return output;
	}


	// --------------------------------------------------
	// Graph

	// Graph Properties
	CBUFFER_START(UnityPerMaterial)
	float4 _EmissiveColor;
	float4 _ObjectTexture_TexelSize;
	float4 _EmissifMat_TexelSize;
	float4 _NormalMat_TexelSize;
	CBUFFER_END

		// Object and Global properties
		SAMPLER(SamplerState_Linear_Repeat);
		TEXTURE2D(_ObjectTexture);
		SAMPLER(sampler_ObjectTexture);
		TEXTURE2D(_EmissifMat);
		SAMPLER(sampler_EmissifMat);
		TEXTURE2D(_NormalMat);
		SAMPLER(sampler_NormalMat);

		// -- Property used by ScenePickingPass
		#ifdef SCENEPICKINGPASS
		float4 _SelectionID;
		#endif

		// -- Properties used by SceneSelectionPass
		#ifdef SCENESELECTIONPASS
		int _ObjectId;
		int _PassValue;
		#endif

		// Graph Includes
		// GraphIncludes: <None>

		// Graph Functions

		void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
		{
			Out = Base - Blend;
			Out = lerp(Base, Out, Opacity);
		}

		void Unity_Multiply_float_float(float A, float B, out float Out)
		{
			Out = A * B;
		}

		void Unity_Subtract_float(float A, float B, out float Out)
		{
			Out = A - B;
		}

		void Unity_Cosine_float(float In, out float Out)
		{
			Out = cos(In);
		}

		void Unity_Clamp_float(float In, float Min, float Max, out float Out)
		{
			Out = clamp(In, Min, Max);
		}

		void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
		{
			Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
		}

		void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
		{
			Out = lerp(A, B, T);
		}

		// Custom interpolators pre vertex
		/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

		// Graph Vertex
		struct VertexDescription
		{
			float3 Position;
			float3 Normal;
			float3 Tangent;
		};

		VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
		{
			VertexDescription description = (VertexDescription)0;
			description.Position = IN.ObjectSpacePosition;
			description.Normal = IN.ObjectSpaceNormal;
			description.Tangent = IN.ObjectSpaceTangent;
			return description;
		}

		// Custom interpolators, pre surface
		#ifdef FEATURES_GRAPH_VERTEX
		Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
		{
		return output;
		}
		#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
		#endif

		// Graph Pixel
		struct SurfaceDescription
		{
			float3 BaseColor;
			float3 NormalTS;
			float3 Emission;
			float Metallic;
			float Smoothness;
			float Occlusion;
		};

		SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
		{
			SurfaceDescription surface = (SurfaceDescription)0;
			UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
			float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
			float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
			float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
			float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
			float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
			UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
			float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
			float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
			float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
			float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
			float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
			float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
			Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
			float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
			float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
			Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
			float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
			float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
			float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
			float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
			float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
			Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
			float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
			Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
			float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
			Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
			float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
			Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
			float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
			Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
			float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
			Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
			float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
			Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
			surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
			surface.NormalTS = IN.TangentSpaceNormal;
			surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
			surface.Metallic = 0.5;
			surface.Smoothness = 0.5;
			surface.Occlusion = 1;
			return surface;
		}

		// --------------------------------------------------
		// Build Graph Inputs

		VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
		{
			VertexDescriptionInputs output;
			ZERO_INITIALIZE(VertexDescriptionInputs, output);

			output.ObjectSpaceNormal = input.normalOS;
			output.ObjectSpaceTangent = input.tangentOS.xyz;
			output.ObjectSpacePosition = input.positionOS;

			return output;
		}
		SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
		{
			SurfaceDescriptionInputs output;
			ZERO_INITIALIZE(SurfaceDescriptionInputs, output);



			// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
			float3 unnormalizedNormalWS = input.normalWS;
			const float renormFactor = 1.0 / length(unnormalizedNormalWS);


			output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
			output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);


			output.WorldSpaceViewDirection = normalize(input.viewDirectionWS);
			output.ViewSpacePosition = TransformWorldToView(input.positionWS);
			output.uv0 = input.texCoord0;
			output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
		#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
		#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
		#else
		#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
		#endif
		#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

				return output;
		}

		void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
		{
			result.vertex = float4(attributes.positionOS, 1);
			result.tangent = attributes.tangentOS;
			result.normal = attributes.normalOS;
			result.texcoord = attributes.uv0;
			result.texcoord1 = attributes.uv1;
			result.vertex = float4(vertexDescription.Position, 1);
			result.normal = vertexDescription.Normal;
			result.tangent = float4(vertexDescription.Tangent, 0);
			#if UNITY_ANY_INSTANCING_ENABLED
			#endif
		}

		void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
		{
			result.pos = varyings.positionCS;
			result.worldPos = varyings.positionWS;
			result.worldNormal = varyings.normalWS;
			result.viewDir = varyings.viewDirectionWS;
			// World Tangent isn't an available input on v2f_surf

			result._ShadowCoord = varyings.shadowCoord;

			#if UNITY_ANY_INSTANCING_ENABLED
			#endif
			#if UNITY_SHOULD_SAMPLE_SH
			result.sh = varyings.sh;
			#endif
			#if defined(LIGHTMAP_ON)
			result.lmap.xy = varyings.lightmapUV;
			#endif
			#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
				result.fogCoord = varyings.fogFactorAndVertexLight.x;
				COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
			#endif

			DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
		}

		void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
		{
			result.positionCS = surfVertex.pos;
			result.positionWS = surfVertex.worldPos;
			result.normalWS = surfVertex.worldNormal;
			// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
			// World Tangent isn't an available input on v2f_surf
			result.shadowCoord = surfVertex._ShadowCoord;

			#if UNITY_ANY_INSTANCING_ENABLED
			#endif
			#if UNITY_SHOULD_SAMPLE_SH
			result.sh = surfVertex.sh;
			#endif
			#if defined(LIGHTMAP_ON)
			result.lightmapUV = surfVertex.lmap.xy;
			#endif
			#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
				result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
				COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
			#endif

			DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
		}

		// --------------------------------------------------
		// Main

		#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
		#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
		#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

		ENDHLSL
		}
		Pass
		{
			Name "BuiltIn ForwardAdd"
			Tags
			{
				"LightMode" = "ForwardAdd"
			}

			// Render State
			Blend SrcAlpha One, One One
			ZWrite Off

			// Debug
			// <None>

			// --------------------------------------------------
			// Pass

			HLSLPROGRAM

			// Pragmas
			#pragma target 3.0
			#pragma multi_compile_instancing
			#pragma multi_compile_fog
			#pragma multi_compile_fwdadd_fullshadows
			#pragma vertex vert
			#pragma fragment frag

			// DotsInstancingOptions: <None>
			// HybridV1InjectedBuiltinProperties: <None>

			// Keywords
			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			// GraphKeywords: <None>

			// Defines
			#define _NORMALMAP 1
			#define _NORMAL_DROPOFF_TS 1
			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define ATTRIBUTES_NEED_TEXCOORD0
			#define ATTRIBUTES_NEED_TEXCOORD1
			#define VARYINGS_NEED_POSITION_WS
			#define VARYINGS_NEED_NORMAL_WS
			#define VARYINGS_NEED_TANGENT_WS
			#define VARYINGS_NEED_TEXCOORD0
			#define VARYINGS_NEED_VIEWDIRECTION_WS
			#define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
			#define FEATURES_GRAPH_VERTEX
			/* WARNING: $splice Could not find named fragment 'PassInstancing' */
			#define SHADERPASS SHADERPASS_FORWARD_ADD
			#define BUILTIN_TARGET_API 1
			/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
			#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
			#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
			#endif
			#ifdef _BUILTIN_ALPHATEST_ON
			#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
			#endif
			#ifdef _BUILTIN_AlphaClip
			#define _AlphaClip _BUILTIN_AlphaClip
			#endif
			#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
			#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
			#endif


			// custom interpolator pre-include
			/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

			// Includes
			#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
			#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

			// --------------------------------------------------
			// Structs and Packing

			// custom interpolators pre packing
			/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

			struct Attributes
			{
				 float3 positionOS : POSITION;
				 float3 normalOS : NORMAL;
				 float4 tangentOS : TANGENT;
				 float4 uv0 : TEXCOORD0;
				 float4 uv1 : TEXCOORD1;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : INSTANCEID_SEMANTIC;
				#endif
			};
			struct Varyings
			{
				 float4 positionCS : SV_POSITION;
				 float3 positionWS;
				 float3 normalWS;
				 float4 tangentWS;
				 float4 texCoord0;
				 float3 viewDirectionWS;
				#if defined(LIGHTMAP_ON)
				 float2 lightmapUV;
				#endif
				#if !defined(LIGHTMAP_ON)
				 float3 sh;
				#endif
				 float4 fogFactorAndVertexLight;
				 float4 shadowCoord;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};
			struct SurfaceDescriptionInputs
			{
				 float3 WorldSpaceNormal;
				 float3 TangentSpaceNormal;
				 float3 WorldSpaceViewDirection;
				 float3 ViewSpacePosition;
				 float4 uv0;
				 float3 TimeParameters;
			};
			struct VertexDescriptionInputs
			{
				 float3 ObjectSpaceNormal;
				 float3 ObjectSpaceTangent;
				 float3 ObjectSpacePosition;
			};
			struct PackedVaryings
			{
				 float4 positionCS : SV_POSITION;
				 float3 interp0 : INTERP0;
				 float3 interp1 : INTERP1;
				 float4 interp2 : INTERP2;
				 float4 interp3 : INTERP3;
				 float3 interp4 : INTERP4;
				 float2 interp5 : INTERP5;
				 float3 interp6 : INTERP6;
				 float4 interp7 : INTERP7;
				 float4 interp8 : INTERP8;
				#if UNITY_ANY_INSTANCING_ENABLED
				 uint instanceID : CUSTOM_INSTANCE_ID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
				#endif
			};

			PackedVaryings PackVaryings(Varyings input)
			{
				PackedVaryings output;
				ZERO_INITIALIZE(PackedVaryings, output);
				output.positionCS = input.positionCS;
				output.interp0.xyz = input.positionWS;
				output.interp1.xyz = input.normalWS;
				output.interp2.xyzw = input.tangentWS;
				output.interp3.xyzw = input.texCoord0;
				output.interp4.xyz = input.viewDirectionWS;
				#if defined(LIGHTMAP_ON)
				output.interp5.xy = input.lightmapUV;
				#endif
				#if !defined(LIGHTMAP_ON)
				output.interp6.xyz = input.sh;
				#endif
				output.interp7.xyzw = input.fogFactorAndVertexLight;
				output.interp8.xyzw = input.shadowCoord;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				output.cullFace = input.cullFace;
				#endif
				return output;
			}

			Varyings UnpackVaryings(PackedVaryings input)
			{
				Varyings output;
				output.positionCS = input.positionCS;
				output.positionWS = input.interp0.xyz;
				output.normalWS = input.interp1.xyz;
				output.tangentWS = input.interp2.xyzw;
				output.texCoord0 = input.interp3.xyzw;
				output.viewDirectionWS = input.interp4.xyz;
				#if defined(LIGHTMAP_ON)
				output.lightmapUV = input.interp5.xy;
				#endif
				#if !defined(LIGHTMAP_ON)
				output.sh = input.interp6.xyz;
				#endif
				output.fogFactorAndVertexLight = input.interp7.xyzw;
				output.shadowCoord = input.interp8.xyzw;
				#if UNITY_ANY_INSTANCING_ENABLED
				output.instanceID = input.instanceID;
				#endif
				#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
				output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
				#endif
				#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
				output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
				#endif
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				output.cullFace = input.cullFace;
				#endif
				return output;
			}


			// --------------------------------------------------
			// Graph

			// Graph Properties
			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float4 _ObjectTexture_TexelSize;
			float4 _EmissifMat_TexelSize;
			float4 _NormalMat_TexelSize;
			CBUFFER_END

				// Object and Global properties
				SAMPLER(SamplerState_Linear_Repeat);
				TEXTURE2D(_ObjectTexture);
				SAMPLER(sampler_ObjectTexture);
				TEXTURE2D(_EmissifMat);
				SAMPLER(sampler_EmissifMat);
				TEXTURE2D(_NormalMat);
				SAMPLER(sampler_NormalMat);

				// -- Property used by ScenePickingPass
				#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
				#endif

				// -- Properties used by SceneSelectionPass
				#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
				#endif

				// Graph Includes
				// GraphIncludes: <None>

				// Graph Functions

				void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
				{
					Out = Base - Blend;
					Out = lerp(Base, Out, Opacity);
				}

				void Unity_Multiply_float_float(float A, float B, out float Out)
				{
					Out = A * B;
				}

				void Unity_Subtract_float(float A, float B, out float Out)
				{
					Out = A - B;
				}

				void Unity_Cosine_float(float In, out float Out)
				{
					Out = cos(In);
				}

				void Unity_Clamp_float(float In, float Min, float Max, out float Out)
				{
					Out = clamp(In, Min, Max);
				}

				void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
				{
					Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
				}

				void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
				{
					Out = lerp(A, B, T);
				}

				// Custom interpolators pre vertex
				/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

				// Graph Vertex
				struct VertexDescription
				{
					float3 Position;
					float3 Normal;
					float3 Tangent;
				};

				VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
				{
					VertexDescription description = (VertexDescription)0;
					description.Position = IN.ObjectSpacePosition;
					description.Normal = IN.ObjectSpaceNormal;
					description.Tangent = IN.ObjectSpaceTangent;
					return description;
				}

				// Custom interpolators, pre surface
				#ifdef FEATURES_GRAPH_VERTEX
				Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
				{
				return output;
				}
				#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
				#endif

				// Graph Pixel
				struct SurfaceDescription
				{
					float3 BaseColor;
					float3 NormalTS;
					float3 Emission;
					float Metallic;
					float Smoothness;
					float Occlusion;
				};

				SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
				{
					SurfaceDescription surface = (SurfaceDescription)0;
					UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
					float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
					float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
					float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
					float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
					float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
					UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
					float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
					float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
					float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
					float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
					float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
					float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
					Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
					float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
					float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
					Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
					float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
					float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
					float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
					float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
					float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
					Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
					float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
					Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
					float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
					Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
					float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
					Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
					float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
					Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
					float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
					Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
					float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
					Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
					surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
					surface.NormalTS = IN.TangentSpaceNormal;
					surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
					surface.Metallic = 0.5;
					surface.Smoothness = 0.5;
					surface.Occlusion = 1;
					return surface;
				}

				// --------------------------------------------------
				// Build Graph Inputs

				VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
				{
					VertexDescriptionInputs output;
					ZERO_INITIALIZE(VertexDescriptionInputs, output);

					output.ObjectSpaceNormal = input.normalOS;
					output.ObjectSpaceTangent = input.tangentOS.xyz;
					output.ObjectSpacePosition = input.positionOS;

					return output;
				}
				SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
				{
					SurfaceDescriptionInputs output;
					ZERO_INITIALIZE(SurfaceDescriptionInputs, output);



					// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
					float3 unnormalizedNormalWS = input.normalWS;
					const float renormFactor = 1.0 / length(unnormalizedNormalWS);


					output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
					output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);


					output.WorldSpaceViewDirection = normalize(input.viewDirectionWS);
					output.ViewSpacePosition = TransformWorldToView(input.positionWS);
					output.uv0 = input.texCoord0;
					output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
				#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
				#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
				#else
				#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
				#endif
				#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

						return output;
				}

				void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
				{
					result.vertex = float4(attributes.positionOS, 1);
					result.tangent = attributes.tangentOS;
					result.normal = attributes.normalOS;
					result.texcoord = attributes.uv0;
					result.texcoord1 = attributes.uv1;
					result.vertex = float4(vertexDescription.Position, 1);
					result.normal = vertexDescription.Normal;
					result.tangent = float4(vertexDescription.Tangent, 0);
					#if UNITY_ANY_INSTANCING_ENABLED
					#endif
				}

				void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
				{
					result.pos = varyings.positionCS;
					result.worldPos = varyings.positionWS;
					result.worldNormal = varyings.normalWS;
					result.viewDir = varyings.viewDirectionWS;
					// World Tangent isn't an available input on v2f_surf

					result._ShadowCoord = varyings.shadowCoord;

					#if UNITY_ANY_INSTANCING_ENABLED
					#endif
					#if UNITY_SHOULD_SAMPLE_SH
					result.sh = varyings.sh;
					#endif
					#if defined(LIGHTMAP_ON)
					result.lmap.xy = varyings.lightmapUV;
					#endif
					#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
						result.fogCoord = varyings.fogFactorAndVertexLight.x;
						COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
					#endif

					DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
				}

				void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
				{
					result.positionCS = surfVertex.pos;
					result.positionWS = surfVertex.worldPos;
					result.normalWS = surfVertex.worldNormal;
					// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
					// World Tangent isn't an available input on v2f_surf
					result.shadowCoord = surfVertex._ShadowCoord;

					#if UNITY_ANY_INSTANCING_ENABLED
					#endif
					#if UNITY_SHOULD_SAMPLE_SH
					result.sh = surfVertex.sh;
					#endif
					#if defined(LIGHTMAP_ON)
					result.lightmapUV = surfVertex.lmap.xy;
					#endif
					#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
						result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
						COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
					#endif

					DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
				}

				// --------------------------------------------------
				// Main

				#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
				#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
				#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/PBRForwardAddPass.hlsl"

				ENDHLSL
				}
				Pass
				{
					Name "BuiltIn Deferred"
					Tags
					{
						"LightMode" = "Deferred"
					}

					// Render State
					Cull Back
					Blend One Zero
					ZTest LEqual
					ZWrite On

					// Debug
					// <None>

					// --------------------------------------------------
					// Pass

					HLSLPROGRAM

					// Pragmas
					#pragma target 4.5
					#pragma multi_compile_instancing
					#pragma exclude_renderers nomrt
					#pragma multi_compile_prepassfinal
					#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
					#pragma vertex vert
					#pragma fragment frag

					// DotsInstancingOptions: <None>
					// HybridV1InjectedBuiltinProperties: <None>

					// Keywords
					#pragma multi_compile _ LIGHTMAP_ON
					#pragma multi_compile _ DIRLIGHTMAP_COMBINED
					#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
					#pragma multi_compile _ _SHADOWS_SOFT
					#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
					#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
					#pragma multi_compile _ _GBUFFER_NORMALS_OCT
					// GraphKeywords: <None>

					// Defines
					#define _NORMALMAP 1
					#define _NORMAL_DROPOFF_TS 1
					#define ATTRIBUTES_NEED_NORMAL
					#define ATTRIBUTES_NEED_TANGENT
					#define ATTRIBUTES_NEED_TEXCOORD0
					#define ATTRIBUTES_NEED_TEXCOORD1
					#define VARYINGS_NEED_POSITION_WS
					#define VARYINGS_NEED_NORMAL_WS
					#define VARYINGS_NEED_TANGENT_WS
					#define VARYINGS_NEED_TEXCOORD0
					#define VARYINGS_NEED_VIEWDIRECTION_WS
					#define VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
					#define FEATURES_GRAPH_VERTEX
					/* WARNING: $splice Could not find named fragment 'PassInstancing' */
					#define SHADERPASS SHADERPASS_DEFERRED
					#define BUILTIN_TARGET_API 1
					/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
					#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
					#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
					#endif
					#ifdef _BUILTIN_ALPHATEST_ON
					#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
					#endif
					#ifdef _BUILTIN_AlphaClip
					#define _AlphaClip _BUILTIN_AlphaClip
					#endif
					#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
					#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
					#endif


					// custom interpolator pre-include
					/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

					// Includes
					#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
					#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
					#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
					#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
					#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
					#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
					#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

					// --------------------------------------------------
					// Structs and Packing

					// custom interpolators pre packing
					/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

					struct Attributes
					{
						 float3 positionOS : POSITION;
						 float3 normalOS : NORMAL;
						 float4 tangentOS : TANGENT;
						 float4 uv0 : TEXCOORD0;
						 float4 uv1 : TEXCOORD1;
						#if UNITY_ANY_INSTANCING_ENABLED
						 uint instanceID : INSTANCEID_SEMANTIC;
						#endif
					};
					struct Varyings
					{
						 float4 positionCS : SV_POSITION;
						 float3 positionWS;
						 float3 normalWS;
						 float4 tangentWS;
						 float4 texCoord0;
						 float3 viewDirectionWS;
						#if defined(LIGHTMAP_ON)
						 float2 lightmapUV;
						#endif
						#if !defined(LIGHTMAP_ON)
						 float3 sh;
						#endif
						 float4 fogFactorAndVertexLight;
						 float4 shadowCoord;
						#if UNITY_ANY_INSTANCING_ENABLED
						 uint instanceID : CUSTOM_INSTANCE_ID;
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
						#endif
					};
					struct SurfaceDescriptionInputs
					{
						 float3 WorldSpaceNormal;
						 float3 TangentSpaceNormal;
						 float3 WorldSpaceViewDirection;
						 float3 ViewSpacePosition;
						 float4 uv0;
						 float3 TimeParameters;
					};
					struct VertexDescriptionInputs
					{
						 float3 ObjectSpaceNormal;
						 float3 ObjectSpaceTangent;
						 float3 ObjectSpacePosition;
					};
					struct PackedVaryings
					{
						 float4 positionCS : SV_POSITION;
						 float3 interp0 : INTERP0;
						 float3 interp1 : INTERP1;
						 float4 interp2 : INTERP2;
						 float4 interp3 : INTERP3;
						 float3 interp4 : INTERP4;
						 float2 interp5 : INTERP5;
						 float3 interp6 : INTERP6;
						 float4 interp7 : INTERP7;
						 float4 interp8 : INTERP8;
						#if UNITY_ANY_INSTANCING_ENABLED
						 uint instanceID : CUSTOM_INSTANCE_ID;
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
						#endif
					};

					PackedVaryings PackVaryings(Varyings input)
					{
						PackedVaryings output;
						ZERO_INITIALIZE(PackedVaryings, output);
						output.positionCS = input.positionCS;
						output.interp0.xyz = input.positionWS;
						output.interp1.xyz = input.normalWS;
						output.interp2.xyzw = input.tangentWS;
						output.interp3.xyzw = input.texCoord0;
						output.interp4.xyz = input.viewDirectionWS;
						#if defined(LIGHTMAP_ON)
						output.interp5.xy = input.lightmapUV;
						#endif
						#if !defined(LIGHTMAP_ON)
						output.interp6.xyz = input.sh;
						#endif
						output.interp7.xyzw = input.fogFactorAndVertexLight;
						output.interp8.xyzw = input.shadowCoord;
						#if UNITY_ANY_INSTANCING_ENABLED
						output.instanceID = input.instanceID;
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						output.cullFace = input.cullFace;
						#endif
						return output;
					}

					Varyings UnpackVaryings(PackedVaryings input)
					{
						Varyings output;
						output.positionCS = input.positionCS;
						output.positionWS = input.interp0.xyz;
						output.normalWS = input.interp1.xyz;
						output.tangentWS = input.interp2.xyzw;
						output.texCoord0 = input.interp3.xyzw;
						output.viewDirectionWS = input.interp4.xyz;
						#if defined(LIGHTMAP_ON)
						output.lightmapUV = input.interp5.xy;
						#endif
						#if !defined(LIGHTMAP_ON)
						output.sh = input.interp6.xyz;
						#endif
						output.fogFactorAndVertexLight = input.interp7.xyzw;
						output.shadowCoord = input.interp8.xyzw;
						#if UNITY_ANY_INSTANCING_ENABLED
						output.instanceID = input.instanceID;
						#endif
						#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
						output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
						#endif
						#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
						output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
						#endif
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						output.cullFace = input.cullFace;
						#endif
						return output;
					}


					// --------------------------------------------------
					// Graph

					// Graph Properties
					CBUFFER_START(UnityPerMaterial)
					float4 _EmissiveColor;
					float4 _ObjectTexture_TexelSize;
					float4 _EmissifMat_TexelSize;
					float4 _NormalMat_TexelSize;
					CBUFFER_END

						// Object and Global properties
						SAMPLER(SamplerState_Linear_Repeat);
						TEXTURE2D(_ObjectTexture);
						SAMPLER(sampler_ObjectTexture);
						TEXTURE2D(_EmissifMat);
						SAMPLER(sampler_EmissifMat);
						TEXTURE2D(_NormalMat);
						SAMPLER(sampler_NormalMat);

						// -- Property used by ScenePickingPass
						#ifdef SCENEPICKINGPASS
						float4 _SelectionID;
						#endif

						// -- Properties used by SceneSelectionPass
						#ifdef SCENESELECTIONPASS
						int _ObjectId;
						int _PassValue;
						#endif

						// Graph Includes
						// GraphIncludes: <None>

						// Graph Functions

						void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
						{
							Out = Base - Blend;
							Out = lerp(Base, Out, Opacity);
						}

						void Unity_Multiply_float_float(float A, float B, out float Out)
						{
							Out = A * B;
						}

						void Unity_Subtract_float(float A, float B, out float Out)
						{
							Out = A - B;
						}

						void Unity_Cosine_float(float In, out float Out)
						{
							Out = cos(In);
						}

						void Unity_Clamp_float(float In, float Min, float Max, out float Out)
						{
							Out = clamp(In, Min, Max);
						}

						void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
						{
							Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
						}

						void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
						{
							Out = lerp(A, B, T);
						}

						// Custom interpolators pre vertex
						/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

						// Graph Vertex
						struct VertexDescription
						{
							float3 Position;
							float3 Normal;
							float3 Tangent;
						};

						VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
						{
							VertexDescription description = (VertexDescription)0;
							description.Position = IN.ObjectSpacePosition;
							description.Normal = IN.ObjectSpaceNormal;
							description.Tangent = IN.ObjectSpaceTangent;
							return description;
						}

						// Custom interpolators, pre surface
						#ifdef FEATURES_GRAPH_VERTEX
						Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
						{
						return output;
						}
						#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
						#endif

						// Graph Pixel
						struct SurfaceDescription
						{
							float3 BaseColor;
							float3 NormalTS;
							float3 Emission;
							float Metallic;
							float Smoothness;
							float Occlusion;
						};

						SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
						{
							SurfaceDescription surface = (SurfaceDescription)0;
							UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
							float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
							float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
							float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
							float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
							float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
							UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
							float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
							float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
							float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
							float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
							float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
							float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
							Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
							float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
							float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
							Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
							float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
							float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
							float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
							float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
							float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
							Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
							float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
							Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
							float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
							Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
							float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
							Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
							float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
							Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
							float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
							Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
							float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
							Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
							surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
							surface.NormalTS = IN.TangentSpaceNormal;
							surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
							surface.Metallic = 0.5;
							surface.Smoothness = 0.5;
							surface.Occlusion = 1;
							return surface;
						}

						// --------------------------------------------------
						// Build Graph Inputs

						VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
						{
							VertexDescriptionInputs output;
							ZERO_INITIALIZE(VertexDescriptionInputs, output);

							output.ObjectSpaceNormal = input.normalOS;
							output.ObjectSpaceTangent = input.tangentOS.xyz;
							output.ObjectSpacePosition = input.positionOS;

							return output;
						}
						SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
						{
							SurfaceDescriptionInputs output;
							ZERO_INITIALIZE(SurfaceDescriptionInputs, output);



							// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
							float3 unnormalizedNormalWS = input.normalWS;
							const float renormFactor = 1.0 / length(unnormalizedNormalWS);


							output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph
							output.TangentSpaceNormal = float3(0.0f, 0.0f, 1.0f);


							output.WorldSpaceViewDirection = normalize(input.viewDirectionWS);
							output.ViewSpacePosition = TransformWorldToView(input.positionWS);
							output.uv0 = input.texCoord0;
							output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
						#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
						#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
						#else
						#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
						#endif
						#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

								return output;
						}

						void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
						{
							result.vertex = float4(attributes.positionOS, 1);
							result.tangent = attributes.tangentOS;
							result.normal = attributes.normalOS;
							result.texcoord = attributes.uv0;
							result.texcoord1 = attributes.uv1;
							result.vertex = float4(vertexDescription.Position, 1);
							result.normal = vertexDescription.Normal;
							result.tangent = float4(vertexDescription.Tangent, 0);
							#if UNITY_ANY_INSTANCING_ENABLED
							#endif
						}

						void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
						{
							result.pos = varyings.positionCS;
							result.worldPos = varyings.positionWS;
							result.worldNormal = varyings.normalWS;
							result.viewDir = varyings.viewDirectionWS;
							// World Tangent isn't an available input on v2f_surf

							result._ShadowCoord = varyings.shadowCoord;

							#if UNITY_ANY_INSTANCING_ENABLED
							#endif
							#if UNITY_SHOULD_SAMPLE_SH
							result.sh = varyings.sh;
							#endif
							#if defined(LIGHTMAP_ON)
							result.lmap.xy = varyings.lightmapUV;
							#endif
							#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
								result.fogCoord = varyings.fogFactorAndVertexLight.x;
								COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
							#endif

							DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
						}

						void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
						{
							result.positionCS = surfVertex.pos;
							result.positionWS = surfVertex.worldPos;
							result.normalWS = surfVertex.worldNormal;
							// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
							// World Tangent isn't an available input on v2f_surf
							result.shadowCoord = surfVertex._ShadowCoord;

							#if UNITY_ANY_INSTANCING_ENABLED
							#endif
							#if UNITY_SHOULD_SAMPLE_SH
							result.sh = surfVertex.sh;
							#endif
							#if defined(LIGHTMAP_ON)
							result.lightmapUV = surfVertex.lmap.xy;
							#endif
							#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
								result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
								COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
							#endif

							DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
						}

						// --------------------------------------------------
						// Main

						#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
						#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
						#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/PBRDeferredPass.hlsl"

						ENDHLSL
						}
						Pass
						{
							Name "ShadowCaster"
							Tags
							{
								"LightMode" = "ShadowCaster"
							}

							// Render State
							Cull Back
							Blend One Zero
							ZTest LEqual
							ZWrite On
							ColorMask 0

							// Debug
							// <None>

							// --------------------------------------------------
							// Pass

							HLSLPROGRAM

							// Pragmas
							#pragma target 3.0
							#pragma multi_compile_shadowcaster
							#pragma vertex vert
							#pragma fragment frag

							// DotsInstancingOptions: <None>
							// HybridV1InjectedBuiltinProperties: <None>

							// Keywords
							#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW
							// GraphKeywords: <None>

							// Defines
							#define _NORMALMAP 1
							#define _NORMAL_DROPOFF_TS 1
							#define ATTRIBUTES_NEED_NORMAL
							#define ATTRIBUTES_NEED_TANGENT
							#define FEATURES_GRAPH_VERTEX
							/* WARNING: $splice Could not find named fragment 'PassInstancing' */
							#define SHADERPASS SHADERPASS_SHADOWCASTER
							#define BUILTIN_TARGET_API 1
							/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
							#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
							#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
							#endif
							#ifdef _BUILTIN_ALPHATEST_ON
							#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
							#endif
							#ifdef _BUILTIN_AlphaClip
							#define _AlphaClip _BUILTIN_AlphaClip
							#endif
							#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
							#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
							#endif


							// custom interpolator pre-include
							/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

							// Includes
							#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
							#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
							#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
							#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
							#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
							#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
							#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

							// --------------------------------------------------
							// Structs and Packing

							// custom interpolators pre packing
							/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

							struct Attributes
							{
								 float3 positionOS : POSITION;
								 float3 normalOS : NORMAL;
								 float4 tangentOS : TANGENT;
								#if UNITY_ANY_INSTANCING_ENABLED
								 uint instanceID : INSTANCEID_SEMANTIC;
								#endif
							};
							struct Varyings
							{
								 float4 positionCS : SV_POSITION;
								#if UNITY_ANY_INSTANCING_ENABLED
								 uint instanceID : CUSTOM_INSTANCE_ID;
								#endif
								#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
								 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
								#endif
								#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
								 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
								#endif
								#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
								 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
								#endif
							};
							struct SurfaceDescriptionInputs
							{
							};
							struct VertexDescriptionInputs
							{
								 float3 ObjectSpaceNormal;
								 float3 ObjectSpaceTangent;
								 float3 ObjectSpacePosition;
							};
							struct PackedVaryings
							{
								 float4 positionCS : SV_POSITION;
								#if UNITY_ANY_INSTANCING_ENABLED
								 uint instanceID : CUSTOM_INSTANCE_ID;
								#endif
								#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
								 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
								#endif
								#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
								 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
								#endif
								#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
								 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
								#endif
							};

							PackedVaryings PackVaryings(Varyings input)
							{
								PackedVaryings output;
								ZERO_INITIALIZE(PackedVaryings, output);
								output.positionCS = input.positionCS;
								#if UNITY_ANY_INSTANCING_ENABLED
								output.instanceID = input.instanceID;
								#endif
								#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
								output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
								#endif
								#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
								output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
								#endif
								#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
								output.cullFace = input.cullFace;
								#endif
								return output;
							}

							Varyings UnpackVaryings(PackedVaryings input)
							{
								Varyings output;
								output.positionCS = input.positionCS;
								#if UNITY_ANY_INSTANCING_ENABLED
								output.instanceID = input.instanceID;
								#endif
								#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
								output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
								#endif
								#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
								output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
								#endif
								#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
								output.cullFace = input.cullFace;
								#endif
								return output;
							}


							// --------------------------------------------------
							// Graph

							// Graph Properties
							CBUFFER_START(UnityPerMaterial)
							float4 _EmissiveColor;
							float4 _ObjectTexture_TexelSize;
							float4 _EmissifMat_TexelSize;
							float4 _NormalMat_TexelSize;
							CBUFFER_END

								// Object and Global properties
								SAMPLER(SamplerState_Linear_Repeat);
								TEXTURE2D(_ObjectTexture);
								SAMPLER(sampler_ObjectTexture);
								TEXTURE2D(_EmissifMat);
								SAMPLER(sampler_EmissifMat);
								TEXTURE2D(_NormalMat);
								SAMPLER(sampler_NormalMat);

								// -- Property used by ScenePickingPass
								#ifdef SCENEPICKINGPASS
								float4 _SelectionID;
								#endif

								// -- Properties used by SceneSelectionPass
								#ifdef SCENESELECTIONPASS
								int _ObjectId;
								int _PassValue;
								#endif

								// Graph Includes
								// GraphIncludes: <None>

								// Graph Functions
								// GraphFunctions: <None>

								// Custom interpolators pre vertex
								/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

								// Graph Vertex
								struct VertexDescription
								{
									float3 Position;
									float3 Normal;
									float3 Tangent;
								};

								VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
								{
									VertexDescription description = (VertexDescription)0;
									description.Position = IN.ObjectSpacePosition;
									description.Normal = IN.ObjectSpaceNormal;
									description.Tangent = IN.ObjectSpaceTangent;
									return description;
								}

								// Custom interpolators, pre surface
								#ifdef FEATURES_GRAPH_VERTEX
								Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
								{
								return output;
								}
								#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
								#endif

								// Graph Pixel
								struct SurfaceDescription
								{
								};

								SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
								{
									SurfaceDescription surface = (SurfaceDescription)0;
									return surface;
								}

								// --------------------------------------------------
								// Build Graph Inputs

								VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
								{
									VertexDescriptionInputs output;
									ZERO_INITIALIZE(VertexDescriptionInputs, output);

									output.ObjectSpaceNormal = input.normalOS;
									output.ObjectSpaceTangent = input.tangentOS.xyz;
									output.ObjectSpacePosition = input.positionOS;

									return output;
								}
								SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
								{
									SurfaceDescriptionInputs output;
									ZERO_INITIALIZE(SurfaceDescriptionInputs, output);







								#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
								#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
								#else
								#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
								#endif
								#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

										return output;
								}

								void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
								{
									result.vertex = float4(attributes.positionOS, 1);
									result.tangent = attributes.tangentOS;
									result.normal = attributes.normalOS;
									result.vertex = float4(vertexDescription.Position, 1);
									result.normal = vertexDescription.Normal;
									result.tangent = float4(vertexDescription.Tangent, 0);
									#if UNITY_ANY_INSTANCING_ENABLED
									#endif
								}

								void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
								{
									result.pos = varyings.positionCS;
									// World Tangent isn't an available input on v2f_surf


									#if UNITY_ANY_INSTANCING_ENABLED
									#endif
									#if UNITY_SHOULD_SAMPLE_SH
									#endif
									#if defined(LIGHTMAP_ON)
									#endif
									#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
										result.fogCoord = varyings.fogFactorAndVertexLight.x;
										COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
									#endif

									DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
								}

								void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
								{
									result.positionCS = surfVertex.pos;
									// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
									// World Tangent isn't an available input on v2f_surf

									#if UNITY_ANY_INSTANCING_ENABLED
									#endif
									#if UNITY_SHOULD_SAMPLE_SH
									#endif
									#if defined(LIGHTMAP_ON)
									#endif
									#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
										result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
										COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
									#endif

									DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
								}

								// --------------------------------------------------
								// Main

								#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
								#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
								#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

								ENDHLSL
								}
								Pass
								{
									Name "DepthOnly"
									Tags
									{
										"LightMode" = "DepthOnly"
									}

									// Render State
									Cull Back
									Blend One Zero
									ZTest LEqual
									ZWrite On
									ColorMask 0

									// Debug
									// <None>

									// --------------------------------------------------
									// Pass

									HLSLPROGRAM

									// Pragmas
									#pragma target 3.0
									#pragma multi_compile_instancing
									#pragma vertex vert
									#pragma fragment frag

									// DotsInstancingOptions: <None>
									// HybridV1InjectedBuiltinProperties: <None>

									// Keywords
									// PassKeywords: <None>
									// GraphKeywords: <None>

									// Defines
									#define _NORMALMAP 1
									#define _NORMAL_DROPOFF_TS 1
									#define ATTRIBUTES_NEED_NORMAL
									#define ATTRIBUTES_NEED_TANGENT
									#define FEATURES_GRAPH_VERTEX
									/* WARNING: $splice Could not find named fragment 'PassInstancing' */
									#define SHADERPASS SHADERPASS_DEPTHONLY
									#define BUILTIN_TARGET_API 1
									/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
									#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
									#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
									#endif
									#ifdef _BUILTIN_ALPHATEST_ON
									#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
									#endif
									#ifdef _BUILTIN_AlphaClip
									#define _AlphaClip _BUILTIN_AlphaClip
									#endif
									#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
									#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
									#endif


									// custom interpolator pre-include
									/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

									// Includes
									#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
									#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
									#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
									#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
									#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
									#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
									#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

									// --------------------------------------------------
									// Structs and Packing

									// custom interpolators pre packing
									/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

									struct Attributes
									{
										 float3 positionOS : POSITION;
										 float3 normalOS : NORMAL;
										 float4 tangentOS : TANGENT;
										#if UNITY_ANY_INSTANCING_ENABLED
										 uint instanceID : INSTANCEID_SEMANTIC;
										#endif
									};
									struct Varyings
									{
										 float4 positionCS : SV_POSITION;
										#if UNITY_ANY_INSTANCING_ENABLED
										 uint instanceID : CUSTOM_INSTANCE_ID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
										#endif
									};
									struct SurfaceDescriptionInputs
									{
									};
									struct VertexDescriptionInputs
									{
										 float3 ObjectSpaceNormal;
										 float3 ObjectSpaceTangent;
										 float3 ObjectSpacePosition;
									};
									struct PackedVaryings
									{
										 float4 positionCS : SV_POSITION;
										#if UNITY_ANY_INSTANCING_ENABLED
										 uint instanceID : CUSTOM_INSTANCE_ID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
										#endif
									};

									PackedVaryings PackVaryings(Varyings input)
									{
										PackedVaryings output;
										ZERO_INITIALIZE(PackedVaryings, output);
										output.positionCS = input.positionCS;
										#if UNITY_ANY_INSTANCING_ENABLED
										output.instanceID = input.instanceID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										output.cullFace = input.cullFace;
										#endif
										return output;
									}

									Varyings UnpackVaryings(PackedVaryings input)
									{
										Varyings output;
										output.positionCS = input.positionCS;
										#if UNITY_ANY_INSTANCING_ENABLED
										output.instanceID = input.instanceID;
										#endif
										#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
										output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
										#endif
										#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
										output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
										#endif
										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										output.cullFace = input.cullFace;
										#endif
										return output;
									}


									// --------------------------------------------------
									// Graph

									// Graph Properties
									CBUFFER_START(UnityPerMaterial)
									float4 _EmissiveColor;
									float4 _ObjectTexture_TexelSize;
									float4 _EmissifMat_TexelSize;
									float4 _NormalMat_TexelSize;
									CBUFFER_END

										// Object and Global properties
										SAMPLER(SamplerState_Linear_Repeat);
										TEXTURE2D(_ObjectTexture);
										SAMPLER(sampler_ObjectTexture);
										TEXTURE2D(_EmissifMat);
										SAMPLER(sampler_EmissifMat);
										TEXTURE2D(_NormalMat);
										SAMPLER(sampler_NormalMat);

										// -- Property used by ScenePickingPass
										#ifdef SCENEPICKINGPASS
										float4 _SelectionID;
										#endif

										// -- Properties used by SceneSelectionPass
										#ifdef SCENESELECTIONPASS
										int _ObjectId;
										int _PassValue;
										#endif

										// Graph Includes
										// GraphIncludes: <None>

										// Graph Functions
										// GraphFunctions: <None>

										// Custom interpolators pre vertex
										/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

										// Graph Vertex
										struct VertexDescription
										{
											float3 Position;
											float3 Normal;
											float3 Tangent;
										};

										VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
										{
											VertexDescription description = (VertexDescription)0;
											description.Position = IN.ObjectSpacePosition;
											description.Normal = IN.ObjectSpaceNormal;
											description.Tangent = IN.ObjectSpaceTangent;
											return description;
										}

										// Custom interpolators, pre surface
										#ifdef FEATURES_GRAPH_VERTEX
										Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
										{
										return output;
										}
										#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
										#endif

										// Graph Pixel
										struct SurfaceDescription
										{
										};

										SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
										{
											SurfaceDescription surface = (SurfaceDescription)0;
											return surface;
										}

										// --------------------------------------------------
										// Build Graph Inputs

										VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
										{
											VertexDescriptionInputs output;
											ZERO_INITIALIZE(VertexDescriptionInputs, output);

											output.ObjectSpaceNormal = input.normalOS;
											output.ObjectSpaceTangent = input.tangentOS.xyz;
											output.ObjectSpacePosition = input.positionOS;

											return output;
										}
										SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
										{
											SurfaceDescriptionInputs output;
											ZERO_INITIALIZE(SurfaceDescriptionInputs, output);







										#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
										#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
										#else
										#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
										#endif
										#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

												return output;
										}

										void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
										{
											result.vertex = float4(attributes.positionOS, 1);
											result.tangent = attributes.tangentOS;
											result.normal = attributes.normalOS;
											result.vertex = float4(vertexDescription.Position, 1);
											result.normal = vertexDescription.Normal;
											result.tangent = float4(vertexDescription.Tangent, 0);
											#if UNITY_ANY_INSTANCING_ENABLED
											#endif
										}

										void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
										{
											result.pos = varyings.positionCS;
											// World Tangent isn't an available input on v2f_surf


											#if UNITY_ANY_INSTANCING_ENABLED
											#endif
											#if UNITY_SHOULD_SAMPLE_SH
											#endif
											#if defined(LIGHTMAP_ON)
											#endif
											#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
												result.fogCoord = varyings.fogFactorAndVertexLight.x;
												COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
											#endif

											DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
										}

										void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
										{
											result.positionCS = surfVertex.pos;
											// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
											// World Tangent isn't an available input on v2f_surf

											#if UNITY_ANY_INSTANCING_ENABLED
											#endif
											#if UNITY_SHOULD_SAMPLE_SH
											#endif
											#if defined(LIGHTMAP_ON)
											#endif
											#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
												result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
												COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
											#endif

											DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
										}

										// --------------------------------------------------
										// Main

										#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
										#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
										#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

										ENDHLSL
										}
										Pass
										{
											Name "Meta"
											Tags
											{
												"LightMode" = "Meta"
											}

											// Render State
											Cull Off

											// Debug
											// <None>

											// --------------------------------------------------
											// Pass

											HLSLPROGRAM

											// Pragmas
											#pragma target 3.0
											#pragma vertex vert
											#pragma fragment frag

											// DotsInstancingOptions: <None>
											// HybridV1InjectedBuiltinProperties: <None>

											// Keywords
											#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A
											// GraphKeywords: <None>

											// Defines
											#define _NORMALMAP 1
											#define _NORMAL_DROPOFF_TS 1
											#define ATTRIBUTES_NEED_NORMAL
											#define ATTRIBUTES_NEED_TANGENT
											#define ATTRIBUTES_NEED_TEXCOORD0
											#define ATTRIBUTES_NEED_TEXCOORD1
											#define ATTRIBUTES_NEED_TEXCOORD2
											#define VARYINGS_NEED_POSITION_WS
											#define VARYINGS_NEED_NORMAL_WS
											#define VARYINGS_NEED_TEXCOORD0
											#define VARYINGS_NEED_VIEWDIRECTION_WS
											#define FEATURES_GRAPH_VERTEX
											/* WARNING: $splice Could not find named fragment 'PassInstancing' */
											#define SHADERPASS SHADERPASS_META
											#define BUILTIN_TARGET_API 1
											/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
											#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
											#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
											#endif
											#ifdef _BUILTIN_ALPHATEST_ON
											#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
											#endif
											#ifdef _BUILTIN_AlphaClip
											#define _AlphaClip _BUILTIN_AlphaClip
											#endif
											#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
											#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
											#endif


											// custom interpolator pre-include
											/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

											// Includes
											#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
											#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
											#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
											#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
											#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
											#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
											#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

											// --------------------------------------------------
											// Structs and Packing

											// custom interpolators pre packing
											/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

											struct Attributes
											{
												 float3 positionOS : POSITION;
												 float3 normalOS : NORMAL;
												 float4 tangentOS : TANGENT;
												 float4 uv0 : TEXCOORD0;
												 float4 uv1 : TEXCOORD1;
												 float4 uv2 : TEXCOORD2;
												#if UNITY_ANY_INSTANCING_ENABLED
												 uint instanceID : INSTANCEID_SEMANTIC;
												#endif
											};
											struct Varyings
											{
												 float4 positionCS : SV_POSITION;
												 float3 positionWS;
												 float3 normalWS;
												 float4 texCoord0;
												 float3 viewDirectionWS;
												#if UNITY_ANY_INSTANCING_ENABLED
												 uint instanceID : CUSTOM_INSTANCE_ID;
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
												#endif
											};
											struct SurfaceDescriptionInputs
											{
												 float3 WorldSpaceNormal;
												 float3 WorldSpaceViewDirection;
												 float3 ViewSpacePosition;
												 float4 uv0;
												 float3 TimeParameters;
											};
											struct VertexDescriptionInputs
											{
												 float3 ObjectSpaceNormal;
												 float3 ObjectSpaceTangent;
												 float3 ObjectSpacePosition;
											};
											struct PackedVaryings
											{
												 float4 positionCS : SV_POSITION;
												 float3 interp0 : INTERP0;
												 float3 interp1 : INTERP1;
												 float4 interp2 : INTERP2;
												 float3 interp3 : INTERP3;
												#if UNITY_ANY_INSTANCING_ENABLED
												 uint instanceID : CUSTOM_INSTANCE_ID;
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
												#endif
											};

											PackedVaryings PackVaryings(Varyings input)
											{
												PackedVaryings output;
												ZERO_INITIALIZE(PackedVaryings, output);
												output.positionCS = input.positionCS;
												output.interp0.xyz = input.positionWS;
												output.interp1.xyz = input.normalWS;
												output.interp2.xyzw = input.texCoord0;
												output.interp3.xyz = input.viewDirectionWS;
												#if UNITY_ANY_INSTANCING_ENABLED
												output.instanceID = input.instanceID;
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												output.cullFace = input.cullFace;
												#endif
												return output;
											}

											Varyings UnpackVaryings(PackedVaryings input)
											{
												Varyings output;
												output.positionCS = input.positionCS;
												output.positionWS = input.interp0.xyz;
												output.normalWS = input.interp1.xyz;
												output.texCoord0 = input.interp2.xyzw;
												output.viewDirectionWS = input.interp3.xyz;
												#if UNITY_ANY_INSTANCING_ENABLED
												output.instanceID = input.instanceID;
												#endif
												#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
												output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
												#endif
												#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
												output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
												#endif
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												output.cullFace = input.cullFace;
												#endif
												return output;
											}


											// --------------------------------------------------
											// Graph

											// Graph Properties
											CBUFFER_START(UnityPerMaterial)
											float4 _EmissiveColor;
											float4 _ObjectTexture_TexelSize;
											float4 _EmissifMat_TexelSize;
											float4 _NormalMat_TexelSize;
											CBUFFER_END

												// Object and Global properties
												SAMPLER(SamplerState_Linear_Repeat);
												TEXTURE2D(_ObjectTexture);
												SAMPLER(sampler_ObjectTexture);
												TEXTURE2D(_EmissifMat);
												SAMPLER(sampler_EmissifMat);
												TEXTURE2D(_NormalMat);
												SAMPLER(sampler_NormalMat);

												// -- Property used by ScenePickingPass
												#ifdef SCENEPICKINGPASS
												float4 _SelectionID;
												#endif

												// -- Properties used by SceneSelectionPass
												#ifdef SCENESELECTIONPASS
												int _ObjectId;
												int _PassValue;
												#endif

												// Graph Includes
												// GraphIncludes: <None>

												// Graph Functions

												void Unity_Blend_Subtract_float4(float4 Base, float4 Blend, out float4 Out, float Opacity)
												{
													Out = Base - Blend;
													Out = lerp(Base, Out, Opacity);
												}

												void Unity_Multiply_float_float(float A, float B, out float Out)
												{
													Out = A * B;
												}

												void Unity_Subtract_float(float A, float B, out float Out)
												{
													Out = A - B;
												}

												void Unity_Cosine_float(float In, out float Out)
												{
													Out = cos(In);
												}

												void Unity_Clamp_float(float In, float Min, float Max, out float Out)
												{
													Out = clamp(In, Min, Max);
												}

												void Unity_FresnelEffect_float(float3 Normal, float3 ViewDir, float Power, out float Out)
												{
													Out = pow((1.0 - saturate(dot(normalize(Normal), normalize(ViewDir)))), Power);
												}

												void Unity_Lerp_float4(float4 A, float4 B, float4 T, out float4 Out)
												{
													Out = lerp(A, B, T);
												}

												// Custom interpolators pre vertex
												/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

												// Graph Vertex
												struct VertexDescription
												{
													float3 Position;
													float3 Normal;
													float3 Tangent;
												};

												VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
												{
													VertexDescription description = (VertexDescription)0;
													description.Position = IN.ObjectSpacePosition;
													description.Normal = IN.ObjectSpaceNormal;
													description.Tangent = IN.ObjectSpaceTangent;
													return description;
												}

												// Custom interpolators, pre surface
												#ifdef FEATURES_GRAPH_VERTEX
												Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
												{
												return output;
												}
												#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
												#endif

												// Graph Pixel
												struct SurfaceDescription
												{
													float3 BaseColor;
													float3 Emission;
												};

												SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
												{
													SurfaceDescription surface = (SurfaceDescription)0;
													UnityTexture2D _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0 = UnityBuildTexture2DStructNoScale(_EmissifMat);
													float4 _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0 = SAMPLE_TEXTURE2D(_Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.tex, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.samplerstate, _Property_8e56b809a97f43899c44c8b1d5ca4c48_Out_0.GetTransformedUV(IN.uv0.xy));
													float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_R_4 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.r;
													float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_G_5 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.g;
													float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_B_6 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.b;
													float _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_A_7 = _SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0.a;
													UnityTexture2D _Property_16551451f3164aa69c393744b7124cb1_Out_0 = UnityBuildTexture2DStructNoScale(_ObjectTexture);
													float4 _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0 = SAMPLE_TEXTURE2D(_Property_16551451f3164aa69c393744b7124cb1_Out_0.tex, _Property_16551451f3164aa69c393744b7124cb1_Out_0.samplerstate, _Property_16551451f3164aa69c393744b7124cb1_Out_0.GetTransformedUV(IN.uv0.xy));
													float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_R_4 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.r;
													float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_G_5 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.g;
													float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_B_6 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.b;
													float _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_A_7 = _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0.a;
													float4 _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2;
													Unity_Blend_Subtract_float4(_SampleTexture2D_8ff368245ed34d44ac976531aa5e44ea_RGBA_0, _SampleTexture2D_3d838bd6b2ac4acd837ac42f74fddc31_RGBA_0, _Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, 1);
													float4 _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0 = IsGammaSpace() ? LinearToSRGB(_EmissiveColor) : _EmissiveColor;
													float _Multiply_d41241ae5d464edd87604db068195467_Out_2;
													Unity_Multiply_float_float(IN.TimeParameters.x, 2.5, _Multiply_d41241ae5d464edd87604db068195467_Out_2);
													float _Split_739145460ab147058000d3d2c4affcd0_R_1 = IN.ViewSpacePosition[0];
													float _Split_739145460ab147058000d3d2c4affcd0_G_2 = IN.ViewSpacePosition[1];
													float _Split_739145460ab147058000d3d2c4affcd0_B_3 = IN.ViewSpacePosition[2];
													float _Split_739145460ab147058000d3d2c4affcd0_A_4 = 0;
													float _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2;
													Unity_Subtract_float(_Multiply_d41241ae5d464edd87604db068195467_Out_2, _Split_739145460ab147058000d3d2c4affcd0_G_2, _Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2);
													float _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1;
													Unity_Cosine_float(_Subtract_3dcd11cda14c413baf80d2c79b6bfad9_Out_2, _Cosine_31c49f0b19b34016a28091e311cd5929_Out_1);
													float _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3;
													Unity_Clamp_float(_Cosine_31c49f0b19b34016a28091e311cd5929_Out_1, 0, 0.8, _Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3);
													float _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3;
													Unity_FresnelEffect_float(IN.WorldSpaceNormal, IN.WorldSpaceViewDirection, 1, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3);
													float _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2;
													Unity_Multiply_float_float(_Clamp_1a1f6ef14a0c4a18a73c4b22b7eb0d83_Out_3, _FresnelEffect_edbce6934bee4dec9b61b20ec3c76c64_Out_3, _Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2);
													float4 _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3;
													Unity_Lerp_float4(_Blend_01fe0cfb7de040fcb93577a62f0a7cf1_Out_2, _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3);
													float4 _Lerp_89a8d047a12047f5a78817804e240964_Out_3;
													Unity_Lerp_float4(float4(0, 0, 0, 0), _Property_e8012a2751d84e8792c300e5d1dba68f_Out_0, (_Multiply_3ec789ba4cc947adb38882109a6f3228_Out_2.xxxx), _Lerp_89a8d047a12047f5a78817804e240964_Out_3);
													surface.BaseColor = (_Lerp_058ebd207ab14e1aa336fd2b9e2e5a3a_Out_3.xyz);
													surface.Emission = (_Lerp_89a8d047a12047f5a78817804e240964_Out_3.xyz);
													return surface;
												}

												// --------------------------------------------------
												// Build Graph Inputs

												VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
												{
													VertexDescriptionInputs output;
													ZERO_INITIALIZE(VertexDescriptionInputs, output);

													output.ObjectSpaceNormal = input.normalOS;
													output.ObjectSpaceTangent = input.tangentOS.xyz;
													output.ObjectSpacePosition = input.positionOS;

													return output;
												}
												SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
												{
													SurfaceDescriptionInputs output;
													ZERO_INITIALIZE(SurfaceDescriptionInputs, output);



													// must use interpolated tangent, bitangent and normal before they are normalized in the pixel shader.
													float3 unnormalizedNormalWS = input.normalWS;
													const float renormFactor = 1.0 / length(unnormalizedNormalWS);


													output.WorldSpaceNormal = renormFactor * input.normalWS.xyz;      // we want a unit length Normal Vector node in shader graph


													output.WorldSpaceViewDirection = normalize(input.viewDirectionWS);
													output.ViewSpacePosition = TransformWorldToView(input.positionWS);
													output.uv0 = input.texCoord0;
													output.TimeParameters = _TimeParameters.xyz; // This is mainly for LW as HD overwrite this value
												#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
												#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
												#else
												#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
												#endif
												#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

														return output;
												}

												void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
												{
													result.vertex = float4(attributes.positionOS, 1);
													result.tangent = attributes.tangentOS;
													result.normal = attributes.normalOS;
													result.texcoord = attributes.uv0;
													result.texcoord1 = attributes.uv1;
													result.texcoord2 = attributes.uv2;
													result.vertex = float4(vertexDescription.Position, 1);
													result.normal = vertexDescription.Normal;
													result.tangent = float4(vertexDescription.Tangent, 0);
													#if UNITY_ANY_INSTANCING_ENABLED
													#endif
												}

												void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
												{
													result.pos = varyings.positionCS;
													result.worldPos = varyings.positionWS;
													result.worldNormal = varyings.normalWS;
													result.viewDir = varyings.viewDirectionWS;
													// World Tangent isn't an available input on v2f_surf


													#if UNITY_ANY_INSTANCING_ENABLED
													#endif
													#if UNITY_SHOULD_SAMPLE_SH
													#endif
													#if defined(LIGHTMAP_ON)
													#endif
													#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
														result.fogCoord = varyings.fogFactorAndVertexLight.x;
														COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
													#endif

													DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
												}

												void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
												{
													result.positionCS = surfVertex.pos;
													result.positionWS = surfVertex.worldPos;
													result.normalWS = surfVertex.worldNormal;
													// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
													// World Tangent isn't an available input on v2f_surf

													#if UNITY_ANY_INSTANCING_ENABLED
													#endif
													#if UNITY_SHOULD_SAMPLE_SH
													#endif
													#if defined(LIGHTMAP_ON)
													#endif
													#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
														result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
														COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
													#endif

													DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
												}

												// --------------------------------------------------
												// Main

												#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
												#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
												#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

												ENDHLSL
												}
												Pass
												{
													Name "SceneSelectionPass"
													Tags
													{
														"LightMode" = "SceneSelectionPass"
													}

													// Render State
													Cull Off

													// Debug
													// <None>

													// --------------------------------------------------
													// Pass

													HLSLPROGRAM

													// Pragmas
													#pragma target 3.0
													#pragma multi_compile_instancing
													#pragma vertex vert
													#pragma fragment frag

													// DotsInstancingOptions: <None>
													// HybridV1InjectedBuiltinProperties: <None>

													// Keywords
													// PassKeywords: <None>
													// GraphKeywords: <None>

													// Defines
													#define _NORMALMAP 1
													#define _NORMAL_DROPOFF_TS 1
													#define ATTRIBUTES_NEED_NORMAL
													#define ATTRIBUTES_NEED_TANGENT
													#define FEATURES_GRAPH_VERTEX
													/* WARNING: $splice Could not find named fragment 'PassInstancing' */
													#define SHADERPASS SceneSelectionPass
													#define BUILTIN_TARGET_API 1
													#define SCENESELECTIONPASS 1
													/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
													#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
													#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
													#endif
													#ifdef _BUILTIN_ALPHATEST_ON
													#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
													#endif
													#ifdef _BUILTIN_AlphaClip
													#define _AlphaClip _BUILTIN_AlphaClip
													#endif
													#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
													#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
													#endif


													// custom interpolator pre-include
													/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

													// Includes
													#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
													#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
													#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
													#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
													#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
													#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
													#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

													// --------------------------------------------------
													// Structs and Packing

													// custom interpolators pre packing
													/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

													struct Attributes
													{
														 float3 positionOS : POSITION;
														 float3 normalOS : NORMAL;
														 float4 tangentOS : TANGENT;
														#if UNITY_ANY_INSTANCING_ENABLED
														 uint instanceID : INSTANCEID_SEMANTIC;
														#endif
													};
													struct Varyings
													{
														 float4 positionCS : SV_POSITION;
														#if UNITY_ANY_INSTANCING_ENABLED
														 uint instanceID : CUSTOM_INSTANCE_ID;
														#endif
														#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
														 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
														#endif
														#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
														 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
														#endif
														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
														#endif
													};
													struct SurfaceDescriptionInputs
													{
													};
													struct VertexDescriptionInputs
													{
														 float3 ObjectSpaceNormal;
														 float3 ObjectSpaceTangent;
														 float3 ObjectSpacePosition;
													};
													struct PackedVaryings
													{
														 float4 positionCS : SV_POSITION;
														#if UNITY_ANY_INSTANCING_ENABLED
														 uint instanceID : CUSTOM_INSTANCE_ID;
														#endif
														#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
														 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
														#endif
														#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
														 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
														#endif
														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
														#endif
													};

													PackedVaryings PackVaryings(Varyings input)
													{
														PackedVaryings output;
														ZERO_INITIALIZE(PackedVaryings, output);
														output.positionCS = input.positionCS;
														#if UNITY_ANY_INSTANCING_ENABLED
														output.instanceID = input.instanceID;
														#endif
														#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
														output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
														#endif
														#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
														output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
														#endif
														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														output.cullFace = input.cullFace;
														#endif
														return output;
													}

													Varyings UnpackVaryings(PackedVaryings input)
													{
														Varyings output;
														output.positionCS = input.positionCS;
														#if UNITY_ANY_INSTANCING_ENABLED
														output.instanceID = input.instanceID;
														#endif
														#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
														output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
														#endif
														#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
														output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
														#endif
														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														output.cullFace = input.cullFace;
														#endif
														return output;
													}


													// --------------------------------------------------
													// Graph

													// Graph Properties
													CBUFFER_START(UnityPerMaterial)
													float4 _EmissiveColor;
													float4 _ObjectTexture_TexelSize;
													float4 _EmissifMat_TexelSize;
													float4 _NormalMat_TexelSize;
													CBUFFER_END

														// Object and Global properties
														SAMPLER(SamplerState_Linear_Repeat);
														TEXTURE2D(_ObjectTexture);
														SAMPLER(sampler_ObjectTexture);
														TEXTURE2D(_EmissifMat);
														SAMPLER(sampler_EmissifMat);
														TEXTURE2D(_NormalMat);
														SAMPLER(sampler_NormalMat);

														// -- Property used by ScenePickingPass
														#ifdef SCENEPICKINGPASS
														float4 _SelectionID;
														#endif

														// -- Properties used by SceneSelectionPass
														#ifdef SCENESELECTIONPASS
														int _ObjectId;
														int _PassValue;
														#endif

														// Graph Includes
														// GraphIncludes: <None>

														// Graph Functions
														// GraphFunctions: <None>

														// Custom interpolators pre vertex
														/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

														// Graph Vertex
														struct VertexDescription
														{
															float3 Position;
															float3 Normal;
															float3 Tangent;
														};

														VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
														{
															VertexDescription description = (VertexDescription)0;
															description.Position = IN.ObjectSpacePosition;
															description.Normal = IN.ObjectSpaceNormal;
															description.Tangent = IN.ObjectSpaceTangent;
															return description;
														}

														// Custom interpolators, pre surface
														#ifdef FEATURES_GRAPH_VERTEX
														Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
														{
														return output;
														}
														#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
														#endif

														// Graph Pixel
														struct SurfaceDescription
														{
														};

														SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
														{
															SurfaceDescription surface = (SurfaceDescription)0;
															return surface;
														}

														// --------------------------------------------------
														// Build Graph Inputs

														VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
														{
															VertexDescriptionInputs output;
															ZERO_INITIALIZE(VertexDescriptionInputs, output);

															output.ObjectSpaceNormal = input.normalOS;
															output.ObjectSpaceTangent = input.tangentOS.xyz;
															output.ObjectSpacePosition = input.positionOS;

															return output;
														}
														SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
														{
															SurfaceDescriptionInputs output;
															ZERO_INITIALIZE(SurfaceDescriptionInputs, output);







														#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
														#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
														#else
														#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
														#endif
														#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

																return output;
														}

														void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
														{
															result.vertex = float4(attributes.positionOS, 1);
															result.tangent = attributes.tangentOS;
															result.normal = attributes.normalOS;
															result.vertex = float4(vertexDescription.Position, 1);
															result.normal = vertexDescription.Normal;
															result.tangent = float4(vertexDescription.Tangent, 0);
															#if UNITY_ANY_INSTANCING_ENABLED
															#endif
														}

														void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
														{
															result.pos = varyings.positionCS;
															// World Tangent isn't an available input on v2f_surf


															#if UNITY_ANY_INSTANCING_ENABLED
															#endif
															#if UNITY_SHOULD_SAMPLE_SH
															#endif
															#if defined(LIGHTMAP_ON)
															#endif
															#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
																result.fogCoord = varyings.fogFactorAndVertexLight.x;
																COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
															#endif

															DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
														}

														void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
														{
															result.positionCS = surfVertex.pos;
															// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
															// World Tangent isn't an available input on v2f_surf

															#if UNITY_ANY_INSTANCING_ENABLED
															#endif
															#if UNITY_SHOULD_SAMPLE_SH
															#endif
															#if defined(LIGHTMAP_ON)
															#endif
															#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
																result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
																COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
															#endif

															DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
														}

														// --------------------------------------------------
														// Main

														#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
														#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
														#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

														ENDHLSL
														}
														Pass
														{
															Name "ScenePickingPass"
															Tags
															{
																"LightMode" = "Picking"
															}

															// Render State
															Cull Back

															// Debug
															// <None>

															// --------------------------------------------------
															// Pass

															HLSLPROGRAM

															// Pragmas
															#pragma target 3.0
															#pragma multi_compile_instancing
															#pragma vertex vert
															#pragma fragment frag

															// DotsInstancingOptions: <None>
															// HybridV1InjectedBuiltinProperties: <None>

															// Keywords
															// PassKeywords: <None>
															// GraphKeywords: <None>

															// Defines
															#define _NORMALMAP 1
															#define _NORMAL_DROPOFF_TS 1
															#define ATTRIBUTES_NEED_NORMAL
															#define ATTRIBUTES_NEED_TANGENT
															#define FEATURES_GRAPH_VERTEX
															/* WARNING: $splice Could not find named fragment 'PassInstancing' */
															#define SHADERPASS ScenePickingPass
															#define BUILTIN_TARGET_API 1
															#define SCENEPICKINGPASS 1
															/* WARNING: $splice Could not find named fragment 'DotsInstancingVars' */
															#ifdef _BUILTIN_SURFACE_TYPE_TRANSPARENT
															#define _SURFACE_TYPE_TRANSPARENT _BUILTIN_SURFACE_TYPE_TRANSPARENT
															#endif
															#ifdef _BUILTIN_ALPHATEST_ON
															#define _ALPHATEST_ON _BUILTIN_ALPHATEST_ON
															#endif
															#ifdef _BUILTIN_AlphaClip
															#define _AlphaClip _BUILTIN_AlphaClip
															#endif
															#ifdef _BUILTIN_ALPHAPREMULTIPLY_ON
															#define _ALPHAPREMULTIPLY_ON _BUILTIN_ALPHAPREMULTIPLY_ON
															#endif


															// custom interpolator pre-include
															/* WARNING: $splice Could not find named fragment 'sgci_CustomInterpolatorPreInclude' */

															// Includes
															#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Shim/Shims.hlsl"
															#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
															#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Core.hlsl"
															#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
															#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/Lighting.hlsl"
															#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/LegacySurfaceVertex.hlsl"
															#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/ShaderLibrary/ShaderGraphFunctions.hlsl"

															// --------------------------------------------------
															// Structs and Packing

															// custom interpolators pre packing
															/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPrePacking' */

															struct Attributes
															{
																 float3 positionOS : POSITION;
																 float3 normalOS : NORMAL;
																 float4 tangentOS : TANGENT;
																#if UNITY_ANY_INSTANCING_ENABLED
																 uint instanceID : INSTANCEID_SEMANTIC;
																#endif
															};
															struct Varyings
															{
																 float4 positionCS : SV_POSITION;
																#if UNITY_ANY_INSTANCING_ENABLED
																 uint instanceID : CUSTOM_INSTANCE_ID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
																#endif
															};
															struct SurfaceDescriptionInputs
															{
															};
															struct VertexDescriptionInputs
															{
																 float3 ObjectSpaceNormal;
																 float3 ObjectSpaceTangent;
																 float3 ObjectSpacePosition;
															};
															struct PackedVaryings
															{
																 float4 positionCS : SV_POSITION;
																#if UNITY_ANY_INSTANCING_ENABLED
																 uint instanceID : CUSTOM_INSTANCE_ID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																 uint stereoTargetEyeIndexAsBlendIdx0 : BLENDINDICES0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																 uint stereoTargetEyeIndexAsRTArrayIdx : SV_RenderTargetArrayIndex;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																 FRONT_FACE_TYPE cullFace : FRONT_FACE_SEMANTIC;
																#endif
															};

															PackedVaryings PackVaryings(Varyings input)
															{
																PackedVaryings output;
																ZERO_INITIALIZE(PackedVaryings, output);
																output.positionCS = input.positionCS;
																#if UNITY_ANY_INSTANCING_ENABLED
																output.instanceID = input.instanceID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																output.cullFace = input.cullFace;
																#endif
																return output;
															}

															Varyings UnpackVaryings(PackedVaryings input)
															{
																Varyings output;
																output.positionCS = input.positionCS;
																#if UNITY_ANY_INSTANCING_ENABLED
																output.instanceID = input.instanceID;
																#endif
																#if (defined(UNITY_STEREO_MULTIVIEW_ENABLED)) || (defined(UNITY_STEREO_INSTANCING_ENABLED) && (defined(SHADER_API_GLES3) || defined(SHADER_API_GLCORE)))
																output.stereoTargetEyeIndexAsBlendIdx0 = input.stereoTargetEyeIndexAsBlendIdx0;
																#endif
																#if (defined(UNITY_STEREO_INSTANCING_ENABLED))
																output.stereoTargetEyeIndexAsRTArrayIdx = input.stereoTargetEyeIndexAsRTArrayIdx;
																#endif
																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																output.cullFace = input.cullFace;
																#endif
																return output;
															}


															// --------------------------------------------------
															// Graph

															// Graph Properties
															CBUFFER_START(UnityPerMaterial)
															float4 _EmissiveColor;
															float4 _ObjectTexture_TexelSize;
															float4 _EmissifMat_TexelSize;
															float4 _NormalMat_TexelSize;
															CBUFFER_END

																// Object and Global properties
																SAMPLER(SamplerState_Linear_Repeat);
																TEXTURE2D(_ObjectTexture);
																SAMPLER(sampler_ObjectTexture);
																TEXTURE2D(_EmissifMat);
																SAMPLER(sampler_EmissifMat);
																TEXTURE2D(_NormalMat);
																SAMPLER(sampler_NormalMat);

																// -- Property used by ScenePickingPass
																#ifdef SCENEPICKINGPASS
																float4 _SelectionID;
																#endif

																// -- Properties used by SceneSelectionPass
																#ifdef SCENESELECTIONPASS
																int _ObjectId;
																int _PassValue;
																#endif

																// Graph Includes
																// GraphIncludes: <None>

																// Graph Functions
																// GraphFunctions: <None>

																// Custom interpolators pre vertex
																/* WARNING: $splice Could not find named fragment 'CustomInterpolatorPreVertex' */

																// Graph Vertex
																struct VertexDescription
																{
																	float3 Position;
																	float3 Normal;
																	float3 Tangent;
																};

																VertexDescription VertexDescriptionFunction(VertexDescriptionInputs IN)
																{
																	VertexDescription description = (VertexDescription)0;
																	description.Position = IN.ObjectSpacePosition;
																	description.Normal = IN.ObjectSpaceNormal;
																	description.Tangent = IN.ObjectSpaceTangent;
																	return description;
																}

																// Custom interpolators, pre surface
																#ifdef FEATURES_GRAPH_VERTEX
																Varyings CustomInterpolatorPassThroughFunc(inout Varyings output, VertexDescription input)
																{
																return output;
																}
																#define CUSTOMINTERPOLATOR_VARYPASSTHROUGH_FUNC
																#endif

																// Graph Pixel
																struct SurfaceDescription
																{
																};

																SurfaceDescription SurfaceDescriptionFunction(SurfaceDescriptionInputs IN)
																{
																	SurfaceDescription surface = (SurfaceDescription)0;
																	return surface;
																}

																// --------------------------------------------------
																// Build Graph Inputs

																VertexDescriptionInputs BuildVertexDescriptionInputs(Attributes input)
																{
																	VertexDescriptionInputs output;
																	ZERO_INITIALIZE(VertexDescriptionInputs, output);

																	output.ObjectSpaceNormal = input.normalOS;
																	output.ObjectSpaceTangent = input.tangentOS.xyz;
																	output.ObjectSpacePosition = input.positionOS;

																	return output;
																}
																SurfaceDescriptionInputs BuildSurfaceDescriptionInputs(Varyings input)
																{
																	SurfaceDescriptionInputs output;
																	ZERO_INITIALIZE(SurfaceDescriptionInputs, output);







																#if defined(SHADER_STAGE_FRAGMENT) && defined(VARYINGS_NEED_CULLFACE)
																#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN output.FaceSign =                    IS_FRONT_VFACE(input.cullFace, true, false);
																#else
																#define BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN
																#endif
																#undef BUILD_SURFACE_DESCRIPTION_INPUTS_OUTPUT_FACESIGN

																		return output;
																}

																void BuildAppDataFull(Attributes attributes, VertexDescription vertexDescription, inout appdata_full result)
																{
																	result.vertex = float4(attributes.positionOS, 1);
																	result.tangent = attributes.tangentOS;
																	result.normal = attributes.normalOS;
																	result.vertex = float4(vertexDescription.Position, 1);
																	result.normal = vertexDescription.Normal;
																	result.tangent = float4(vertexDescription.Tangent, 0);
																	#if UNITY_ANY_INSTANCING_ENABLED
																	#endif
																}

																void VaryingsToSurfaceVertex(Varyings varyings, inout v2f_surf result)
																{
																	result.pos = varyings.positionCS;
																	// World Tangent isn't an available input on v2f_surf


																	#if UNITY_ANY_INSTANCING_ENABLED
																	#endif
																	#if UNITY_SHOULD_SAMPLE_SH
																	#endif
																	#if defined(LIGHTMAP_ON)
																	#endif
																	#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
																		result.fogCoord = varyings.fogFactorAndVertexLight.x;
																		COPY_TO_LIGHT_COORDS(result, varyings.fogFactorAndVertexLight.yzw);
																	#endif

																	DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(varyings, result);
																}

																void SurfaceVertexToVaryings(v2f_surf surfVertex, inout Varyings result)
																{
																	result.positionCS = surfVertex.pos;
																	// viewDirectionWS is never filled out in the legacy pass' function. Always use the value computed by SRP
																	// World Tangent isn't an available input on v2f_surf

																	#if UNITY_ANY_INSTANCING_ENABLED
																	#endif
																	#if UNITY_SHOULD_SAMPLE_SH
																	#endif
																	#if defined(LIGHTMAP_ON)
																	#endif
																	#ifdef VARYINGS_NEED_FOG_AND_VERTEX_LIGHT
																		result.fogFactorAndVertexLight.x = surfVertex.fogCoord;
																		COPY_FROM_LIGHT_COORDS(result.fogFactorAndVertexLight.yzw, surfVertex);
																	#endif

																	DEFAULT_UNITY_TRANSFER_VERTEX_OUTPUT_STEREO(surfVertex, result);
																}

																// --------------------------------------------------
																// Main

																#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
																#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/Varyings.hlsl"
																#include "Packages/com.unity.shadergraph/Editor/Generation/Targets/BuiltIn/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

																ENDHLSL
																}
}
CustomEditorForRenderPipeline "UnityEditor.Rendering.BuiltIn.ShaderGraph.BuiltInLitGUI" ""
CustomEditor "UnityEditor.ShaderGraph.GenericShaderGraphMaterialGUI"
FallBack "Hidden/Shader Graph/FallbackError"
}