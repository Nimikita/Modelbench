/// view_control_rotate_axis(view, valueid, color, matrix, length)
/// @arg view
/// @arg valueid
/// @arg color
/// @arg matrix
/// @arg length

var view, vid, color, mat, len, detail, pointarray;
var pos3D, pos2D;
view = argument0
vid = argument1
color = argument2
mat = argument3
len = argument4
detail = test(view_control_edit = vid, 24, 32)

// Get middle
pos3D = point3D_mul_matrix(point3D(0, 0, 0), mat)
pos2D = view_shape_project(pos3D)
if (point3D_project_error)
	return 0

// Check state
if (window_busy = "rendercontrol")
{
	var facevec, camvec;
	
	if (view_control_edit != vid)
		return 0
		
	// Invert input?
	facevec = vec3_normalize(vec3_mul_matrix(vec3(0, 0, 1), mat))
	camvec = vec3_normalize(point3D_sub(cam_from, pos3D))
	view_control_flip = (vec3_dot(facevec, camvec) < 0)
	
	// Update dragging
	view_control_pos = pos2D
	draw_set_color(c_white)
}
else if (view.control_mouseon_last = vid)
{
	// Left click
	if (mouse_left_pressed)
	{
		window_busy = "rendercontrol"
		view_control_edit = vid
		view_control_edit_view = view
		view_control_value = el_edit.value[vid]
		view_control_value_add = 0
		view_control_pos = pos2D
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

// Update circle points for wheels(too slow for realtime)
if (view_control_update_rot[vid - e_value.ROT_X])
{
	view_control_rot_points[vid - e_value.ROT_X] = 0
	view_control_rot_points[vid - e_value.ROT_X] = array()
	
	
	for (var i = 0; i <= 1; i += 1/detail)
	{
		var start3D, start2D, end3D, end2D;
	
		// Convert to screen
		start3D = point3D_mul_matrix(point3D(cos(pi * 2 * (i - 1 / detail)) * len, sin(pi * 2 * (i - 1 / detail)) * len, 0), mat)
		start2D = view_shape_project(start3D)
		if (point3D_project_error)
			continue
		
		// Hide line
		if (view_control_edit != vid)
		{
			var dis1, dis2;
			dis1 = vec3_length(point3D_sub(start3D, cam_from))
			dis2 = vec3_length(point3D_sub(el_edit.world_pos, cam_from))
			if ((dis2 - dis1) < -1)
				continue
		}
		
		end3D = point3D_mul_matrix(point3D(cos(pi * 2 * i) * len, sin(pi * 2 * i) * len, 0), mat)
		end2D = view_shape_project(end3D)
		if (point3D_project_error)
			continue
		
		array_add(view_control_rot_points[vid - e_value.ROT_X], start2D[X])
		array_add(view_control_rot_points[vid - e_value.ROT_X], start2D[Y])
		array_add(view_control_rot_points[vid - e_value.ROT_X], end2D[X])
		array_add(view_control_rot_points[vid - e_value.ROT_X], end2D[Y])
	}
}
view_control_update_rot[vid - e_value.ROT_X] = false

// Get array after updating to combat delay otherwise
pointarray = view_control_rot_points[vid - e_value.ROT_X]

for (var i = 0; i < array_length_1d(pointarray); i += 4)
{
	var start2D, end2D;
	start2D = point2D(pointarray[i], pointarray[i + 1])
	end2D = point2D(pointarray[i + 2], pointarray[i + 3])
	
	// Line
	view_shape_line_draw(start2D, end2D)
	
	// Check mouse
	if (content_mouseon && point_line_distance(start2D[X], start2D[Y], end2D[X], end2D[Y], mouse_x - content_x, mouse_y - content_y) < view_3d_control_width / 2)
		view.control_mouseon = vid
}

draw_set_color(c_white)
