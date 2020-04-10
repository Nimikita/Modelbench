/// view_control_scale(view)
/// @arg view

var view, len, mat;
view = argument0

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
view_control_scale_axis(view, e_value.SCA_X, c_axisred, len, mat, X)
view_control_scale_axis(view, e_value.SCA_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), len, mat, Y)
view_control_scale_axis(view, e_value.SCA_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), len, mat, Z)

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit > e_value.ROT_Z)
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
		view_control_move_distance += ((vec2_length(vecmouse) / veclen) * len * vecdot) * .125
		
		snapval = (setting_snap ? setting_snap_size_scale : snap_min)
		move[view_control_edit - e_value.SCA_X] = snap(view_control_move_distance, snapval)
		
		var newval;
		
		for (var i = X; i <= Z; i++)
		{
			newval[i] = view_control_value[i] + move[i]
			
			newval[i] = el_value_clamp(e_value.SCA_X + i, newval[i])
			newval[i] -= el_edit.value[e_value.SCA_X + i]
		}
		
		// Update
		axis_edit = view_control_edit - e_value.SCA_X
		el_value_set_start(action_el_pos_xyz, true)
		el_value_set(e_value.SCA_X, newval[X], true)
		el_value_set(e_value.SCA_Y, newval[Y], true)
		el_value_set(e_value.SCA_Z, newval[Z], true)
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
if (window_busy = "rendercontrolscalexyz" && view_control_edit_view = view && view_control_edit = -1)
{
	mouse_cursor = cr_handpoint
	
	// Move
	if (!mouse_still)
	{
		var snapval;
		snapval = (setting_snap ? setting_snap_size_scale : snap_min)
		
		// Update
		axis_edit = X
		el_value_set_start(action_el_sca, true)
		el_value_set(e_value.SCA_X, view_control_value_scale[X] * view_control_scale_amount, false)
		el_value_set(e_value.SCA_Y, view_control_value_scale[Y] * view_control_scale_amount, false)
		el_value_set(e_value.SCA_Z, view_control_value_scale[Z] * view_control_scale_amount, false)
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
