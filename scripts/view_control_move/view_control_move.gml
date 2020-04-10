/// view_control_move(view)
/// @arg view

var view, lenstart, len, mat;
view = argument0

// Arrow length
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio
lenstart = (tool_selected = e_tool.TRANSFORM ? len - len/8 : 0)
len *= (tool_selected != e_tool.TRANSFORM ? 1 : 1.25)

// Create matrix
with (el_edit)
{
	if (element_type = TYPE_PART)
		mat = array_copy_1d(matrix_edit)
	else
		mat = array_copy_1d(matrix_parent)
	
	matrix_remove_scale(mat)
}

if (setting_orientation = e_orientation.GLOBAL)
	mat = matrix_multiply(matrix_create(el_edit.world_pos, vec3(0), vec3(1)), MAT_IDENTITY)
else if (setting_orientation = e_orientation.LOCAL)
	mat = matrix_multiply(matrix_create(vec3(0), el_edit.rotation, vec3(1)), mat)

// Draw each axis
view_control_move_axis(view, e_value.POS_X, c_axisred, vec3(lenstart, 0, 0), len, mat, X, vec3(0, -90, 0))
view_control_move_axis(view, e_value.POS_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), vec3(0, lenstart, 0), len, mat, Y, vec3(90, 0, 0))
view_control_move_axis(view, e_value.POS_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), vec3(0, 0, lenstart), len, mat, Z, vec3(0))

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit < e_value.ROT_X)
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec)
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval;
		move = vec3(0)
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		view_control_move_distance += (vec2_length(vecmouse) / veclen) * len * vecdot
		
		snapval = (setting_snap ? setting_snap_size_position : snap_min)
		move[view_control_edit] = snap(view_control_move_distance, snapval)
		
		if (setting_orientation = e_orientation.GLOBAL)
		{
			mat = (el_edit.element_type = TYPE_PART ? el_edit.matrix_edit : el_edit.matrix_parent)
			move = vec3_mul_matrix(move, matrix_inverse(mat))
		}
		else if (setting_orientation = e_orientation.LOCAL)
			move = vec3_mul_matrix(move, matrix_create(vec3(0), el_edit.rotation, vec3(1)))
		
		var newval;
		
		for (var i = X; i <= Z; i++)
		{
			move[i] /= el_edit.value_inherit[e_value.SCA_X + i]
			
			newval[i] = view_control_value[i] + move[i]
			
			newval[i] = el_value_clamp(e_value.POS_X + i, newval[i])
			newval[i] -= el_edit.value[e_value.POS_X + i]
		}
		
		// Update
		axis_edit = view_control_edit
		el_value_set_start(action_el_pos_xyz, true)
		el_value_set(e_value.POS_X, newval[X], true)
		el_value_set(e_value.POS_Y, newval[Y], true)
		el_value_set(e_value.POS_Z, newval[Z], true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
		view_control_value = 0
	}
}

