/// camera_control_pan()

function camera_control_pan()
{
	var mx, my, move;
	mx = -((display_mouse_get_x() - view_click_x) * .0625)
	my = ((display_mouse_get_y() - view_click_y) * .0625)
	display_mouse_set(view_click_x, view_click_y)
	
	move = setting_move_speed
	
	// Create matrix
	var mat = matrix_create(vec3(0, 0, 0), vec3(view_cam.angle_look_z, 0, view_cam.angle_look_xy + 90), vec3(1));
	var vert = vec3_mul_matrix(vec3(mx * move, 0, my * move), mat);
	
	view_cam.from[X] += vert[X]
	view_cam.from[Y] += vert[Y]
	view_cam.from[Z] += vert[Z]
	
	view_cam.focus[X] += vert[X]
	view_cam.focus[Y] += vert[Y]
	view_cam.focus[Z] += vert[Z]
}
