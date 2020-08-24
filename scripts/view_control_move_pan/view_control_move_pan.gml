/// view_control_move_pan(view, radius)
/// @arg view
/// @arg radius

var view, radius, pos2D, normal;
view = argument0
radius = argument1
pos2D = view_shape_project(el_edit.world_pos)

if (point3D_project_error)
	return 0

normal = vec3_normalize(point3D_sub(cam_from, el_edit.world_pos))

// Check state
if (window_busy = "rendercontrol")
{
	if (view_control_edit != e_control.POS_PAN)
		return 0
	
	view_control_plane_update()
	
	if (mouse_left_released)
	{
		window_busy = ""
		view_control_edit = null
	}
}
else if (view.control_mouseon_last = e_control.POS_PAN)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = e_control.POS_PAN
		view_control_edit_view = view
		
		view_control_plane_start(el_edit.world_pos, normal)
		view_control_value = point3D(el_edit.value[e_value.POS_X], el_edit.value[e_value.POS_Y], el_edit.value[e_value.POS_Z])
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		el_value_set_start(action_el_pos_xyz, true)
		
		for (var i = X; i <= Z; i++)
			el_value_set(e_value.POS_X + i, element_value_default(e_value.POS_X + i), false)
		
		el_value_set_done()
		
		app_mouse_clear()
	}
}

if (point_distance(pos2D[X], pos2D[Y], mouse_x - content_x, mouse_y - content_y) < radius)
{
	if (content_mouseon)
		view.control_mouseon = e_control.POS_PAN
}
