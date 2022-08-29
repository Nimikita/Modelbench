/// shader_high_light_sun_set()

function shader_high_light_sun_set()
{
	render_set_uniform_int("uIsGround", 0)
	render_set_uniform_int("uIsSky", 0)
	render_set_uniform_int("uIsWater", 0)
	
	render_set_uniform("uLightMatrix", render_light_matrix)
	render_set_uniform_vec3("uSunAt", 0, 0, 0)
	
	render_set_uniform_vec3("uLightPosition", render_light_from[X], render_light_from[Y], render_light_from[Z])
	render_set_uniform("uLightNear", render_light_near)
	render_set_uniform("uLightFar", render_light_far)
	render_set_uniform_color("uLightColor", render_light_color, 1)
	render_set_uniform("uLightAmount", app.setting_preview_lights)
	
	texture_set_stage(sampler_map[?"uDepthBuffer"], surface_get_texture(render_surface_sun_buffer))
	gpu_set_texfilter_ext(sampler_map[?"uDepthBuffer"], true)
	
	if (app.setting_render_shadows_blur_size > 0)
		render_set_uniform_int("uBlurQuality", app.setting_render_shadows_blur_quality)
	else
		render_set_uniform_int("uBlurQuality", 1)
	
	if (app.setting_render_shadows_blur_quality > 1)
		render_set_uniform("uBlurSize", app.setting_render_shadows_blur_size)
	else
		render_set_uniform("uBlurSize", 0)
}
