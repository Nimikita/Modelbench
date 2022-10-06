/// render_world_ground()
/// @desc Renders a grid in the middle of the world

function render_world_ground()
{
	if (!setting_overlays || !setting_overlays_grid)
		return 0
	
	var shaderprev = shader_current();
	
	render_shader_obj = shader_map[?shader_ground]
	with (render_shader_obj)
		shader_use()
	
	// Shading
	render_set_uniform_color("uBlendColor", c_white, 1)
	render_set_uniform_color("uFadeColor", c_viewport_bottom, 1)
	render_set_uniform_color("uFadeColor", c_viewport_bottom, 1)
	render_set_uniform("uFadeStart", 1536)
	render_set_uniform("uFadeEnd", 1536 * 2)
	render_set_uniform_int("uFade", 0)
	
	// Grid
	if (cam_from[Z] > 0)
	{
		render_set_uniform_int("uFade", 1)
		render_set_uniform("uFadeStart", 96)
		render_set_uniform("uFadeEnd", 160)
		render_set_uniform_color("uBlendColor", merge_color(c_viewport_bottom, c_text_main, .05), 1)
		vbuffer_render(background_ground_vbuffer_pixel, vec3(0, 0, -0.015), vec3(0), vec3(1), pr_linelist)
		
		render_set_uniform_int("uFade", 0)
		render_set_uniform("uFadeStart", 1536)
		render_set_uniform("uFadeEnd", 1536 * 2)
		//render_set_uniform("uFadeStart", 192)
		//render_set_uniform("uFadeEnd", 384)
		render_set_uniform_color("uBlendColor", merge_color(c_viewport_bottom, c_text_main, .12), 1)
		vbuffer_render(background_ground_vbuffer_light, vec3(0, 0, 0), vec3(0), vec3(1), pr_linelist)
		
		//render_set_uniform("uFadeStart", 384)
		//render_set_uniform("uFadeEnd", 768)
		render_set_uniform_color("uBlendColor", merge_color(merge_color(c_viewport_bottom, c_viewport_top, .5), c_text_main, .2), 1)
		vbuffer_render(background_ground_vbuffer, vec3(0, 0, 0), vec3(0), vec3(1), pr_linelist)
		render_set_uniform_int("uFade", 0)
	}
	
	render_set_uniform("uFadeStart", 1536)
	render_set_uniform("uFadeEnd", 1536 * 2)
	
	// Axis divide
	render_set_uniform_color("uBlendColor", setting_z_is_up ? c_axisgreen : c_axisblue, 1)
	vbuffer_render(background_ground_axis_vbuffer, point3D(0, 0, 0), vec3(0, 0, -90), vec3(1), pr_linelist)
	render_set_uniform_color("uBlendColor", c_axisred, 1)
	vbuffer_render(background_ground_axis_vbuffer, point3D(0, 0, 0), vec3(0, 0, 0), vec3(1), pr_linelist)
	
	// Arrow
	render_set_uniform_color("uBlendColor", setting_z_is_up ? c_axisgreen : c_axisblue, 1)
	vbuffer_render(background_ground_arrow_vbuffer, point3D(0, 29 * 8, 0), vec3(0, 0, -90), vec3(1), pr_linelist)
	vbuffer_render(background_ground_arrow_vbuffer, point3D(0, 29 * 8, 0), vec3(0, 0, -90), vec3(1.25), pr_linelist)
	render_set_uniform_color("uBlendColor", c_axisred, 1)
	vbuffer_render(background_ground_arrow_vbuffer, point3D(29 * 8, 0, 0), vec3(0), vec3(1), pr_linelist)
	
	// Position arrows
	render_set_uniform_color("uBlendColor", c_axisred, 1)
	vbuffer_render(background_ground_x_vbuffer, point3D(28 * 8, 0, 0), vec3(0, 0, 0), vec3(2), pr_linelist)
	
	render_set_uniform_color("uBlendColor", setting_z_is_up ? c_axisgreen : c_axisblue, 1)
	if (setting_z_is_up)
		vbuffer_render(background_ground_y_vbuffer, point3D(0, 28 * 8, 0), vec3(0, 0, -90), vec3(2), pr_linelist)
	else
		vbuffer_render(background_ground_z_vbuffer, point3D(0, 28 * 8, 0), vec3(0, 0, -90), vec3(2), pr_linelist)
	
	render_shader_obj = shader_map[?shaderprev]
	with (render_shader_obj)
		shader_use()
}
