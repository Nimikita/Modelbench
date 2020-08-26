/// app_update_work_camera()

with (app.view_cam)
{
	if (app.setting_reduced_motion)
		zoom = zoom_goal
	else
		zoom += (zoom_goal - zoom) / max(1, 4 / delta)
	
	if (focus_last[X] != focus[X] || 
		focus_last[Y] != focus[Y] || 
		focus_last[Z] != focus[Z])
		camera_set_angle()

	focus_last = point3D_copy(focus)
	camera_set_from()
}
