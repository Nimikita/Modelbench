/// render_world_background()

if (!render_background)
	return 0

if (program_mode = e_mode.MODELING || (program_mode = e_mode.PREVIEW && !setting_preview_cubemap_sprite))
{
	// Colored sphere mesh
	render_mode = e_render_mode.SKY
	render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
	with (render_shader_obj)
		shader_use()
	
	// Set up uniforms
	if (program_mode = e_mode.MODELING)
	{
		render_set_uniform_color("uColorTop", c_viewport_top, 1)
		render_set_uniform_color("uColorBottom", c_viewport_bottom, 1)
	}
	else
	{
		render_set_uniform_color("uColorTop", setting_preview_background_top, 1)
		render_set_uniform_color("uColorBottom", setting_preview_background_bottom, 1)
	}
	
	render_set_uniform("uHorizonPow", 6.5)
	render_set_uniform("uContrast", 1)
	
	vbuffer_render(background_sky_vbuffer, cam_from, vec3(0), vec3(15000))
}
else
{
	// Cube map
	render_mode = e_render_mode.COLOR
	render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
	with (render_shader_obj)
		shader_use()
	
	render_set_uniform_color("uBlendColor", c_white, 1)
	render_set_uniform_color("uMixColor", c_black, 0)
	render_set_uniform_color("uHighlightColor", c_black, 0)
	
	// Cube map
	render_set_texture(setting_preview_cubemap_sprite)
	vbuffer_render(background_cube_vbuffer, cam_from, vec3(0), vec3(15000))
}