/// view_control_resize_axis(view, control, valueid, color, length, mat, axis)
/// @arg view
/// @arg control
/// @arg valueid
/// @arg color
/// @arg length
/// @arg mat
/// @arg axis

function view_control_resize_axis(view, control, vid, color, length, mat, axis)
{
	var axisvec, start3D, end3D, start2D, end2D, ang;
	axisvec = vec3(axis = X, axis = Y, axis = Z)

	if (view_control_length != null)
	{
		length = view_control_length
		length *= el_edit.value[e_value.WIDTH + axis] / view_control_value
	}

	start3D = point3D_mul_matrix(vec3(0), mat)
	end3D = point3D_mul_matrix(vec3_mul(axisvec, length), mat)

	// Convert to screen
	start2D = view_shape_project(start3D)
	if (point3D_project_error)
		return 0

	end2D = view_shape_project(end3D)
	if (point3D_project_error)
		return 0

	var alpha = percent(abs(vec3_dot(vec3_normalize(vec3_sub(end3D, start3D)), vec3_normalize(vec3_sub(cam_from, start3D)))), .9, .8);

	if ((window_busy = "rendercontrol" && view_control_edit = control) || view.control_mouseon_last = control)
		alpha = 1

	if (alpha = 0)
		return 0

	draw_set_alpha(alpha)

	// Check state
	if (window_busy = "rendercontrol")
	{
		if (view_control_edit != control)
			return 0

		// Update dragging
		//view_control_vec = point2D_sub(end2D, start2D)
		draw_set_color(c_white)
	}
	else if (view.control_mouseon_last = control)
	{
		// Left click
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
			view_control_edit = control
			view_control_edit_view = view
			view_control_value = el_edit.value[vid]
			view_control_vec = point2D_sub(end2D, start2D)
			view_control_matrix = mat
			view_control_length = length
			view_control_move_distance = 0
		}
	
		// Right click
		if (mouse_right_pressed && keyboard_check(vk_shift))
		{
			axis_edit = axis
			action_el_size(element_value_default(vid), false)
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

	draw_image(spr_circle_22, 0, end2D[X] * 2, end2D[Y] * 2, 2, 2, draw_get_color(), draw_get_alpha())

	/*
	var size = (point3D_distance(cam_from, matrix_position(mat)) * view_3d_control_size) * .035 * view_control_ratio;
	view_shape_cube_draw(mat, vec3_mul(axis, length), size)
	*/

	// Check mouse
	if (content_mouseon && point_line_distance(start2D[X], start2D[Y], end2D[X], end2D[Y], mouse_x - content_x, mouse_y - content_y) < view_3d_control_width / 2)
		view.control_mouseon = control
	
	draw_set_color(c_white)
	draw_set_alpha(1)


}
