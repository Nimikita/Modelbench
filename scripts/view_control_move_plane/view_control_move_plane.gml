/// view_control_move_plane(view, control, axes, color, mat, normal, corner1, corner2, corner3, corner4)
/// @arg view
/// @arg control
/// @arg axes
/// @arg color
/// @arg mat
/// @arg normal
/// @arg corner1
/// @arg corner2
/// @arg corner3
/// @arg corner4

var view, control, axes, color, mat, normal, corner1, corner2, corner3, corner4;
view = argument0
control = argument1
axes = argument2
color = argument3
mat = argument4
normal = vec3_mul_matrix(argument5, mat)
corner1 = argument6
corner2 = argument7
corner3 = argument8
corner4 = argument9

// Corner 1
var corner13D, corner12D;
corner13D = point3D_mul_matrix(corner1, mat)
corner12D = view_shape_project(corner13D)
if (point3D_project_error)
	return 0

// Corner 2
var corner23D, corner22D;
corner23D = point3D_mul_matrix(corner2, mat)
corner22D = view_shape_project(corner23D)
if (point3D_project_error)
	return 0

// Corner 3
var corner33D, corner32D;
corner33D = point3D_mul_matrix(corner3, mat)
corner32D = view_shape_project(corner33D)
if (point3D_project_error)
	return 0

// Corner 4
var corner43D, corner42D;
corner43D = point3D_mul_matrix(corner4, mat)
corner42D = view_shape_project(corner43D)
if (point3D_project_error)
	return 0

// Flip normal
if (vec3_dot(normal, vec3_normalize(point3D_sub(cam_from, matrix_position(mat)))) < 0)
	normal = vec3_mul(normal, -1)

var alpha = percent(abs(vec3_dot(normal, vec3_normalize(point3D_sub(cam_from, matrix_position(mat))))), .1, .2);

if (window_busy = "rendercontrol" && view_control_edit = control)
	alpha = 1

if (alpha = 0 || (window_busy = "rendercontrol" && view_control_edit != control))
	return 0

draw_set_alpha(alpha)

// Check state
if (window_busy = "rendercontrol")
{
	if (view_control_edit != control)
		return 0
	
	// Update view ray
	var px, py, rayclip, rayeye, raywor;
	
	// Get -1 -> 1 XY mouse coordinates in viewport
	px = -(((view_control_plane_mouse[X] - content_x + view_control_plane_offset[X]) / content_width) * 2 - 1)
	py = ((view_control_plane_mouse[Y] - content_y + view_control_plane_offset[Y]) / content_height) * 2 - 1
	
	rayclip = vec4(px, py, -1, 1);
	rayeye = point4D_mul_matrix(rayclip, matrix_inverse(proj_matrix));
	rayeye = vec4(rayeye[X], rayeye[Y], -1, 0)
	
	raywor = point4D_mul_matrix(rayeye, matrix_inverse(view_matrix));
	view_control_ray_dir = vec3_normalize(vec3(raywor[X], raywor[Y], raywor[Z]))
	
	// Update mouse
	view_control_plane_mouse[X] += mouse_dx * dragger_multiplier
	view_control_plane_mouse[Y] += mouse_dy * dragger_multiplier
	
	draw_set_color(c_white)
	
	if (mouse_left_released)
	{
		window_busy = ""
		view_control_edit = null
	}
}
else if (view.control_mouseon_last = control)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = control
		view_control_edit_view = view
		
		view_control_plane_normal = vec3_normalize(normal)
		view_control_plane_origin = el_edit.world_pos
		
		view_control_plane_offset = point2D_sub(view_shape_project(el_edit.world_pos), point2D(mouse_x - content_x, mouse_y - content_y))
		view_control_plane_mouse = point2D(mouse_x, mouse_y)
		
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
		view_control_value = point3D(el_edit.value[e_value.POS_X], el_edit.value[e_value.POS_Y], el_edit.value[e_value.POS_Z])
		view_control_plane = true
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		el_value_set_start(action_el_pos_xyz, true)
		
		for (var i = X; i <= Z; i++)
		{
			if (axes[i])
				el_value_set(e_value.POS_X + i, element_value_default(e_value.POS_X + i), false)
		}
		
		el_value_set_done()
		
		app_mouse_clear()
	}
	
	draw_set_color(c_white)
}
else
	draw_set_color(color)

// Draw outline
view_shape_line_draw(corner12D, corner22D)
view_shape_line_draw(corner22D, corner32D)
view_shape_line_draw(corner32D, corner42D)
view_shape_line_draw(corner42D, corner12D)

// Draw square
draw_set_alpha(.35)

render_set_culling(false)
draw_primitive_begin(pr_trianglelist)
view_shape_triangle_draw(corner12D, corner22D, corner32D)
view_shape_triangle_draw(corner32D, corner42D, corner12D)
draw_primitive_end()
render_set_culling(true)

draw_set_color(c_white)
draw_set_alpha(1)

if (point_in_triangle(mouse_x - content_x, mouse_y - content_y, corner12D[X], corner12D[Y], corner22D[X], corner22D[Y], corner32D[X], corner32D[Y]) || 
	point_in_triangle(mouse_x - content_x, mouse_y - content_y, corner12D[X], corner12D[Y], corner42D[X], corner42D[Y], corner32D[X], corner32D[Y]) && content_mouseon)
	view.control_mouseon = control
