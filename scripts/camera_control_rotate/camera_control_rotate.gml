/// camera_control_rotate(camera, lockx, locky)
/// @arg camera
/// @arg lockx
/// @arg locky

function camera_control_rotate(cam, lockx, locky)
{
	var mx, my;
	mx = -((display_mouse_get_x() - lockx) / 4)
	my = ((display_mouse_get_y() - locky) / 4)
	display_mouse_set(lockx, locky)
	
	view_cam.angle_xy += mx
	view_cam.angle_z += my
	view_cam.angle_z = clamp(view_cam.angle_z, -89.9, 89.9)
	
	view_cam.angle_look_xy += mx
	view_cam.angle_look_z -= my
	view_cam.angle_look_z = clamp(view_cam.angle_look_z, -89.9, 89.9)
	camera_set_from()
	
	if (keybinds[e_keybind.CAM_RESET].pressed)
		camera_reset()
}
