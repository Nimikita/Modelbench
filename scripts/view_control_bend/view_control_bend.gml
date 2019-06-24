/// view_control_bend(view)
/// @arg view

var view, size, angle;
view = argument0

if (!el_edit.value[e_value.BEND_SIZE_CUSTOM])
	size = test(app.setting_blocky_bending, 1, 4) / 2
else
	size = el_edit.bend_size / 2


// Offset(Middle)
var offsetpos = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit), vec3(0), vec3(1)), el_edit.matrix_parent));
var offsetcoord = point3D_project(offsetpos, view_proj_matrix, render_width, render_height);
var offseterror = point3D_project_error;

angle = array_copy_1d(el_edit.bend_default_angle)

// Invert size
if (el_edit.bend_part = e_part.LOWER || el_edit.bend_part = e_part.BACK || el_edit.bend_part = e_part.LEFT)
{
	size *= -1
	//angle = vec3_mul(angle, -1)
}

// Limit angle
for (var i = X; i <= Z; i++)
{
	//if (angle[i] = 0)
	//	continue
	
	// Clamp to a valid angle
	//bend[i] = bend[i]tl_value_clamp(e_value.BEND_ANGLE_X + i, bend[i])
	
	// Invert
	if (el_edit.bend_invert[i])
		angle[i] *= -1
	
	// Reset if not defined
	if (!el_edit.bend_axis[i])
		angle[i] = 0
		
	// Limit by direction
	else
		angle[i] = clamp(angle[i], el_edit.bend_direction_min[i], el_edit.bend_direction_max[i])
}

// Bend size(Lower point)
var sizelowerpos = matrix_position(matrix_multiply(matrix_create(model_part_get_offset_pos(el_edit, el_edit.value[e_value.BEND_OFFSET] + -size), vec3(0), vec3(1)), el_edit.matrix_parent));
var sizelowercoord = point3D_project(sizelowerpos, view_proj_matrix, render_width, render_height);
var sizelowererror = point3D_project_error;

// Bend size(Upper point)
var bendmatrix;
with (el_edit)
	bendmatrix = matrix_create(model_part_get_offset_pos(el_edit, size), vec3(0), vec3(1))

bendmatrix = matrix_multiply(bendmatrix, matrix_create(model_part_get_offset_pos(el_edit), angle, vec3(1)))
	
var sizeupperpos = matrix_position(matrix_multiply(bendmatrix, el_edit.matrix_parent));
var sizeuppercoord = point3D_project(sizeupperpos, view_proj_matrix, render_width, render_height);
var sizeuppererror = point3D_project_error;



// Connecting lines
draw_set_color(c_bend)
render_set_culling(false)

if (!offseterror && !sizelowererror)
	draw_line_width(offsetcoord[X], offsetcoord[Y], sizelowercoord[X], sizelowercoord[Y], 2)

if (!offseterror && !sizeuppererror)
	draw_line_width(offsetcoord[X], offsetcoord[Y], sizeuppercoord[X], sizeuppercoord[Y], 2)

render_set_culling(true)

// Offset
if (!offseterror)
{
	draw_circle_ext(offsetcoord[X], offsetcoord[Y], 14, false, c_background, 1)
	draw_image(spr_icons, e_icon.bend, offsetcoord[X], offsetcoord[Y], 1, 1, c_neutral60, 1)
}

// Size
if (!sizelowererror)
	draw_image(spr_diamond, 0, sizelowercoord[X], sizelowercoord[Y], 1, 1, c_background, 1)

if (!sizeuppererror)
	draw_image(spr_diamond, 0, sizeuppercoord[X], sizeuppercoord[Y], 1, 1, c_bend, 1)
