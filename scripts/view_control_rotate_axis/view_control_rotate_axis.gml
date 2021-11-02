/// view_control_rotate_axis(view, control, valueid, color, matrix, length)
/// @arg view
/// @arg control
/// @arg valueid
/// @arg color
/// @arg matrix
/// @arg length

var view, control, vid, color, mat, len, detail;
var pos3D, pos2D, facevec, camvec;
view = argument0
control = argument1
vid = argument2
color = argument3
mat = argument4
len = argument5

detail = 64

if (view_control_length != null)
	len = view_control_length

// Get middle
pos3D = point3D_mul_matrix(point3D(0, 0, 0), mat)
pos2D = view_shape_project(pos3D)
if (point3D_project_error)
	return 0

facevec = vec3_normalize(vec3_mul_matrix(vec3(0, 0, 1), mat))
camvec = vec3_normalize(point3D_sub(cam_from, pos3D))

var alpha = percent(abs(vec3_dot(facevec, camvec)), .1, .2);

if ((window_busy = "rendercontrol" && view_control_edit = control) || view.control_mouseon_last = control)
	alpha = 1

if (alpha = 0)
	return 0

draw_set_alpha(alpha)

// Check state
if (window_busy = "rendercontrol")
{
	if (view_control_edit != control)
		return 0
		
	// Invert input?
	view_control_flip = (vec3_dot(facevec, camvec) < 0)
	
	// Update dragging
	view_control_pos = pos2D
	draw_set_color(color)
}
else if (view.control_mouseon_last = control)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = control
		view_control_edit_view = view
		view_control_value = el_edit.value[vid]
		view_control_pos = pos2D
		view_control_matrix = mat
		view_control_length = len
	}
	
	// Right click
	if (mouse_right_pressed && keyboard_check(vk_shift))
	{
		axis_edit = vid - e_value.ROT_X
		action_el_rot(0, false)
		app_mouse_clear()
	}
	
	draw_set_color(c_white)
}
else
	draw_set_color(color)

var start3D, start2D, end3D, end2D, v, vdot;
v = point3D_sub(pos3D, cam_from)
vdot = vec3_dot(v, v)

// Convert start position to screen
start3D = point3D_mul_matrix(point3D(cos(0) * len, sin(0) * len, 0), mat)
start2D = view_shape_project(start3D)
if (point3D_project_error)
{
	draw_set_color(c_white)
	return 0
}

// Draw circle
for (var i = 0; i <= 1; i += 1/detail)
{
	// Convert end position to screen
	end3D = point3D_mul_matrix(point3D(cos(pi * 2 * i) * len, sin(pi * 2 * i) * len, 0), mat)
	end2D = view_shape_project(end3D)
	if (point3D_project_error)
	{
		start3D = end3D
		start2D = end2D
		continue
	}

	// Hide line in circle if behind world position
	if (view_control_edit != control)
	{	
		if ((vec3_dot(point3D_sub(start3D, cam_from), v) / vdot) > 1.001)
		{
			start3D = end3D
			start2D = end2D
			continue
		}
	}
	
	// Using 0 to set up start positions
	if (i > 0)
		view_shape_line_draw(start2D, end2D)
	
	// Check mouse
	if (content_mouseon && point_line_distance(start2D[X], start2D[Y], end2D[X], end2D[Y], mouse_x - content_x, mouse_y - content_y) < view_3d_control_width / 2)
		view.control_mouseon = control
	
	// Set next start position as current end position
	start3D = end3D
	start2D = end2D
}

draw_set_color(c_white)
draw_set_alpha(1)
