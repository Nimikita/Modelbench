/// view_control_resize(view)
/// @arg view

function view_control_resize(view)
{
	var len, mat;
	
	// Create matrix
	with (el_edit)
	{
		mat = matrix_create(vec3_add(from, vec3_mul(point3D_sub(to, from), .5)), vec3(0), vec3(1))
		mat = matrix_multiply(mat, matrix_create(vec3(0), rotation, vec3(1)))
		mat = matrix_multiply(mat, matrix_multiply(matrix, parent.matrix_parent))
		
		matrix_remove_scale(mat)
	}
	
	// Arrow length
	len = point3D_distance(cam_from, matrix_position(mat)) * view_3d_control_size * view_control_ratio * .6
	
	if (view_control_matrix != null && view_control_edit != null)
		mat = view_control_matrix
	
	// Draw each axis
	view_control_resize_axis(view, e_control.RESIZE_XP, e_value.WIDTH, c_axisred, len, mat, X)
	view_control_resize_axis(view, e_control.RESIZE_XN, e_value.WIDTH, c_axisred, -len, mat, X)
	
	if (el_edit.type != "plane")
	{
		view_control_resize_axis(view, e_control.RESIZE_YP, e_value.LENGTH, (setting_z_is_up ? c_axisgreen : c_axisblue), len, mat, Y)
		view_control_resize_axis(view, e_control.RESIZE_YN, e_value.LENGTH, (setting_z_is_up ? c_axisgreen : c_axisblue), -len, mat, Y)
	}
	
	view_control_resize_axis(view, e_control.RESIZE_ZP, e_value.HEIGHT, (setting_z_is_up ? c_axisblue : c_axisgreen), len, mat, Z)
	view_control_resize_axis(view, e_control.RESIZE_ZN, e_value.HEIGHT, (setting_z_is_up ? c_axisblue : c_axisgreen), -len, mat, Z)
	
	// Is dragging
	if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.RESIZE_XP && view_control_edit <= e_control.RESIZE_ZN)
	{
		mouse_cursor = cr_handpoint
		
		// Move
		var veclen = vec2_length(view_control_vec)
		if (veclen > 0 && !mouse_still)
		{
			var wholeaxis, vecmouse, vecdot, move, snapval, newval;
			axis_edit = (view_control_edit - e_control.RESIZE_XP) mod 3
			
			wholeaxis = keyboard_check(vk_alt)
			
			// Find move factor
			vecmouse = vec2(mouse_dx, mouse_dy)
			vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
			view_control_move_distance += ((vec2_length(vecmouse) / veclen) * len * vecdot) * (wholeaxis ? 2 : 1) * dragger_multiplier
			
			snapval = (dragger_snap ? setting_snap_size_uv : snap_min)
			move = view_control_move_distance
			
			if (!setting_snap_absolute && dragger_snap)
				move = snap(move, snapval)
			
			move /= el_edit.scale[axis_edit]
			
			newval = view_control_value + move
			newval = el_value_clamp(e_value.WIDTH + axis_edit, newval)
			
			if (setting_snap_absolute || !dragger_snap)
				newval = snap(newval, snapval)
			
			newval -= el_edit.value[e_value.WIDTH + axis_edit]
			
			var offsetval;
			
			if (wholeaxis)
				offsetval = newval / 2
			else
				offsetval = newval
			
			// Update
			el_value_set_start(action_el_size, true)
			el_value_set(e_value.WIDTH + axis_edit, newval, true)
			
			// Negative handle, change shape offset
			if (view_control_edit >= e_control.RESIZE_XN || wholeaxis)
				el_value_set(e_value.OFFSET_X + axis_edit, -offsetval, true)
			
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
}
