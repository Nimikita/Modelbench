/// view_control_bend(view)
/// @arg view

var view, size, angle;
var offset3d, offset2d, offseterr, bent3d, bent2d, benterr, unbent3d, unbent2d, unbenterr;
view = argument0

#region Calculate bend size/angle

if (!el_edit.value[e_value.BEND_SIZE_CUSTOM])
	size = (app.setting_blocky_bending ? 1 : 4) / 2
else
	size = el_edit.bend_size / 2

// Invert size
size *= negate(el_edit.bend_part = e_part.LOWER || el_edit.bend_part = e_part.BACK || el_edit.bend_part = e_part.LEFT)

// Bend angle
for (var i = X; i <= Z; i++)
	angle[X + i] = el_edit.bend_default_angle[X + i] * negate(el_edit.value[e_value.BEND_INVERT_X + i])

#endregion

#region Calculate point positions

// Offset position
offset3d = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit), vec3(0), vec3(1)), el_edit.matrix_parent))
offset2d = point3D_project(offset3d, view_proj_matrix, render_width, render_height)
offseterr = point3D_project_error

// Unbent half
unbent3d = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit, el_edit.value[e_value.BEND_OFFSET] + -size), vec3(0), vec3(1)), el_edit.matrix_parent))
unbent2d = point3D_project(unbent3d, view_proj_matrix, render_width, render_height)
unbenterr = point3D_project_error

// Bent half
var bendmatrix;
with (el_edit)
	bendmatrix = matrix_create(model_part_get_offset_pos(el_edit, size), vec3(0), vec3(1))

bendmatrix = matrix_multiply(bendmatrix, matrix_create(model_part_get_offset_pos(el_edit), angle, vec3(1)))
	
bent3d = matrix_position(matrix_multiply(bendmatrix, el_edit.matrix_parent))
bent2d = point3D_project(bent3d, view_proj_matrix, render_width, render_height)
benterr = point3D_project_error

offset2d = vec2_mul(offset2d, 2)
unbent2d = vec2_mul(unbent2d, 2)
bent2d = vec2_mul(bent2d, 2)

#endregion

#region Draw bend region indicator

render_set_culling(false)

// Connecting lines
if (!offseterr && !unbenterr)
	draw_line_width_color(offset2d[X], offset2d[Y], unbent2d[X], unbent2d[Y], 6, merge_color(c_background, c_bend, .5), c_background)

if (!offseterr && !benterr)
	draw_line_width_color(offset2d[X], offset2d[Y], bent2d[X], bent2d[Y], 6, merge_color(c_bend, c_background, .5), c_bend)

render_set_culling(true)

if (!offseterr && !unbenterr && !benterr)
{
	// Offset
	if (point_distance(mouse_x - content_x, mouse_y - content_y, offset2d[X]/2, offset2d[Y]/2) < 14)
	{
		mouse_cursor = cr_handpoint
		
		// Left click
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
			view_control_edit_view = view
			view_control_edit = e_control.BEND_OFFSET
			view_control_vec = point2D_sub(offset2d, unbent2d)
			view_control_value = el_edit.value[e_value.BEND_OFFSET]
			view_control_move_distance = 0
		}
		
		// Right click
		if (mouse_right_pressed && keyboard_check(vk_shift))
		{
			axis_edit = X
			action_el_bend_offset(element_value_default(e_value.BEND_OFFSET), false)
			app_mouse_clear()
		}
		
		view.control_mouseon = e_control.BEND_OFFSET
	}
	
	// Size (Unbent half)
	if (el_edit.value[e_value.BEND_SIZE_CUSTOM] && point_distance(mouse_x - content_x, mouse_y - content_y, unbent2d[X]/2, unbent2d[Y]/2) < 9)
	{
		mouse_cursor = cr_handpoint
		
		// Left click
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
			view_control_edit_view = view
			view_control_edit = e_control.BEND_SIZE
			view_control_vec = point2D_sub(unbent2d, offset2d)
			view_control_value = el_edit.value[e_value.BEND_SIZE]
			view_control_move_distance = 0
		}
		
		// Right click
		if (mouse_right_pressed && keyboard_check(vk_shift))
		{
			axis_edit = X
			action_el_bend_size(element_value_default(e_value.BEND_SIZE), false)
			app_mouse_clear()
		}
		
		view.control_mouseon = e_control.BEND_SIZE
		draw_image(spr_circle_22, 0, unbent2d[X], unbent2d[Y], 2, 2, c_hover, a_hover)
	}
	draw_image(spr_circle_18, 0, unbent2d[X], unbent2d[Y], 2, 2, c_background, el_edit.value[e_value.BEND_SIZE_CUSTOM] ? 1 : .75)
	
	// Size (Bent half)
	if (el_edit.value[e_value.BEND_SIZE_CUSTOM] && point_distance(mouse_x - content_x, mouse_y - content_y, bent2d[X]/2, bent2d[Y]/2) < 9)
	{
		mouse_cursor = cr_handpoint
		
		// Left click
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
			view_control_edit_view = view
			view_control_edit = e_control.BEND_SIZE
			view_control_vec = point2D_sub(bent2d, offset2d)
			view_control_value = el_edit.value[e_value.BEND_SIZE]
			view_control_move_distance = 0
		}
		
		// Right click
		if (mouse_right_pressed && keyboard_check(vk_shift))
		{
			axis_edit = X
			action_el_bend_size(element_value_default(e_value.BEND_SIZE), false)
			app_mouse_clear()
		}
		
		view.control_mouseon = e_control.BEND_SIZE
		draw_image(spr_circle_22, 0, bent2d[X], bent2d[Y], 2, 2, c_hover, a_hover)
	}
	draw_image(spr_circle_18, 0, bent2d[X], bent2d[Y], 2, 2, c_bend, el_edit.value[e_value.BEND_SIZE_CUSTOM] ? 1 : .75)
	
}

