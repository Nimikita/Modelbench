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
view_control_rotate_axis(view, e_value.ROT_X, c_axisred, xrot, len)
view_control_rotate_axis(view, e_value.ROT_Y, (setting_z_is_up ? c_axisgreen : c_axisblue), yrot, len)
view_control_rotate_axis(view, e_value.ROT_Z, (setting_z_is_up ? c_axisblue : c_axisgreen), zrot, len)

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_value.ROT_X && view_control_edit <= e_value.ROT_Z)
{
	mouse_cursor = cr_handpoint
	
	if (!mouse_still)
	{
		var ang, prevang, rot, snapval;
		
		// Find rotate amount
		ang = point_direction(mouse_x - content_x, mouse_y - content_y, view_control_pos[X], view_control_pos[Y])
		prevang = point_direction(mouse_previous_x - content_x, mouse_previous_y - content_y, view_control_pos[X], view_control_pos[Y])
		rot = angle_difference_fix(ang, prevang) * negate(view_control_flip)
		view_control_value += rot
		
		view_control_value = el_value_clamp(view_control_edit, view_control_value)
		snapval = snap_value
		
		// Update
		axis_edit = e_value.ROT_X - view_control_edit
		el_value_set_start(action_el_rot, true)
		el_value_set(view_control_edit, snap(view_control_value, snapval) - el_edit.value[view_control_edit], true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
		view_control_matrix = null
		view_control_length = null
	}
}
