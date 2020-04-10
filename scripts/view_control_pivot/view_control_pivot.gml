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

var controlmat = mat;

if (setting_orientation = e_orientation.GLOBAL)
	controlmat = matrix_multiply(matrix_create(matrix_position(mat), vec3(0), vec3(1)), MAT_IDENTITY)

// Draw each axis
view_control_pivot_axis(view, e_value.OFFSET_X, c_axisred, vec3(0), len, controlmat, X, vec3(0, -90, 0))
view_control_pivot_axis(view, e_value.OFFSET_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), vec3(0), len, controlmat, Y, vec3(90, 0, 0))
view_control_pivot_axis(view, e_value.OFFSET_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), vec3(0), len, controlmat, Z, vec3(0))

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit > e_value.TO_Z && view_control_edit < e_value.WIDTH)
{
	mouse_cursor = cr_handpoint
	
	// Move
	var veclen = vec2_length(view_control_vec);
	if (veclen > 0 && !mouse_still)
	{
		var vecmouse, vecdot, move, snapval;
		move = vec3(0)
		
		// Find move factor
		vecmouse = vec2(mouse_dx, mouse_dy)
		vecdot = vec2_dot(vec2_normalize(view_control_vec), vec2_normalize(vecmouse))
		view_control_move_distance += (vec2_length(vecmouse) / veclen) * len * vecdot
		
		snapval = (setting_snap ? setting_snap_size_position : snap_min)
		move[view_control_edit - e_value.OFFSET_X] = snap(view_control_move_distance, snapval)
		
		if (setting_orientation = e_orientation.GLOBAL)
			move = vec3_mul_matrix(move, matrix_inverse(mat))
		
		var newval;
		
		for (var i = X; i <= Z; i++)
		{
			move[i] /= el_edit.scale[i]
			
			newval[i] = view_control_value[i] + move[i]
			
			newval[i] = el_value_clamp(e_value.OFFSET_X + i, newval[i])
			newval[i] -= el_edit.value[e_value.OFFSET_X + i]
		}
		
		// Update
		axis_edit = view_control_edit - e_value.OFFSET_X
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

