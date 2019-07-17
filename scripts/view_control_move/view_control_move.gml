/// view_control_move(view)
/// @arg view

var view, len, mat;
view = argument0

// Arrow length
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size

// Create matrix
with (el_edit)
{
	if (element_type = TYPE_PART)
		mat = array_copy_1d(matrix_edit)
	else
		mat = array_copy_1d(matrix_parent)
	
	matrix_remove_scale(mat)
}

// Draw each axis
view_control_move_axis(view, e_value.POS_X, c_axisred, point3D_mul_matrix(vec3(0, 0, 0), mat), point3D_mul_matrix(vec3(len, 0, 0), mat))
view_control_move_axis(view, e_value.POS_Y, test(setting_z_is_up, c_axisblue, c_axisgreen), point3D_mul_matrix(vec3(0, 0, 0), mat), point3D_mul_matrix(vec3(0, len, 0), mat))
view_control_move_axis(view, e_value.POS_Z, test(setting_z_is_up, c_axisgreen, c_axisblue), point3D_mul_matrix(vec3(0, 0, 0), mat), point3D_mul_matrix(vec3(0, 0, len), mat))

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit < e_value.ROT_X)
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec)
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval;
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		move = (vec2_length(vecmouse) / veclen) * len * vecdot
		move /= el_edit.value_inherit[e_value.SCA_X + view_control_edit]
		view_control_value += move
		
		// TODO: Snap
		snapval = 0
		
		// Update
		axis_edit = view_control_edit
		el_value_set_start(action_el_pos, true)
		el_value_set(view_control_edit, snap(view_control_value, snapval) - el_edit.value[view_control_edit], true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
	}
}
