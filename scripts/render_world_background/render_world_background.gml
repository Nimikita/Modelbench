/// render_world_background()

render_mode = e_render_mode.SKY
render_shader_obj = shader_map[?render_mode_shader_map[?render_mode]]
with (render_shader_obj)
	shader_use()

// Set up uniforms
render_set_uniform_color("uColorTop", c_viewport_top, 1)
render_set_uniform_color("uColorBottom", c_viewport_bottom, 1)
render_set_uniform("uHorizonPow", 6.5)
render_set_uniform("uContrast", 1)

// Submit sphere mesh
vbuffer_render(background_sky_vbuffer, cam_from, vec3(0), vec3(15000))
