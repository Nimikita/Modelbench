/// view_control_scale_axis(view, valueid, color, length, mat, axis)
/// @arg view
/// @arg valueid
/// @arg color
/// @arg length
/// @arg mat
/// @arg axis

var view, vid, color, length, mat, axis;
var start3D, end3D, start2D, end2D, ang;
view = argument0
vid = argument1
color = argument2
length = argument3
mat = argument4
axis = vec3(argument5 = X, argument5 = Y, argument5 = Z)

start3D = point3D_mul_matrix(vec3(0), mat)
end3D = point3D_mul_matrix(vec3_mul(axis, length), mat)

// Convert to screen
start2D = view_shape_project(start3D)
if (point3D_project_error)
	return 0

end2D = view_shape_project(end3D)
if (point3D_project_error)
	return 0

var alpha = percent(abs(vec3_dot(vec3_normalize(vec3_sub(cam_from, start3D)), vec3_normalize(vec3_sub(end3D, start3D)))), .975, .95);

if ((window_busy = "rendercontrol" && view_control_edit = vid) || view.control_mouseon_last = vid)
	alpha = 1

if (alpha = 0)
	return 0

draw_set_alpha(alpha)

// Check state
if (window_busy = "rendercontrol" || window_busy = "rendercontrolscalexyz")
{
	if (view_control_edit != vid)
		return 0

	// Update dragging
	view_control_vec = point2D_sub(end2D, start2D)
	draw_set_color(c_white)
}
else if (view.control_mouseon_last = vid)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = vid
		view_control_edit_view = view
		view_control_value = el_edit.value[vid]
		view_control_vec = point2D_sub(end2D, start2D)
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		axis_edit = vid -e_value.SCA_X
		action_el_sca(el_edit.value_default[vid], false)
		app_mouse_clear()
	}
	
	draw_set_color(c_white)
}
else
	draw_set_color(color)
	
// Line
view_shape_line_draw(start2D, end2D)

// Arrow
ang = point_direction(start2D[X], start2D[Y], end2D[X], end2D[Y])

var size = (point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size) * .035;
view_shape_cube_draw(mat, vec3_mul(axis, length), size)

//draw_box((end2D[X] * 2) - 16, (end2D[Y] * 2) - 16, 32, 32, false)

// Check mouse
if (content_mouseon && point_line_distance(start2D[X], start2D[Y], end2D[X], end2D[Y], mouse_x - content_x, mouse_y - content_y) < view_3d_control_width / 2)
	view.control_mouseon = vid
	
draw_set_color(c_white)
draw_set_alpha(1)