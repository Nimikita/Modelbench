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

render_prev_color = draw_get_color()
render_prev_alpha = draw_get_alpha()
draw_set_color(c_white)
draw_set_alpha(1)

camera_apply(cam_render)