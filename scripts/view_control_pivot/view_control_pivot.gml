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
view_control_pivot_axis(view, e_value.OFFSET_X, c_axisred, vec3(0), len, mat, X, vec3(0, -90, 0))
view_control_pivot_axis(view, e_value.OFFSET_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), vec3(0), len, mat, Y, vec3(90, 0, 0))
view_control_pivot_axis(view, e_value.OFFSET_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), vec3(0), len, mat, Z, vec3(0))

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit > e_value.TO_Z && view_control_edit < e_value.WIDTH)
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec);
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval;
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		move = (vec2_length(vecmouse) / veclen) * len * vecdot
		move /= el_edit.scale[view_control_edit - e_value.OFFSET_X]
		view_control_value += move
		
		view_control_value = el_value_clamp(view_control_edit, view_control_value)
		snapval = snap_value
		
		// Update
		axis_edit = e_value.OFFSET_X - view_control_edit
		el_value_set_start(action_el_offset_xyz, true)
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

