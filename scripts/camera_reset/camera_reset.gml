/// camera_reset()

var cam = id;

if (object_index = app)
	cam = view_cam

with (cam)
{
	focus = point3D(0, 0, 16)
	focus_last = point3D(0, 0, 6)

	angle_xy = 315
	angle_z = 0
	roll = 0
	zoom = 100
	zoom_goal = zoom

	angle_look_xy = angle_xy
	angle_look_z = -angle_z

	angle_off_xy = 0
	angle_off_z = 0
}

camera_set_from()