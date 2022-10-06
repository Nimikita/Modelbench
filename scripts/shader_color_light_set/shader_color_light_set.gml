/// shader_color_light_set()

function shader_color_light_set()
{
	render_set_uniform_color("uLightColor", c_white, 1)
	
	render_set_uniform_color("uAmbientColor", c_dkgray, 1)
	
	var dir = vec3_normalize(vec3_sub(cam_from, cam_to));
	render_set_uniform_vec3("uCameraDirection", dir[X], dir[Y], dir[Z])
}
