/// render_high()

var ssaosurf, shadowssurf;

// SSAO
if (setting_render_ssao)
{
	var depthsurf, normalsurf, brightnesssurf;

	// Get depth and normal information
	render_surface[1] = surface_require(render_surface[1], render_width, render_height)
	render_surface[2] = surface_require(render_surface[2], render_width, render_height)
	render_surface[3] = surface_require(render_surface[3], render_width, render_height)
	depthsurf = render_surface[1]
	normalsurf = render_surface[2]
	brightnesssurf = render_surface[3]
	surface_set_target_ext(0, depthsurf)
	surface_set_target_ext(1, normalsurf)
	surface_set_target_ext(2, brightnesssurf)
	{
		draw_clear_alpha(c_white, 0)
		render_world_start(5000)
		render_world(e_render_mode.HIGH_SSAO_DEPTH_NORMAL)
		render_world_done()
	}
	surface_reset_target()
	
	// Noise texture
	if (!surface_exists(render_ssao_noise))
		render_ssao_noise = render_generate_noise(4, 4)
	
	// Calculate SSAO
	render_surface[0] = surface_require(render_surface[0], render_width, render_height)
	ssaosurf = render_surface[0]
	surface_set_target(ssaosurf)
	{
		gpu_set_texrepeat(false)
		draw_clear(c_white)
		render_shader_obj = shader_map[?shader_high_ssao]
		with (render_shader_obj)
		{
			shader_set(shader)
			shader_high_ssao_set(depthsurf, normalsurf, brightnesssurf)
		}
		draw_blank(0, 0, render_width, render_height) // Blank quad
		with (render_shader_obj)
			shader_clear()
		gpu_set_texrepeat(true)
	}
	surface_reset_target()
	
	// Blur
	repeat (setting_render_ssao_blur_passes)
	{
		var ssaosurftemp;
		render_surface[3] = surface_require(render_surface[3], render_width, render_height)
		ssaosurftemp = render_surface[3]
		
		render_shader_obj = shader_map[?shader_high_ssao_blur]
		with (render_shader_obj)
			shader_set(shader)
		
		// Horizontal
		surface_set_target(ssaosurftemp)
		{
			with (render_shader_obj)
				shader_high_ssao_blur_set(depthsurf, normalsurf, 1, 0)
			draw_surface_exists(ssaosurf, 0, 0)
		}
		surface_reset_target()
		
		// Vertical
		surface_set_target(ssaosurf)
		{
			with (render_shader_obj)
				shader_high_ssao_blur_set(depthsurf, normalsurf, 0, 1)
			draw_surface_exists(ssaosurftemp, 0, 0)
		}
		surface_reset_target()
		
		with (render_shader_obj)
			shader_clear()
	}
	gpu_set_texrepeat(true)
}

