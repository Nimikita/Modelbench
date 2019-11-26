/// view_control_move(view)
/// @arg view

var view, lenstart, len, mat;
view = argument0

// Arrow length
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size 
lenstart = test(tool_selected = e_tool.TRANSFORM, len - len/8, 0)
len *= test(tool_selected != e_tool.TRANSFORM, 1, 1.25)

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
//var center = point3D_mul_matrix(vec3(0), mat);
view_control_move_axis(view, e_value.POS_X, c_axisred, vec3(lenstart, 0, 0), len, mat, X, vec3(0, -90, 0))
view_control_move_axis(view, e_value.POS_Y, test(setting_z_is_up, c_axisgreen, c_axisblue), vec3(0, lenstart, 0), len, mat, Y, vec3(90, 0, 0))
view_control_move_axis(view, e_value.POS_Z, test(setting_z_is_up, c_axisblue, c_axisgreen), vec3(0, 0, lenstart), len, mat, Z, vec3(0))

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
		view_control_value_add += move
		
		view_control_value = el_value_clamp(view_control_edit, view_control_value)
		view_control_value_add = el_value_clamp(view_control_edit, view_control_value_add)
		snapval = snap_value
		
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

