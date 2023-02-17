/// camera_control_move(camera, lockx, locky)
/// @arg camera
/// @arg lockx
/// @arg locky

function camera_control_move(cam, lockx, locky)
{
	var mx, my;
	mx = -((display_mouse_get_x() - lockx) / 8) * setting_look_sensitivity
	my = -((display_mouse_get_y() - locky) / 8) * setting_look_sensitivity
	display_mouse_set(lockx, locky)
	
	var move, spd, spdm, xd, yd, zd;
		
	view_cam.angle_look_xy += mx
	view_cam.angle_look_z += my
	view_cam.angle_look_z = clamp(view_cam.angle_look_z, -89.9, 89.9)
	
	if (mx != 0 || my != 0)
	{
		camera_set_focus()
		camera_set_angle()
	}
	
	// Move
	move = 4 * setting_move_speed
	spd = (keybinds[e_keybind.CAM_FORWARD].active - keybinds[e_keybind.CAM_BACK].active) * move
	spdm = 1
	if (keybinds[e_keybind.CAM_FAST].active)
		spdm = setting_fast_modifier
	if (keybinds[e_keybind.CAM_SLOW].active)
		spdm = setting_slow_modifier
	
	if (keybinds[e_keybind.CAM_RIGHT].active)
	{
		xd = -sin(degtorad(view_cam.angle_look_xy)) * move
		yd = -cos(degtorad(view_cam.angle_look_xy)) * move
	}
	else if (keybinds[e_keybind.CAM_LEFT].active)
	{
		xd = sin(degtorad(view_cam.angle_look_xy)) * move
		yd = cos(degtorad(view_cam.angle_look_xy)) * move
	}
	else
	{
		xd = 0
		yd = 0
	}
	
	xd += -lengthdir_x(spd, view_cam.angle_look_xy)
	yd += -lengthdir_y(spd, view_cam.angle_look_xy)
	zd = (keybinds[e_keybind.CAM_ASCEND].active - keybinds[e_keybind.CAM_DESCEND].active) * move
	zd += (dsin(view_cam.angle_look_z)) * (keybinds[e_keybind.CAM_FORWARD].active - keybinds[e_keybind.CAM_BACK].active) * move
	
	view_cam.from[X] += xd * spdm
	view_cam.from[Y] += yd * spdm
	view_cam.from[Z] += zd * spdm
	
	view_cam.focus[X] += xd * spdm
	view_cam.focus[Y] += yd * spdm
	view_cam.focus[Z] += zd * spdm
	
	// Reset
	if (keybinds[e_keybind.CAM_RESET].pressed)
		camera_reset()
	
	if (xd != 0 || yd != 0 || zd != 0 || mx != 0 || my != 0)
		camera_set_angle()
}
