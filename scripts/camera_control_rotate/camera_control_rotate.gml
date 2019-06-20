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

if (fps > 30 && setting_smooth_camera && setting_smooth_camera_amount > 0)
{
	cam_work_angle_off_xy += mx / ((setting_smooth_camera_amount + 2) / delta)
	cam_work_angle_off_z += my / ((setting_smooth_camera_amount + 2) / delta)
}
else
{
	cam_work_angle_off_xy = 0
	cam_work_angle_off_z = 0
		
	cam_work_angle_xy += mx
	cam_work_angle_z += my
	cam_work_angle_z = clamp(cam_work_angle_z, -89.9, 89.9)
	
	cam_work_angle_look_xy += mx
	cam_work_angle_look_z -= my
	cam_work_angle_look_z = clamp(cam_work_angle_look_z, -89.9, 89.9)
	camera_work_set_from()
}

if (keyboard_check_pressed(setting_key_reset))
	camera_work_reset()

