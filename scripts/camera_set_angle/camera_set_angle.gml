/// camera_set_angle()

with (app.view_cam)
{
	angle_xy = point_direction(focus[X], focus[Y], from[X], from[Y])
	angle_z = point_zdirection(focus[X], focus[Y], focus[Z], from[X], from[Y], from[Z])
	zoom = point3D_distance(focus, from)
	zoom_goal = zoom
	angle_off_xy = 0
	angle_off_z = 0
}
