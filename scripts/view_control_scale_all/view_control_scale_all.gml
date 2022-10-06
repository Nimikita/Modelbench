/// view_control_scale_all(view, mat, radius)
/// @arg view
/// @arg mat
/// @arg radius

function view_control_scale_all(view, mat, radius)
{
	var coord, alpha;
	coord = point3D_project(matrix_position(mat), view_proj_matrix, content_width, content_height)
	
	if (point3D_project_error)
		return 0
	
	coord[X] = round(coord[X])
	coord[Y] = round(coord[Y])
	
	// Check state
	if (window_busy = "rendercontrol")
	{
		if (view_control_edit != e_control.SCA_XYZ)
			return 0
		
		coord = view_control_scale_coords
		view_control_scale_amount = point_distance((mouse_wrap_x * content_width) + mouse_x - content_x, (mouse_wrap_y * content_height) + mouse_y - content_y, view_control_scale_coords[X], view_control_scale_coords[Y]) / radius
	}
	else if (view.control_mouseon_last = e_control.SCA_XYZ)
	{
		// Left click
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
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
	
	draw_set_color(c_level_middle)
	
	// Draw circle
	if (view.control_mouseon_last = e_control.SCA_XYZ)
		alpha = .5
	else
		alpha = 0.25
	
	var drawcoord, mousecoord;
	drawcoord = vec2_mul(coord, 2)
	mousecoord = point2D((mouse_wrap_x * content_width) + mouse_x - content_x, (mouse_wrap_y * content_height) + mouse_y - content_y)
	
	if (view_control_edit != e_control.SCA_XYZ)
	{
		for (var i = 0; i < 10; i++)
			draw_circle_ext(drawcoord[X], drawcoord[Y], (radius * 2) + (i * .5), true, 64, c_black, alpha)
	}
	else
	{
		draw_image(spr_circle_20, 0, mousecoord[X] * 2, mousecoord[Y] * 2, 1, 1, c_level_middle, 1)
		
		render_set_culling(false)
		
		draw_set_color(c_text_tertiary)
		draw_set_alpha(a_text_tertiary)
		draw_line_width(drawcoord[X], drawcoord[Y], mousecoord[X] * 2, mousecoord[Y] * 2, 8)
		draw_set_color(c_level_middle)
		draw_set_alpha(1)
		
		draw_line_width(drawcoord[X], drawcoord[Y], mousecoord[X] * 2, mousecoord[Y] * 2, 4)
		
		// Draw notches
		for (var i = 0; i < ceil(view_control_scale_amount * 5); i++)
		{
			var nx, ny, angle;
			nx = lerp(mousecoord[X] * 2, drawcoord[X], i/(view_control_scale_amount * 5))
			ny = lerp(mousecoord[Y] * 2, drawcoord[Y], i/(view_control_scale_amount * 5))
			
			if (nx > content_width * 2 || ny > content_height * 2 || nx < 0 || ny < 0)
				continue
			
			angle = radtodeg(arctan2((mousecoord[Y]*2) - drawcoord[Y], (mousecoord[X] * 2) - drawcoord[X]))
			draw_image(spr_view_line, 0, nx, ny, 3, 2.5, c_text_tertiary, a_text_tertiary, -angle)
			draw_image(spr_view_line, 0, nx, ny, 2, 2, ((i mod 5) = 0 ? c_accent : c_level_middle), 1, -angle)
		}
		
		render_set_culling(true)
	}
	
	// Check mouse
	if (content_mouseon && abs(point_distance(mouse_x - content_x, mouse_y - content_y, coord[X], coord[Y]) - radius) < view_3d_control_width/2)
		view.control_mouseon = e_control.SCA_XYZ
	
	draw_set_color(c_white)
	draw_set_alpha(1)
}
