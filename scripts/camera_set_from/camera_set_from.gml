/// camera_set_from()

var cam = id;

if (object_index = app)
	cam = view_cam

with (cam)
{
	from[X] = focus[X] + lengthdir_x(zoom, angle_xy) * lengthdir_x(1, angle_z)
	from[Y] = focus[Y] + lengthdir_y(zoom, angle_xy) * lengthdir_x(1, angle_z)
	from[Z] = focus[Z] + lengthdir_z(zoom, angle_z)
}
