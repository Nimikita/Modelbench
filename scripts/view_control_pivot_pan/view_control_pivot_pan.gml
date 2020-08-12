/// view_control_pivot_pan(view, radius, pos)
/// @arg view
/// @arg radius
/// @arg pos

var view, radius, pos, pos2D, normal;
view = argument0
radius = argument1
pos = argument2
pos2D = view_shape_project(pos)

if (point3D_project_error)
	return 0

normal = vec3_normalize(point3D_sub(cam_from, pos))

// Check state
if (window_busy = "rendercontrol")
{
	if (view_control_edit != e_control.PIVOT_PAN)
		return 0
	
	// Update view ray
	var px, py, rayclip, rayeye, raywor;
	
	// Get -1 -> 1 XY mouse coordinates in viewport
	px = -(((((mouse_wrap_x * content_width) + mouse_x) - content_x + view_control_plane_offset[X]) / content_width) * 2 - 1)
	py = ((((mouse_wrap_y * content_height) + mouse_y) - content_y + view_control_plane_offset[Y]) / content_height) * 2 - 1
	
	rayclip = vec4(px, py, -1, 1);
	rayeye = point4D_mul_matrix(rayclip, matrix_inverse(proj_matrix));
	rayeye = vec4(rayeye[X], rayeye[Y], -1, 0)
	
	raywor = point4D_mul_matrix(rayeye, matrix_inverse(view_matrix));
	view_control_ray_dir = vec3_normalize(vec3(raywor[X], raywor[Y], raywor[Z]))
	
	if (mouse_left_released)
	{
		window_busy = ""
		view_control_edit = null
	}
}
else if (view.control_mouseon_last = e_control.PIVOT_PAN)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = e_control.PIVOT_PAN
		view_control_edit_view = view
		
		view_control_plane_normal = vec3_normalize(normal)
		view_control_plane_origin = pos
		
		view_control_plane_offset = point2D_sub(view_shape_project(pos), point2D(mouse_x - content_x, mouse_y - content_y))
		
		// Update view ray
		var px, py, rayclip, rayeye, raywor;
		
		// Get -1 -> 1 XY mouse coordinates in viewport
		px = -(((((mouse_wrap_x * content_width) + mouse_x) - content_x + view_control_plane_offset[X]) / content_width) * 2 - 1)
		py = ((((mouse_wrap_y * content_height) + mouse_y) - content_y + view_control_plane_offset[Y]) / content_height) * 2 - 1
		
		rayclip = vec4(px, py, -1, 1);
		rayeye = point4D_mul_matrix(rayclip, matrix_inverse(proj_matrix));
		rayeye = vec4(rayeye[X], rayeye[Y], -1, 0)
		
		raywor = point4D_mul_matrix(rayeye, matrix_inverse(view_matrix));
		view_control_ray_dir = vec3_normalize(vec3(raywor[X], raywor[Y], raywor[Z]))
		view_control_value = point3D(el_edit.value[e_value.OFFSET_X], el_edit.value[e_value.OFFSET_Y], el_edit.value[e_value.OFFSET_Z])
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		el_value_set_start(action_el_offset_xyz, true)
		
		for (var i = X; i <= Z; i++)
			el_value_set(e_value.OFFSET_X + i, element_value_default(e_value.OFFSET_X + i), false)
		
		el_value_set_done()
		
		app_mouse_clear()
	}
}

if (point_distance(pos2D[X], pos2D[Y], mouse_x - content_x, mouse_y - content_y) < radius)
{
	if (content_mouseon)
		view.control_mouseon = e_control.PIVOT_PAN
}
