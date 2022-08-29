/// shader_use()
/// @desc Sets the shader and defines the common uniforms

function shader_use()
{
	shader_set(shader)
	
	// Default color
	render_set_uniform_color("uBlendColor", c_white, 1)
	
	// Set wind
	if (!is_undefined(uniform_map[?"uTime"]) && uniform_map[?"uTime"] > -1)
	{
		render_set_uniform("uTime", current_step)
		render_set_uniform("uWindEnable", 0)
		render_set_uniform("uWindTerrain", 1)
		render_set_uniform("uWindSpeed", app.setting_wind * app.setting_wind_speed)
		render_set_uniform("uWindStrength", app.setting_wind_strength) 
	}
	
	// Set camera position
	if (!is_undefined(uniform_map[?"uCameraPosition"]) && uniform_map[?"uCameraPosition"] > -1)
		render_set_uniform_vec3("uCameraPosition", cam_from[X], cam_from[Y], cam_from[Z])
	
	// Init script
	if (script > -1)
		script_execute(script)
}
