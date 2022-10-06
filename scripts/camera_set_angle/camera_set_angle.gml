/// camera_set_angle()

function camera_set_angle()
{
	with (app.view_cam)
	{
		angle_xy = point_direction(focus[X], focus[Y], from[X], from[Y])
		angle_z = point_zdirection(focus[X], focus[Y], focus[Z], from[X], from[Y], from[Z])
		angle_z = clamp(angle_z, -89.9, 89.9)
		
		zoom = point3D_distance(focus, from)
		zoom_goal = zoom
	}
}
