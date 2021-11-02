/// render_start(target, camera, [width, height])
/// @arg target
/// @arg camera
/// @arg [width
/// @arg height]

render_target = argument[0]
render_camera = argument[1]
render_width = content_width
render_height = content_height

// Argument overwrites size
if (argument_count > 2)
{
	render_width = argument[2]
	render_height = argument[3]
}

render_ratio = render_width / render_height
render_background = (program_mode = e_mode.MODELING || (program_mode = e_mode.PREVIEW && setting_preview_background))
render_ssao = ((program_mode = e_mode.MODELING && setting_shading_ao && setting_shading) || (program_mode = e_mode.PREVIEW && setting_render_ao))
render_shadows = (program_mode = e_mode.PREVIEW && setting_render_shadows)
render_aa = (program_mode = e_mode.MODELING || (program_mode = e_mode.PREVIEW && setting_render_aa))

render_prev_color = draw_get_color()
render_prev_alpha = draw_get_alpha()
draw_set_color(c_white)
draw_set_alpha(1)

camera_apply(cam_render)