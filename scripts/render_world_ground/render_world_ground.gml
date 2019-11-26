/// render_world_ground()
/// @desc Renders a grid in the middle of the world

// Shading
render_set_uniform_color("uBlendColor", c_white, 1)
render_set_uniform_int("uIsGround", 1)
render_set_uniform("uBrightness", 1)
render_set_uniform_color("uMixColor", c_black, 0)
render_set_texture(spr_empty)

// Grid
if (cam_from[Z] > 0)
	vbuffer_render(background_ground_vbuffer, vec3(0), vec3(0), vec3(1), pr_linelist)

// Axis divide
render_set_uniform_color("uBlendColor", test(setting_z_is_up, c_axisgreen, c_axisblue), 1)
vbuffer_render(background_ground_axis_vbuffer, point3D(0, 0, 0), vec3(0, 0, -90), vec3(1), pr_linelist)
render_set_uniform_color("uBlendColor", c_axisred, 1)
vbuffer_render(background_ground_axis_vbuffer, point3D(0, 0, 0), vec3(0, 0, 0), vec3(1), pr_linelist)

// Arrow
render_set_uniform_color("uBlendColor", test(setting_z_is_up, c_axisgreen, c_axisblue), 1)
vbuffer_render(background_ground_arrow_vbuffer, point3D(0, 20 * 8, 0), vec3(0, 0, -90), vec3(1), pr_linelist)
vbuffer_render(background_ground_arrow_vbuffer, point3D(0, 20 * 8, 0), vec3(0, 0, -90), vec3(1.25), pr_linelist)
render_set_uniform_color("uBlendColor", c_axisred, 1)
vbuffer_render(background_ground_arrow_vbuffer, point3D(20 * 8, 0, 0), vec3(0), vec3(1), pr_linelist)

// Position arrows
render_set_uniform_color("uBlendColor", c_axisred, 1)
vbuffer_render(background_ground_x_vbuffer, point3D(19 * 8, 0, 0), vec3(0, 0, 0), vec3(2), pr_linelist)

render_set_uniform_color("uBlendColor", test(setting_z_is_up, c_axisgreen, c_axisblue), 1)
if (setting_z_is_up)
	vbuffer_render(background_ground_y_vbuffer, point3D(0, 19 * 8, 0), vec3(0, 0, -90), vec3(2), pr_linelist)
else
	vbuffer_render(background_ground_z_vbuffer, point3D(0, 19 * 8, 0), vec3(0, 0, -90), vec3(2), pr_linelist)