/// view_control_scale(view)
/// @arg view

function view_control_scale(view)
{
	var len, mat;
	
	// Arrow length
	len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio * (tool_selected != e_tool.TRANSFORM ? .6 : 0.4)
	
	// Create matrix
	with (el_edit)
	{
		if (element_type = TYPE_PART)
			mat = array_copy_1d(matrix_edit)
		else
			mat = array_copy_1d(matrix_parent)
		
		mat = matrix_multiply(matrix_create(vec3(0), rotation, vec3(1)), mat)
		
		matrix_remove_scale(mat)
	}
	
	if (view_control_matrix != null && view_control_edit != null)
		mat = view_control_matrix
	
	// All axes
	if (tool_selected != e_tool.TRANSFORM)
		view_control_scale_all(view, mat, 130)
	
	// Draw each axis
	view_control_scale_axis(view, e_control.SCA_X, e_value.SCA_X, c_axisred, len, mat, X)
	view_control_scale_axis(view, e_control.SCA_Y, e_value.SCA_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), len, mat, Y)
	view_control_scale_axis(view, e_control.SCA_Z, e_value.SCA_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), len, mat, Z)
	
	// Draw each plane
	if (tool_selected != e_tool.TRANSFORM)
	{
		var ps, pe;
		ps = (len / 7)
		pe = ps + (len / 3)
		view_control_scale_plane(view, e_control.SCA_XY, point3D(1, 1, 0), (setting_z_is_up ? c_control_blue : c_control_green), mat, vec3(0, 0, 1), point3D(ps, ps, 0), point3D(pe, ps, 0), point3D(pe, pe, 0), point3D(ps, pe, 0)) // XY
		view_control_scale_plane(view, e_control.SCA_XZ, point3D(1, 0, 1), (setting_z_is_up ? c_control_green : c_control_blue), mat, vec3(0, 1, 0), point3D(ps, 0, ps), point3D(pe, 0, ps), point3D(pe, 0, pe), point3D(ps, 0, pe)) // XZ
		view_control_scale_plane(view, e_control.SCA_YZ, point3D(0, 1, 1), c_control_red, mat, vec3(1, 0, 0), point3D(0, ps, ps), point3D(0, pe, ps), point3D(0, pe, pe), point3D(0, ps, pe)) // YZ
	}
	
	// Dragging plane
	if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.SCA_XY && view_control_edit <= e_control.SCA_YZ)
	{
		mouse_cursor = cr_handpoint
		
		// Move
		if (!mouse_still)
		{
			var move, scale, snapval;
			move = point3D_plane_intersect(view_control_plane_origin, view_control_plane_normal, cam_from, view_control_ray_dir)
			move = point3D_mul(point3D_sub(move, view_control_plane_origin), .125)
			move = vec3_mul_matrix(move, matrix_inverse(mat))
			
			scale = point3D(0, 0, 0)
			snapval = (dragger_snap ? setting_snap_size_scale : snap_min)
			
			for (var i = X; i <= Z; i++)
			{
				if (i = Z && view_control_edit = e_control.SCA_XY)
					continue
				else if (i = Y && view_control_edit = e_control.SCA_XZ)
					continue
				else if (i = X && view_control_edit = e_control.SCA_YZ)
					continue
				
				// Snap distance? (Local snap)
				if (!setting_snap_absolute && dragger_snap)
					move[i] = snap(move[i], snapval)
				
				// Add object value
				scale[i] = view_control_value[i] + move[i]
				
				// Clamp value
				scale[i] = el_value_clamp(e_value.SCA_X + i, scale[i])
				
				// Snap final value? (Absolute snap)
				if (setting_snap_absolute || !dragger_snap)
					scale[i] = snap(scale[i], snapval)
				
				// Get difference
				scale[i] -= el_edit.value[e_value.SCA_X + i]
			}
			
			// Update
			el_value_set_start(action_el_scale_xyz, true)
			el_value_set(e_value.SCA_X, scale[X], true)
			el_value_set(e_value.SCA_Y, scale[Y], true)
			el_value_set(e_value.SCA_Z, scale[Z], true)
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
	else if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.SCA_X && view_control_edit <= e_control.SCA_Z)
	{
		mouse_cursor = cr_handpoint
		
		// Move
		var veclen = vec2_length(view_control_vec)
		if (veclen > 0 && !mouse_still)
		{
			var vecmouse, vecdot, move, snapval, newval;
			axis_edit = view_control_edit - e_control.SCA_X
			
			// Find move factor
			vecmouse = vec2(mouse_dx, mouse_dy)
			vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
			view_control_move_distance += ((vec2_length(vecmouse) / veclen) * len * vecdot) * .125 * dragger_multiplier
			
			snapval = (dragger_snap ? setting_snap_size_scale : snap_min)
			move = view_control_move_distance
			
			if (!setting_snap_absolute && dragger_snap)
				move = snap(move, snapval)
			
			newval = view_control_value + move
			newval = el_value_clamp(e_value.SCA_X + axis_edit, newval)
			
			if (setting_snap_absolute || !dragger_snap)
				newval = snap(newval, snapval)
			
			newval -= el_edit.value[e_value.SCA_X + axis_edit]
			
			// Update
			el_value_set_start(action_el_sca, true)
			el_value_set(e_value.SCA_X + axis_edit, newval, true)
			el_value_set_done()
		}
		
		// Release
		if (!mouse_left)
		{
			window_busy = ""
			view_control_edit = null
			view_control_matrix = null
			view_control_length = null
			view_control_move_distance = 0
		}
	}
	
	// Is dragging(XYZ scale)
	if (view_control_edit_view = view && view_control_edit = e_control.SCA_XYZ)
	{
		mouse_cursor = cr_handpoint
		
		// Move
		if (!mouse_still)
		{
			var snapval, scaleval;
			snapval = (dragger_snap ? setting_snap_size_scale : snap_min)
			scaleval = vec3(view_control_scale_amount)
			
			for (var i = X; i <= Z; i++)
			{
				if (!setting_snap_absolute && dragger_snap)
					scaleval[i] = snap(scaleval[i], snapval)
				
				scaleval[i] = view_control_value_scale[i] * scaleval[i]
				scaleval[i] = el_value_clamp(e_value.SCA_X + i, scaleval[i])
				
				if (setting_snap_absolute || !dragger_snap)
					scaleval[i] = snap(scaleval[i], snapval)
			}
			
			// Update
			axis_edit = X
			el_value_set_start(action_el_sca, true)
			el_value_set(e_value.SCA_X, scaleval[X], false)
			el_value_set(e_value.SCA_Y, scaleval[Y], false)
			el_value_set(e_value.SCA_Z, scaleval[Z], false)
			el_value_set_done()
		}
		
		// Release
		if (!mouse_left)
		{
			window_busy = ""
			view_control_edit = null
			view_control_scale_amount = 1
			view_control_matrix = null
			view_control_length = null
		}
	}
}