#endregion

#region Bend angle

if (view.control_mouseon_last != e_control.BEND_OFFSET && view.control_mouseon_last != e_control.BEND_SIZE)
{
	var view, len, mat, color, offset;
	view = argument0
	len = point3D_distance(cam_from, el_edit.world_pos) * view_3d_control_size * view_control_ratio * 0.6
	mat = MAT_IDENTITY
	color = c_white
	offset = model_part_get_offset_pos(el_edit)

	for (var i = X; i <= Z; i++)
	{
		if (!el_edit.value[e_value.BEND_AXIS_X + i])
			continue
	
		var mat; 
		if (i = X)
		{
			mat = matrix_multiply(matrix_build(offset[X], offset[Y], offset[Z], 0, -90, el_edit.value[e_value.BEND_ANGLE_Z] * el_edit.value[e_value.BEND_AXIS_Z], 1, 1, 1), el_edit.matrix) 
			color = c_axiscyan
		}
		else if (i = Y) 
		{
			mat = matrix_multiply(matrix_build(offset[X], offset[Y], offset[Z], el_edit.value[e_value.BEND_ANGLE_X] * el_edit.value[e_value.BEND_AXIS_X] + 90, 0, el_edit.value[e_value.BEND_ANGLE_Z] * el_edit.value[e_value.BEND_AXIS_Z], 1, 1, 1), el_edit.matrix) 
			color = (setting_z_is_up ? c_axisyellow : c_axismagenta)
		}
		else
		{
			mat = matrix_multiply(matrix_build(offset[X], offset[Y], offset[Z], 0, 0, 0, 1, 1, 1), el_edit.matrix) 
			color = (setting_z_is_up ? c_axismagenta : c_axisyellow)
		}
	
		matrix_remove_scale(mat) 
		view_control_bend_axis(view, e_control.BEND_X + i, e_value.BEND_ANGLE_X + i, color, mat, len)
	}
}

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_control.BEND_X && view_control_edit <= e_control.BEND_Z)
{
	mouse_cursor = cr_handpoint
	
	if (!mouse_still)
	{
		var ang, prevang, rot, snapval, mul, move;
		
		// Find rotate amount
		axis_edit = view_control_edit - e_control.BEND_X
		ang = point_direction(mouse_x - content_x, mouse_y - content_y, view_control_pos[X], view_control_pos[Y])
		prevang = point_direction(mouse_previous_x - content_x, mouse_previous_y - content_y, view_control_pos[X], view_control_pos[Y])
		rot = angle_difference_fix(ang, prevang) * negate(view_control_flip) * negate(el_edit.value[e_value.BEND_INVERT_X + axis_edit]) * dragger_multiplier
		mul = min(1, (el_edit.value[e_value.BEND_X_MAX + axis_edit] - el_edit.value[e_value.BEND_X_MIN + axis_edit]) / 90)
		
		// Snap
		snapval = (dragger_snap ? setting_snap_size_rotation : snap_min)
		
		view_control_move_distance += rot * mul
		move = view_control_move_distance
		
		if (!setting_snap_absolute && dragger_snap)
			move = snap(move, snapval)
		
		move += view_control_value
		move = el_value_clamp(e_value.BEND_ANGLE_X + axis_edit, move)
		
		if (setting_snap_absolute || !dragger_snap)
			move = snap(move, snapval)
		
		move -= el_edit.value[e_value.BEND_ANGLE_X + axis_edit]
		
		// Update
		el_value_set_start(action_el_bend_angle, true)
		el_value_set(e_value.BEND_ANGLE_X + axis_edit, move, true)
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

#endregion

#region Bend offset

if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit = e_control.BEND_OFFSET)
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
		
		view_control_move_distance += (vec2_length(vecmouse) / veclen) * (size * 2) * vecdot * dragger_multiplier
		move = view_control_move_distance
		
		snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		if (!setting_snap_absolute && dragger_snap)
			move = snap(move, snapval)
		
		move += view_control_value
		move = el_value_clamp(e_value.BEND_OFFSET, move)
		
		if (setting_snap_absolute || !dragger_snap)
			move = snap(move, snapval)
		
		move -= el_edit.value[e_value.BEND_OFFSET]
		
		// Update
		el_value_set_start(action_el_bend_offset, true)
		el_value_set(e_value.BEND_OFFSET, move, true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
	}
}

#endregion

#region Bend size

if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit = e_control.BEND_SIZE)
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
		
		view_control_move_distance += ((vec2_length(vecmouse) / veclen) * (view_control_value * 2) * vecdot) * dragger_multiplier
		move = view_control_move_distance
		snapval = (dragger_snap ? setting_snap_size_position : snap_min)
		
		if (!setting_snap_absolute && dragger_snap)
			move = snap(move, snapval)
		
		move += view_control_value
		move = el_value_clamp(e_value.BEND_SIZE, move)
		
		if (setting_snap_absolute || !dragger_snap)
			move = snap(move, snapval)
		
		move -= el_edit.value[e_value.BEND_SIZE]
		
		// Update
		el_value_set_start(action_el_bend_size, true)
		el_value_set(e_value.BEND_SIZE, move, true)
		el_value_set_done()
	}
	
	// Release
	if (!mouse_left)
	{
		window_busy = ""
		view_control_edit = null
	}
}

#endregion
