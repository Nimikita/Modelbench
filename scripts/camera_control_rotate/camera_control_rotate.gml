/// camera_control_rotate(camera, lockx, locky)
/// @arg camera
/// @arg lockx
/// @arg locky

var cam, lockx, locky, mx, my;
cam = argument0
lockx = argument1
locky = argument2

mx = -((display_mouse_get_x() - lockx) / 4)
my = ((display_mouse_get_y() - locky) / 4)
display_mouse_set(lockx, locky)

if (fps > 30 && setting_smooth_camera)
{
	view_cam.angle_off_xy += mx / (4 / delta)
	view_cam.angle_off_z += my / (4 / delta)
}
else
{
	view_cam.angle_off_xy = 0
	view_cam.angle_off_z = 0
		
	view_cam.angle_xy += mx
	view_cam.angle_z += my
	view_cam.angle_z = clamp(view_cam.angle_z, -89.9, 89.9)
	
	view_cam.angle_look_xy += mx
	view_cam.angle_look_z -= my
	view_cam.angle_look_z = clamp(view_cam.angle_look_z, -89.9, 89.9)
	camera_set_from()
}

if (keyboard_check_pressed(setting_key_reset[e_shortcut.KEY]))
	camera_reset()

