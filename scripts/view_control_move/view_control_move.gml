/// view_control_move(view)
/// @arg view

var view, lenstart, len, arrowlen, mat;
view = argument0

// Arrow length
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio
lenstart = (tool_selected = e_tool.TRANSFORM ? len - len/8 : 0)
arrowlen = len * (tool_selected != e_tool.TRANSFORM ? 1 : 1.25)

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
view_control_move_axis(view, e_control.POS_X, e_value.POS_X, c_axisred, vec3(lenstart, 0, 0), arrowlen, mat, X, vec3(0, -90, 0))
view_control_move_axis(view, e_control.POS_Y, e_value.POS_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), vec3(0, lenstart, 0), arrowlen, mat, Y, vec3(90, 0, 0))
view_control_move_axis(view, e_control.POS_Z, e_value.POS_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), vec3(0, 0, lenstart), arrowlen, mat, Z, vec3(0))

// Draw each plane
var ps, pe;
ps = (len / 9)
pe = ps + (len / 5)

view_control_move_plane(view, e_control.POS_XY, point3D(1, 1, 0), (setting_z_is_up ? c_axisblue : c_axisgreen), mat, vec3(0, 0, 1), point3D(ps, ps, 0), point3D(pe, ps, 0), point3D(pe, pe, 0), point3D(ps, pe, 0)) // XY
view_control_move_plane(view, e_control.POS_XZ, point3D(1, 0, 1), (setting_z_is_up ? c_axisgreen : c_axisblue), mat, vec3(0, 1, 0), point3D(ps, 0, ps), point3D(pe, 0, ps), point3D(pe, 0, pe), point3D(ps, 0, pe)) // XZ
view_control_move_plane(view, e_control.POS_YZ, point3D(0, 1, 1), c_axisred, mat, vec3(1, 0, 0), point3D(0, ps, ps), point3D(0, pe, ps), point3D(0, pe, pe), point3D(0, ps, pe)) // YZ
view_control_move_pan(view, 14)

if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.POS_XY && view_control_edit <= e_control.POS_PAN) // Dragging plane
{
	mouse_cursor = cr_handpoint
	
	// Move
	if (!mouse_still)
	{
		var move, pos, snapval;
		move = point3D_plane_intersect(view_control_plane_origin, view_control_plane_normal, cam_from, view_control_ray_dir)
		move = point3D_sub(move, view_control_plane_origin)
		move = vec3_mul_matrix(move, matrix_inverse(mat))
		
		snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		for (var i = X; i <= Z; i++)
		{
			// Snap distance? (Local snap)
			if (!setting_snap_absolute && dragger_snap)
				move[i] = snap(move[i], snapval)
			
			move[i] /= app.root_scale
			
			// Add object value
			pos[i] = view_control_value[i] + move[i]
			
			// Clamp value
			pos[i] = el_value_clamp(e_value.POS_X + i, pos[i])
			
			// Snap final value? (Absolute snap)
			if (setting_snap_absolute || !dragger_snap)
				pos[i] = snap(pos[i], snapval)
			
			// Get difference
			pos[i] -= el_edit.value[e_value.POS_X + i]
		}
		
		// Update
		el_value_set_start(action_el_pos_xyz, true)
		el_value_set(e_value.POS_X, pos[X], true)
		el_value_set(e_value.POS_Y, pos[Y], true)
		el_value_set(e_value.POS_Z, pos[Z], true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
		view_control_plane = false
	}
}
else if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.POS_X && view_control_edit <= e_control.POS_Z) // Dragging arrow
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec);
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval, newval;
		move = vec3(0)
		axis_edit = view_control_edit - e_control.POS_X
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		view_control_move_distance += (vec2_length(vecmouse) / veclen) * len * vecdot * dragger_multiplier
		
		snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		if (!setting_snap_absolute && dragger_snap)
			move[axis_edit] = snap(view_control_move_distance, snapval)
		else
			move[axis_edit] = view_control_move_distance
		
		for (var i = X; i <= Z; i++)
		{
			move[i] /= app.root_scale
			
			newval[i] = view_control_value[i] + move[i]
			
			newval[i] = el_value_clamp(e_value.POS_X + i, newval[i])
			
			if ((setting_snap_absolute && move[i] != 0) || !dragger_snap)
				newval[i] = snap(newval[i], snapval)
			
			newval[i] -= el_edit.value[e_value.POS_X + i]
		}
		
		// Update
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
