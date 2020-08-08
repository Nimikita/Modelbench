/// view_control_pivot(view)
/// @arg view

var view, lenstart, len, mat;
view = argument0

// Arrow length
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio
lenstart = 0

// Create matrix
with (el_edit)
{
	mat = matrix_create(from, vec3(0), vec3(1))
	mat = matrix_multiply(mat, matrix_create(vec3(0), rotation, vec3(1)))
	mat = matrix_multiply(mat, matrix_multiply(matrix, parent.matrix_parent))
	
	matrix_remove_scale(mat)
}

// Draw each axis
view_control_pivot_axis(view, e_control.PIVOT_X, e_value.OFFSET_X, c_axisred, vec3(0), len, mat, X, vec3(0, -90, 0))
view_control_pivot_axis(view, e_control.PIVOT_Y, e_value.OFFSET_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), vec3(0), len, mat, Y, vec3(90, 0, 0))
view_control_pivot_axis(view, e_control.PIVOT_Z, e_value.OFFSET_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), vec3(0), len, mat, Z, vec3(0))

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.PIVOT_X && view_control_edit <= e_control.PIVOT_Z)
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec);
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval;
		move = vec3(0)
		axis_edit = view_control_edit - e_control.PIVOT_X
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		view_control_move_distance += (vec2_length(vecmouse) / veclen) * len * vecdot
		
		snapval = (setting_snap ? setting_snap_size_position : snap_min)
		
		if (!setting_snap_absolute && setting_snap)
			move[axis_edit] = snap(view_control_move_distance, snapval)
		else
			move[axis_edit] = view_control_move_distance
		
		var newval;
		
		for (var i = X; i <= Z; i++)
		{
			move[i] /= el_edit.scale[i]
			
			newval[i] = view_control_value[i] + move[i]
			
			newval[i] = el_value_clamp(e_value.OFFSET_X + i, newval[i])
			
			if ((setting_snap_absolute && move[i] != 0) || !setting_snap)
				newval[i] = snap(newval[i], snapval)
			
			newval[i] -= el_edit.value[e_value.OFFSET_X + i]
		}
		
		// Update
		el_value_set_start(action_el_offset_xyz, true)
		el_value_set(e_value.OFFSET_X, newval[X], true)
		el_value_set(e_value.OFFSET_Y, newval[Y], true)
		el_value_set(e_value.OFFSET_Z, newval[Z], true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
		view_control_move_distance = 0
	}
}

