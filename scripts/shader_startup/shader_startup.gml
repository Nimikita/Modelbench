/// shader_startup()

globalvar shader_map, shader_texture_surface, shader_texture_filter_linear, shader_texture_filter_mipmap;
globalvar shader_blend_color, shader_blend_alpha;

// Init shaders
log("Shader init")
log("shaders_are_supported", yesno(shaders_are_supported()))

var err = false;
if (!shaders_are_supported())
	err = true

// Compiled?
if (!err)
{
	shader_map = ds_map_create()
	
	shader_texture_surface = false
	shader_texture_filter_linear = false
	shader_texture_filter_mipmap = false
	
	new_shader("shader_draw_texture")
	new_shader("shader_color")
	new_shader("shader_sky")
	new_shader("shader_preview")
	new_shader("shader_depth")
	new_shader("shader_high_light_sun")
	new_shader("shader_high_ssao")
	new_shader("shader_high_ssao_blur")
	new_shader("shader_high_ssao_depth_normal")
	new_shader("shader_shape")
	new_shader("shader_shape_outline")
	new_shader("shader_normals")
	new_shader("shader_high_aa")
	new_shader("shader_border")
	
	with (obj_shader)
	{
		log(name + " compiled", yesno(shader_is_compiled(shader)))
		
		if (!shader_is_compiled(shader))
		{
			err = true
			break
		}
	}
	
}

if (err)
{
	log("Shader compilation failed, try updating your graphics drivers.")
	show_message("Some shaders failed to compile.\nCheck that your graphics drivers are up-to-date and restart Modelbench.")
		
	game_end()
	return false
}

with (shader_map[?shader_color])
{
	new_shader_uniform("uMixColor")
}

with (shader_map[?shader_sky])
{
	new_shader_uniform("uColorLight")
	new_shader_uniform("uColorDark")
	new_shader_uniform("uHorizonPow")
	new_shader_uniform("uContrast")
}

with (shader_map[?shader_preview])
{
	new_shader_uniform("uColorLight")
	new_shader_uniform("uColorDark")
	new_shader_uniform("uLightPosition")
	new_shader_uniform("uIsGround")
}

with (shader_map[?shader_depth])
{
	new_shader_uniform("uNear")
	new_shader_uniform("uFar")
}

with (shader_map[?shader_high_light_sun])
{
	new_shader_uniform("uBrightness")
	new_shader_uniform("uBlockBrightness")
	new_shader_uniform("uLightBleed")
	new_shader_uniform("uIsGround")
	new_shader_uniform("uSunAt")
	new_shader_uniform("uIsSky")
	new_shader_uniform("uIsWater")
	new_shader_uniform("uLightMatrix")
	new_shader_uniform("uLightPosition")
	new_shader_uniform("uLightNear")
	new_shader_uniform("uLightFar")
	new_shader_uniform("uLightColor")
	new_shader_sampler("uDepthBuffer")
	new_shader_uniform("uBlurQuality")
	new_shader_uniform("uBlurSize")
	new_shader_uniform("uDiffuseBoost")
	new_shader_uniform("uBleedLight")
}

with (shader_map[?shader_high_ssao])
{
	new_shader_sampler("uDepthBuffer")
	new_shader_sampler("uNormalBuffer")
	new_shader_sampler("uBrightnessBuffer")
	new_shader_sampler("uNoiseBuffer")
	new_shader_uniform("uNear")
	new_shader_uniform("uFar")
	new_shader_uniform("uProjMatrix")
	new_shader_uniform("uProjMatrixInv")
	new_shader_uniform("uScreenSize")
	new_shader_uniform("uKernel")
	new_shader_uniform("uRadius")
	new_shader_uniform("uPower")
	new_shader_uniform("uColor")
}

with (shader_map[?shader_high_ssao_blur])
{
	new_shader_sampler("uDepthBuffer")
	new_shader_sampler("uNormalBuffer")
	new_shader_uniform("uScreenSize")
	new_shader_uniform("uPixelCheck")
}

with (shader_map[?shader_high_ssao_depth_normal])
{
	new_shader_uniform("uSSAOEnable")
	new_shader_uniform("uBrightness")
	new_shader_uniform("uNear")
	new_shader_uniform("uFar")
}

with (shader_map[?shader_shape])
	new_shader_uniform("uShape")
	
with (shader_map[?shader_shape_outline])
{
	new_shader_sampler("uShapeBuffer")
	new_shader_sampler("uNormalBuffer")
	new_shader_uniform("uTexSize")
	new_shader_uniform("uStrength")
}

with (shader_map[?shader_high_aa])
{
	new_shader_uniform("uScreenSize")
	new_shader_uniform("uPower")
}

with (shader_map[?shader_border])
{
	new_shader_uniform("uTexSize")
	new_shader_uniform("uColor")
	new_shader_uniform("uSize")
}

return true
