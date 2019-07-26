/// view_control_scale_all(view, mat, radius)
/// @arg view
/// @arg mat
/// @arg radius

var view, mat, coord, radius, alpha;
view = argument0
mat = argument1
radius = argument2

coord = point3D_project(matrix_position(mat), view_proj_matrix, render_width, render_height)

if (point3D_project_error)
	return 0

coord[X] = round(coord[X])
coord[Y] = round(coord[Y])

// Check state
if (window_busy = "rendercontrolscalexyz")
{
	if (view_control_edit != -1)
		return 0
	
	coord = view_control_scale_coords
	view_control_scale_amount = point_distance(mouse_x - content_x, mouse_y - content_y, view_control_scale_coords[X], view_control_scale_coords[Y]) / radius
}
else if (view.control_mouseon_last = -1)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrolscalexyz"
		view_control_value_scale[X] = el_edit.value[e_value.SCA_X]
		view_control_value_scale[Y] = el_edit.value[e_value.SCA_Y]
		view_control_value_scale[Z] = el_edit.value[e_value.SCA_Z]
		view_control_edit = -1
		view_control_edit_view = view
		view_control_scale_amount = point_distance(mouse_x - content_x, mouse_y - content_y, coord[X], coord[Y]) / radius
		view_control_scale_coords[X] = coord[X]
		view_control_scale_coords[Y] = coord[Y]
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		axis_edit = X
		el_value_set_start(action_el_sca, true)
		el_value_set(e_value.SCA_X, el_edit.value_default[e_value.SCA_X], false)
		el_value_set(e_value.SCA_Y, el_edit.value_default[e_value.SCA_Y], false)
		el_value_set(e_value.SCA_Z, el_edit.value_default[e_value.SCA_Z], false)
		el_value_set_done()
		app_mouse_clear()
	}
	
}

draw_set_color(c_background)

// Draw circle
if (view.control_mouseon_last = -1)
	alpha = 1
else
	alpha = 0.35

if (window_busy != "rendercontrolscalexyz")
{
	draw_circle_ext(coord[X], coord[Y], radius, true, c_background, alpha)
	draw_circle_ext(coord[X], coord[Y], radius + .5, true, c_background, alpha)
	draw_circle_ext(coord[X], coord[Y], radius + 1, true, c_background, alpha)
	draw_circle_ext(coord[X], coord[Y], radius + 1.5, true, c_background, alpha)
	draw_circle_ext(coord[X], coord[Y], radius + 2, true, c_background, alpha)
}
else
{
	draw_circle_ext(mouse_x - content_x, mouse_y - content_y, 10, false, c_background, .5)
	draw_circle_ext(mouse_x - content_x, mouse_y - content_y, 6, false, c_background, 1)
	
	render_set_culling(false)
	draw_line_width(coord[X], coord[Y], mouse_x - content_x, mouse_y - content_y, 2)
	
	// Draw notches
	for (var i = 0; i < ceil(view_control_scale_amount * 5); i++)
	{
		var nx, ny, angle;
		nx = lerp(mouse_x - content_x, coord[X], i/(view_control_scale_amount * 5))
		ny = lerp(mouse_y - content_y, coord[Y], i/(view_control_scale_amount * 5))
		angle = radtodeg(arctan2(mouse_y - content_y - coord[Y], mouse_x - content_x - coord[X]))
		draw_image(spr_view_line, 0, nx, ny, 1, 1, test((i mod 5) = 0, c_accent, c_background), 1, -angle)
	}
	
	render_set_culling(true)
}

// Check mouse
if (content_mouseon && abs(point_distance(mouse_x - content_x, mouse_y - content_y, coord[X], coord[Y]) - radius) < view_3d_control_width/2)
	view.control_mouseon = -1
	
draw_set_color(c_white)
draw_set_alpha(1)
