/// render_startup()

globalvar render_width, render_height, render_ratio, render_camera, render_target, proj_from, render_proj_from, proj_matrix, view_matrix,
		  view_proj_matrix, render_prev_color, render_prev_alpha, render_list, render_surface_time, render_background, render_overlay, render_ssao,
		  render_shadows, render_aa;

globalvar render_light_from, render_light_to, render_light_near, render_light_far, render_light_fov, render_light_color, proj_depth_near, proj_depth_far, 
		  render_light_matrix, render_surface;

log("Render init")

gpu_set_blendenable(true)
gpu_set_blendmode(bm_normal)
gpu_set_alphatestenable(true)
gpu_set_alphatestref(0)
gpu_set_texfilter(false)
gpu_set_tex_mip_enable(mip_off)
gpu_set_tex_mip_filter(tf_linear)
gpu_set_texrepeat(true)
gpu_set_ztestenable(false)
gpu_set_zwriteenable(false)
render_set_culling(true)

render_width = 1
render_height = 1
render_ratio = 1
render_camera = null
render_target = null
render_overlay = null
render_ssao = false
render_shadows = false
render_aa = false

render_list = ds_list_create()
render_surface_time = 0
render_background = true

render_surface[0] = null
render_surface[1] = null
render_surface[2] = null
render_surface[3] = null

// Sun shadows
globalvar render_surface_sun_buffer;
render_surface_sun_buffer = null

// SSAO
globalvar render_ssao_kernel, render_ssao_noise;
render_ssao_kernel = render_generate_sample_kernel(16)
render_ssao_noise = null

// Render modes
globalvar render_mode, render_mode_shader_map, render_shader_obj;
render_mode_shader_map = ds_map_create()
render_mode_shader_map[?e_render_mode.COLOR] = shader_color
render_mode_shader_map[?e_render_mode.COLOR_LIGHT] = shader_color_light
render_mode_shader_map[?e_render_mode.SKY] = shader_sky
render_mode_shader_map[?e_render_mode.PREVIEW] = shader_preview
render_mode_shader_map[?e_render_mode.HIGH_LIGHT_SUN_DEPTH] = shader_depth
render_mode_shader_map[?e_render_mode.HIGH_LIGHT_SUN] = shader_high_light_sun
render_mode_shader_map[?e_render_mode.HIGH_SSAO_DEPTH_NORMAL] = shader_high_ssao_depth_normal
render_mode_shader_map[?e_render_mode.SHAPE] = shader_shape
render_mode_shader_map[?e_render_mode.NORMALS] = shader_normals
render_mode_shader_map[?e_render_mode.CLICK] = shader_shape
render_mode_shader_map[?e_render_mode.SELECT] = shader_shape
render_mode_shader_map[?e_render_mode.ALPHA_FIX] = shader_alpha_fix
render_mode_shader_map[?e_render_mode.ALPHA_TEST] = shader_alpha_test

// Previous uniforms
globalvar texture_prev, color_blend_prev, color_alpha_prev, color_mix_prev, color_mix_percent_prev, color_brightness_prev, highlight_prev;
texture_prev = null
color_blend_prev = null
color_alpha_prev = null
color_mix_prev = null
color_mix_percent_prev = null
color_brightness_prev = null
highlight_prev = null
