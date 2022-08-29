/// camera_set_focus()

function camera_set_focus()
{
	with (app.view_cam)
	{
		focus[X] = from[X] + lengthdir_x(zoom, angle_look_xy + 180) * lengthdir_x(1, angle_look_z)
		focus[Y] = from[Y] + lengthdir_y(zoom, angle_look_xy + 180) * lengthdir_x(1, angle_look_z)
		focus[Z] = from[Z] + lengthdir_z(zoom, angle_look_z)
	}
}
