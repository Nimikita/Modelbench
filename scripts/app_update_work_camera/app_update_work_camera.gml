/// app_update_work_camera()

cam_work_zoom += (cam_work_zoom_goal - cam_work_zoom) / max(1, 4 / delta)

if (cam_work_focus_last[X] != cam_work_focus[X] || 
	cam_work_focus_last[Y] != cam_work_focus[Y] || 
	cam_work_focus_last[Z] != cam_work_focus[Z])
	camera_work_set_angle()

cam_work_focus_last = point3D_copy(cam_work_focus)
camera_work_set_from()
