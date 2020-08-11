/// view_control_scale_all(view, mat, radius)
/// @arg view
/// @arg mat
/// @arg radius

var view, mat, coord, radius, alpha;
view = argument0
mat = argument1
radius = argument2

coord = point3D_project(matrix_position(mat), view_proj_matrix, content_width, content_height)

if (point3D_project_error)
	return 0

coord[X] = round(coord[X])
coord[Y] = round(coord[Y])

// Check state
if (window_busy = "rendercontrolscalexyz")
{
	if (view_control_edit != e_control.SCA_XYZ)
		return 0
	
	coord = view_control_scale_coords
	view_control_scale_amount = point_distance(mouse_x - content_x, mouse_y - content_y, view_control_scale_coords[X], view_control_scale_coords[Y]) / radius
}
else if (view.control_mouseon_last = e_control.SCA_XYZ)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrolscalexyz"
		view_control_value_scale[X] = el_edit.value[e_value.SCA_X]
		view_control_value_scale[Y] = el_edit.value[e_value.SCA_Y]
		view_control_value_scale[Z] = el_edit.value[e_value.SCA_Z]
		view_control_edit = e_control.SCA_XYZ
		view_control_edit_view = view
		view_control_scale_amount = point_distance(mouse_x - content_x, mouse_y - content_y, coord[X], coord[Y]) / radius
		view_control_scale_coords[X] = coord[X]
		view_control_scale_coords[Y] = coord[Y]
		view_control_matrix = mat
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		axis_edit = X
		el_value_set_start(action_el_sca, true)
		
		for (var i = X; i <= Z; i++)
			el_value_set(e_value.SCA_X + i, element_value_default(e_value.SCA_X + i), false)
		
		el_value_set_done()
		app_mouse_clear()
	}
	
}

draw_set_color(c_background)

// Draw circle
if (view.control_mouseon_last = e_control.SCA_XYZ)
	alpha = .5
else
	alpha = 0.25

var drawcoord, mousecoord;
drawcoord = vec2_mul(coord, 2)
mousecoord = point2D(mouse_x - content_x, mouse_y - content_y)

if (window_busy != "rendercontrolscalexyz")
{
	for (var i = 0; i < 10; i++)
		draw_circle_ext(drawcoord[X], drawcoord[Y], (radius * 2) + (i * .5), true, c_black, alpha)
}
else
{
	draw_circle_ext(mousecoord[X] * 2, mousecoord[Y] * 2, 20, false, c_background, 1)
	draw_circle_ext(mousecoord[X] * 2, mousecoord[Y] * 2, 12, false, c_background, 2)
	
	render_set_culling(false)
	
	draw_set_color(c_text_tertiary)
	draw_set_alpha(a_text_tertiary)
	draw_line_width(drawcoord[X], drawcoord[Y], mousecoord[X] * 2, mousecoord[Y] * 2, 8)
	draw_set_color(c_background)
	draw_set_alpha(1)
	
	draw_line_width(drawcoord[X], drawcoord[Y], mousecoord[X] * 2, mousecoord[Y] * 2, 4)
	
	// Draw notches
	for (var i = 0; i < ceil(view_control_scale_amount * 5); i++)
	{
		var nx, ny, angle;
		nx = lerp(mousecoord[X] * 2, drawcoord[X], i/(view_control_scale_amount * 5))
		ny = lerp(mousecoord[Y] * 2, drawcoord[Y], i/(view_control_scale_amount * 5))
		angle = radtodeg(arctan2((mousecoord[Y]*2) - drawcoord[Y], (mousecoord[X] * 2) - drawcoord[X]))
		draw_image(spr_view_line, 0, nx, ny, 3, 2.5, c_text_tertiary, a_text_tertiary, -angle)
		draw_image(spr_view_line, 0, nx, ny, 2, 2, ((i mod 5) = 0 ? c_accent : c_background), 1, -angle)
	}
	
	render_set_culling(true)
}

// Check mouse
if (content_mouseon && abs(point_distance(mouse_x - content_x, mouse_y - content_y, coord[X], coord[Y]) - radius) < view_3d_control_width/2)
	view.control_mouseon = e_control.SCA_XYZ
	
draw_set_color(c_white)
draw_set_alpha(1)