// Sun
if (setting_render_shadows)
{
	var shadowsurftemp;
	
	render_surface[1] = surface_require(render_surface[1], render_width, render_height)
	shadowssurf = render_surface[1]
	
	surface_set_target(shadowssurf)
	{
		draw_clear_alpha(c_black, 1)
	}
	surface_reset_target()
	
	/*
		Light one: Key light
		Light two: Back light(Opposite of key light)
		Light three: Bottom light
	*/
	
	for (var i = 0; i < 3; i++)
	{
		var background_light_data, background_sunlight_range, background_sky_rotation, background_sky_time, background_sunlight_color_final;
		background_sunlight_range = setting_preview_light_range
		background_sky_rotation = setting_preview_light_rotation
		background_sky_time = test(setting_preview_time = 0, 45, test(setting_preview_time = 1, 65, 180))
		
		// Rotate back light opposite to key light
		if (i = 1)
			background_sky_time += 180
		
		// Set light to bottom of scene
		if (i = 2)
			background_sky_time = 180
		
		background_sunlight_color_final = setting_preview_light_color[i]
		
		if (background_sunlight_color_final = c_black)
			continue
		
		background_light_data[0] = lengthdir_x(background_sunlight_range, background_sky_rotation - 90) * lengthdir_x(1, background_sky_time + 90)
		background_light_data[1] = lengthdir_y(background_sunlight_range, background_sky_rotation - 90) * lengthdir_x(1, background_sky_time + 90)
		background_light_data[2] = lengthdir_z(background_sunlight_range, background_sky_time + 90)
		if (background_sky_time = 0)
			background_light_data[0] += 0.1
		background_light_data[3] = background_sunlight_range / 2
		background_light_data[4] = color_get_red(background_sunlight_color_final) / 255
		background_light_data[5] = color_get_green(background_sunlight_color_final) / 255
		background_light_data[6] = color_get_blue(background_sunlight_color_final) / 255
		background_light_data[7] = background_sunlight_range * 2
	
		// Depth
		render_surface_sun_buffer = surface_require(render_surface_sun_buffer, setting_render_shadows_sun_buffer_size, setting_render_shadows_sun_buffer_size)
		surface_set_target(render_surface_sun_buffer)
		{	
			draw_clear(c_white)
			
			// Only key light casts shadows
			render_world_start_light(
				point3D(background_light_data[0], background_light_data[1], background_light_data[2]), 
				point3D(0, 0, 0), 
				background_light_data[3], background_light_data[7], 
				45, background_sunlight_color_final
			)
			render_world(e_render_mode.HIGH_LIGHT_SUN_DEPTH)
			render_world_done()
		}
		surface_reset_target()
	
		// Create initial shadow surface from sun
		render_surface[2] = surface_require(render_surface[2], render_width, render_height)
		shadowsurftemp = render_surface[2]
		surface_set_target(shadowsurftemp)
		{
			draw_clear(c_white)
			render_world_start()
			render_world(e_render_mode.HIGH_LIGHT_SUN)
			render_world_done()
		}
		surface_reset_target()
		
		// Add shadow
		gpu_set_blendmode(bm_add)
		surface_set_target(shadowssurf)
		{
			draw_surface(shadowsurftemp, 0, 0)
		}
		surface_reset_target()
		gpu_set_blendmode(bm_normal)
	}
	
	// Apply shadows to SSAO
	gpu_set_blendmode(bm_add)
	if (setting_render_ssao)
	{
		surface_set_target(ssaosurf)
		{
			draw_surface(shadowssurf, 0, 0)
		}
		surface_reset_target()
	}
	
	// Add ambient shadows
	surface_set_target(shadowssurf)
	{
		draw_box(0, 0, render_width, render_height, false, setting_preview_ambient_color, 1)
	}
	surface_reset_target()
	gpu_set_blendmode(bm_normal)
}

// Render scene and shadows
var finalsurf;
if (setting_render_aa)
{
	render_surface[3] = surface_require(render_surface[3], render_width, render_height)
	finalsurf = render_surface[3]
}	
else
{
	render_target = surface_require(render_target, render_width, render_height)
	finalsurf = render_target
}

surface_set_target(finalsurf)
{
	draw_clear_alpha(c_black, 0)
	
	// Background/Sky
	render_world_start()
	render_world_background()
	render_world_done()
	
	// World
	render_world_start()
	render_world(e_render_mode.COLOR)
	render_world_done()
	
	// Apply shadows and AO
	render_set_projection_ortho(0, 0, render_width, render_height, 0)
	
	gpu_set_blendmode_ext(bm_zero, bm_src_color)
	
	if (setting_render_shadows)
		draw_surface(shadowssurf, 0, 0)
	
	if (setting_render_ssao)
		draw_surface(ssaosurf, 0, 0)
	
	gpu_set_blendmode(bm_normal)
	
	// Alpha fix
	gpu_set_blendmode_ext(bm_src_color, bm_one) 
	if (render_background)
		draw_box(0, 0, render_width, render_height, false, c_black, 1)
	else
	{
		render_world_start()
		render_world(e_render_mode.ALPHA_FIX)
		render_world_done()
	}
	gpu_set_blendmode(bm_normal)
}
surface_reset_target()

// AA
if (setting_render_aa)
{
	render_target = surface_require(render_target, render_width, render_height)
	var prevsurf = finalsurf;
	surface_set_target(render_target)
	{
		draw_clear_alpha(c_black, 0)
		
		render_shader_obj = shader_map[?shader_high_aa]
		with (render_shader_obj)
			shader_use()
		draw_surface_exists(prevsurf, 0, 0)
		with (render_shader_obj)
			shader_clear()
		
		// Alpha fix
		gpu_set_blendmode_ext(bm_src_color, bm_one) 
		if (render_background)
			draw_box(0, 0, render_width, render_height, false, c_black, 1)
		else
		{
			render_world_start()
			render_world(e_render_mode.ALPHA_TEST)
			render_world_done()
		}
		gpu_set_blendmode(bm_normal)
		
	}
	surface_reset_target()
}