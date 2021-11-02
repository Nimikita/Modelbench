/// view_control_rotate(view)
/// @arg view

var view, len, xrot, yrot, zrot;
view = argument0
len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio * (tool_selected != e_tool.TRANSFORM ? 0.8 : 0.7)

// Create matrix
with (el_edit)
{
	if (element_type = TYPE_PART)
		zrot = array_copy_1d(matrix_edit)
	else
		zrot = array_copy_1d(matrix_parent)
	
	matrix_remove_scale(zrot)
}

xrot = matrix_multiply(matrix_build(0, 0, 0, 0, -90, el_edit.value[e_value.ROT_Z], 1, 1, 1), zrot)
yrot = matrix_multiply(matrix_build(0, 0, 0, el_edit.value[e_value.ROT_X] + 90, 0, el_edit.value[e_value.ROT_Z], 1, 1, 1), zrot)

if (view_control_matrix != null && view_control_edit != null)
{
	xrot = view_control_matrix
	yrot = view_control_matrix
	zrot = view_control_matrix
}

// Draw each axis
view_control_rotate_axis(view, e_control.ROT_X, e_value.ROT_X, c_axisred, xrot, len)
view_control_rotate_axis(view, e_control.ROT_Y, e_value.ROT_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), yrot, len)
view_control_rotate_axis(view, e_control.ROT_Z, e_value.ROT_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), zrot, len)

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.ROT_X && view_control_edit <= e_control.ROT_Z)
{
	mouse_cursor = cr_handpoint
	
	if (!mouse_still)
	{
		var ang, prevang, rot, snapval, axesang, newval;
		axis_edit = view_control_edit - e_control.ROT_X
		
		// Find rotate amount
		ang = point_direction(mouse_x - content_x, mouse_y - content_y, view_control_pos[X], view_control_pos[Y])
		prevang = point_direction(mouse_previous_x - content_x, mouse_previous_y - content_y, view_control_pos[X], view_control_pos[Y])
		rot = angle_difference_fix(ang, prevang) * negate(view_control_flip)
		view_control_move_distance += rot * dragger_multiplier
		
		snapval = (dragger_snap ? setting_snap_size_rotation : snap_min)
		axesang = view_control_move_distance
		
		if (!setting_snap_absolute && dragger_snap)
			axesang = snap(axesang, snapval)
		
		newval = view_control_value + axesang
		newval = el_value_clamp(e_value.ROT_X + axis_edit, newval)
		
		if (setting_snap_absolute || !dragger_snap)
			newval = snap(newval, snapval)
			
		newval -= el_edit.value[e_value.ROT_X + axis_edit]
		
		// Update
		el_value_set_start(action_el_rot, true)
		el_value_set(e_value.ROT_X + axis_edit, newval, true)
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
