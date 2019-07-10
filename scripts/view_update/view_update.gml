/// view_update(view, camera)
/// @arg view
/// @arg camera

var view, cam;
view = argument0
cam = argument1

// Surface
view_update_surface(view, cam)

// Click
if (content_mouseon && window_busy = "")
{
	mouse_cursor = cr_handpoint
	if (mouse_left_pressed)
	{
		window_busy = "viewclick"
		window_focus = string(view)
	}
	
	if (mouse_right_pressed)
	{
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
		window_busy = "viewmovecamera"
		window_focus = string(view)
	}
}

if (window_focus = string(view))
{
	// Mousewheel
	if ((window_busy = "" || window_busy = "viewrotatecamera") && mouse_wheel <> 0)
		cam_work_zoom_goal = clamp(cam_work_zoom_goal * (1 + 0.25 * mouse_wheel), cam_near, cam_far)
	
	// Select or move camera
	if (window_busy = "viewclick")
	{
		mouse_cursor = cr_handpoint
		
		if (mouse_move > 5)
		{
			view_click_x = display_mouse_get_x()
			view_click_y = display_mouse_get_y()
			window_busy = "viewrotatecamera"
		}
		
		if (!mouse_left)
		{
			view_click(view, cam)
			window_busy = ""
		}
	}
	
	// Rotate camera
	if (window_busy = "viewrotatecamera")
	{
		mouse_cursor = cr_none
		
		camera_control_rotate(cam, view_click_x, view_click_y)
		
		if (!mouse_left)
			window_busy = ""
	}
	
	// Move camera
	if (window_busy = "viewmovecamera")
	{
		mouse_cursor = cr_none
		
		camera_control_move(cam, view_click_x, view_click_y)
		
		if (!mouse_right)
		{
			camera_work_set_focus()
			window_busy = ""
		}
	}
	
	// Smoothen angles
	if ((cam_work_angle_off_xy != 0 || cam_work_angle_off_z != 0) && fps > 30 && setting_smooth_camera && setting_smooth_camera_amount > 0) // Doesn't like low FPS
	{
		cam_work_angle_off_xy -= cam_work_angle_off_xy / ((setting_smooth_camera_amount + 2) / delta)
		cam_work_angle_off_z -= cam_work_angle_off_z / ((setting_smooth_camera_amount + 2) / delta)
		
		cam_work_angle_xy += cam_work_angle_off_xy
		cam_work_angle_z += cam_work_angle_off_z
		cam_work_angle_z = clamp(cam_work_angle_z, -89.9, 89.9)
		
		cam_work_angle_look_xy += cam_work_angle_off_xy
		cam_work_angle_look_z -= cam_work_angle_off_z
		cam_work_angle_look_z = clamp(cam_work_angle_look_z, -89.9, 89.9)
		
		camera_work_set_from()
	}

}
