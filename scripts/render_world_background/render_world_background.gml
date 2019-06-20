/// render_world_background()

render_mode = e_render_mode.SKY
render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
with (render_shader_obj)
	shader_use()

// Set up uniforms
render_set_uniform_color("uColorLight", hex_to_color("#5A90C3"), 1)
render_set_uniform_color("uColorDark", hex_to_color("#223A5C"), 1)
render_set_uniform("uHorizonPow", 6.5)
render_set_uniform("uContrast", 1.1)

// Submit sphere mesh
vbuffer_render(background_sky_vbuffer, cam_from, vec3(0), vec3(15000))

/* Submit sphere mesh
render_mode = e_render_mode.PREVIEW
render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
with (render_shader_obj)
	shader_use()

var background_light_data, background_sunlight_range, background_sky_rotation, background_sky_time, background_sunlight_color_final;
background_sunlight_range = 2000
background_sky_rotation = current_step * 2
background_sky_time = 45//current_step * .25
background_sunlight_color_final = c_white//hex_to_color("FEFFE9")

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

// Set up uniforms
//render_set_uniform_color("uColorLight", hex_to_color("#D11B00"), 1)
//render_set_uniform_color("uColorDark", hex_to_color("#650E03"), 1)
render_set_uniform_color("uColorLight", hex_to_color("#274CD3"), 1)
render_set_uniform_color("uColorDark", hex_to_color("#0F136A"), 1)

render_set_uniform_vec3("uLightPosition", background_light_data[0], background_light_data[1], background_light_data[2])
render_set_uniform_int("uIsGround", 0)

vbuffer_render(background_preview_sky_vbuffer)

render_set_uniform_int("uIsGround", 1)
vbuffer_render(background_preview_ground_vbuffer, vec3(0, 0, -0.2), vec3(-90, 0, 0))
vbuffer_render(background_preview_ground_vbuffer, vec3(0, 0, 2500 - 300), vec3(90, 0, 0))

shader_clear()
*/