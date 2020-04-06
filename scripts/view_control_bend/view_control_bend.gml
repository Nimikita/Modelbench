/// view_control_bend(view)
/// @arg view

var view, size, angle, offsetmouseon;
view = argument0
offsetmouseon = (view_control_edit = e_value.BEND_OFFSET)

#region Bend display

if (!el_edit.value[e_value.BEND_SIZE_CUSTOM])
	size = (app.setting_blocky_bending ? 1 : 4) / 2
else
	size = el_edit.bend_size / 2

// Offset (Middle)
var offsetpos = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit), vec3(0), vec3(1)), el_edit.matrix_parent));
var offsetcoord = point3D_project(offsetpos, view_proj_matrix, render_width, render_height);
var offseterror = point3D_project_error;

angle = array_copy_1d(el_edit.bend_default_angle)

// Invert size
if (el_edit.bend_part = e_part.LOWER || el_edit.bend_part = e_part.BACK || el_edit.bend_part = e_part.LEFT)
	size *= -1

// Invert angle
for (var i = X; i <= Z; i++)
{
	if (el_edit.value[e_value.BEND_INVERT_X + i])
		angle[X + i] *= -1
}

// Bend size (Lower point)
var sizelowerpos = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit, el_edit.value[e_value.BEND_OFFSET] + -size), vec3(0), vec3(1)), el_edit.matrix_parent));
var sizelowercoord = point3D_project(sizelowerpos, view_proj_matrix, render_width, render_height);
var sizelowererror = point3D_project_error;

// Bend size (Upper point)
var bendmatrix;
with (el_edit)
	bendmatrix = matrix_create(model_part_get_offset_pos(el_edit, size), vec3(0), vec3(1))

bendmatrix = matrix_multiply(bendmatrix, matrix_create(model_part_get_offset_pos(el_edit), angle, vec3(1)))
	
var sizeupperpos = matrix_position(matrix_multiply(bendmatrix, el_edit.matrix_parent));
var sizeuppercoord = point3D_project(sizeupperpos, view_proj_matrix, render_width, render_height);
var sizeuppererror = point3D_project_error;

offsetcoord = vec2_mul(offsetcoord, 2)
sizelowercoord = vec2_mul(sizelowercoord, 2)
sizeuppercoord = vec2_mul(sizeuppercoord, 2)

// Connecting lines
render_set_culling(false)

if (!offseterror && !sizelowererror)
	draw_line_width_color(offsetcoord[X], offsetcoord[Y], sizelowercoord[X], sizelowercoord[Y], 6, merge_color(c_background, c_bend, .5), c_background)

if (!offseterror && !sizeuppererror)
	draw_line_width_color(offsetcoord[X], offsetcoord[Y], sizeuppercoord[X], sizeuppercoord[Y], 6, merge_color(c_bend, c_background, .5), c_bend)

render_set_culling(true)

// Offset
if (!offseterror)
	draw_circle_ext(offsetcoord[X], offsetcoord[Y], 14, false, merge_color(c_bend, c_background, .5), 1)

// Size
if (!sizelowererror)
	draw_image(spr_diamond, 0, sizelowercoord[X], sizelowercoord[Y], 2, 2, c_background, 1)

if (!sizeuppererror)
	draw_image(spr_diamond, 0, sizeuppercoord[X], sizeuppercoord[Y], 2, 2, c_bend, 1)

#endregion

// Bend offset
if (!offseterror && !sizelowererror && !sizeuppererror)
{
	if (point_distance(mouse_x - content_x, mouse_y - content_y, offsetcoord[X]/2, offsetcoord[Y]/2) < 14)
	{
		mouse_cursor = cr_handpoint
		offsetmouseon = true
		
		if (mouse_left_pressed)
		{
			window_busy = "rendercontrol"
			view_control_edit_view = view
			view_control_edit = e_value.BEND_OFFSET
			view_control_vec = point2D_sub(offsetcoord, sizelowercoord)
			view_control_value = el_edit.value[e_value.BEND_OFFSET]
		}
	}
}

// Bend angle
if (!offsetmouseon)
{
	var view, len, mat, color, offset;
	view = argument0
	len = point3D_distance(cam_from, offsetpos) * view_3d_control_size * view_control_ratio * 0.6
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
		view_control_rotate_axis(view, e_value.BEND_ANGLE_X + i, color, mat, len)
	}
}

// Is dragging
if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit >= e_value.BEND_ANGLE_X && view_control_edit <= e_value.BEND_ANGLE_Z)
{
	mouse_cursor = cr_handpoint
	
	if (!mouse_still)
	{
		var ang, prevang, rot, snapval, mul;
		
		// Find rotate amount
		axis_edit = view_control_edit - e_value.BEND_ANGLE_X
		ang = point_direction(mouse_x - content_x, mouse_y - content_y, view_control_pos[X], view_control_pos[Y])
		prevang = point_direction(mouse_previous_x - content_x, mouse_previous_y - content_y, view_control_pos[X], view_control_pos[Y])
		rot = angle_difference_fix(ang, prevang) * negate(view_control_flip) * negate(el_edit.value[e_value.BEND_INVERT_X + axis_edit])
		mul = min(1, (el_edit.value[e_value.BEND_X_MAX + axis_edit] - el_edit.value[e_value.BEND_X_MIN + axis_edit]) / 90)
		
		view_control_value += rot * mul
		view_control_value = el_value_clamp(view_control_edit, view_control_value)
		
		// Snap
		snapval = (setting_snap ? setting_snap_size_rotation : snap_min)
		
		// Update
		el_value_set_start(action_el_bend_angle, true)
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

if (window_busy = "rendercontrol" && view_control_edit_view = view && view_control_edit = e_value.BEND_OFFSET)
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
		move = (vec2_length(vecmouse) / veclen) * (size * 2) * vecdot
		view_control_value += move
		
		view_control_value = el_value_clamp(view_control_edit, view_control_value)
		snapval = (setting_snap ? setting_snap_size_position : snap_min)
		
		// Update
		el_value_set_start(action_el_bend_offset, true)
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
