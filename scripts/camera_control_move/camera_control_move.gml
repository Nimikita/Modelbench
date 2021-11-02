/// camera_control_move(camera, lockx, locky)
/// @arg camera
/// @arg lockx
/// @arg locky

var cam, lockx, locky, mx, my;
cam = argument0
lockx = argument1
locky = argument2

mx = -((display_mouse_get_x() - lockx) / 8) * setting_look_sensitivity
my = -((display_mouse_get_y() - locky) / 8) * setting_look_sensitivity
display_mouse_set(lockx, locky)

var move, spd, spdm, xd, yd, zd;
	
view_cam.angle_look_xy += mx
view_cam.angle_look_z += my
view_cam.angle_look_z = clamp(view_cam.angle_look_z, -89.9, 89.9)
	
// Move
move = 4 * setting_move_speed
spd = (keyboard_check(setting_key_forward[e_shortcut.KEY]) - keyboard_check(setting_key_back[e_shortcut.KEY])) * move
spdm = 1
if (keyboard_check(setting_key_fast[e_shortcut.KEY]))
	spdm = setting_fast_modifier
if (keyboard_check(setting_key_slow[e_shortcut.KEY]))
	spdm = setting_slow_modifier
	
if (keyboard_check(setting_key_right[e_shortcut.KEY]))
{
	xd = -sin(degtorad(view_cam.angle_look_xy)) * move
	yd = -cos(degtorad(view_cam.angle_look_xy)) * move
}
else if (keyboard_check(setting_key_left[e_shortcut.KEY]))
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
zd = (keyboard_check(setting_key_ascend[e_shortcut.KEY]) - keyboard_check(setting_key_descend[e_shortcut.KEY])) * move
zd += (dsin(view_cam.angle_look_z)) * (keyboard_check(setting_key_forward[e_shortcut.KEY]) - keyboard_check(setting_key_back[e_shortcut.KEY])) * move
	
	
view_cam.from[X] += xd * spdm
view_cam.from[Y] += yd * spdm
view_cam.from[Z] += zd * spdm
	
// Reset
if (keyboard_check_pressed(setting_key_reset[e_shortcut.KEY]))
	camera_reset()
		
camera_set_angle()

