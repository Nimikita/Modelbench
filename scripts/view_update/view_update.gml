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
	//mouse_cursor = cr_handpoint
	
	if (mouse_left_pressed && (view_cam = view_cam_viewport))
	{
		window_busy = "viewclick"
		window_focus = string(view)
	}
	
	if (mouse_middle_pressed && !keyboard_check(vk_shift))
	{
		window_busy = "viewrotatecamera"
		
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
			
		window_focus = string(view)
	}
	
	/*
	if (mouse_right_pressed)
	{
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
		window_busy = "viewmovecamera"
		window_focus = string(view)
	}
	*/
	
	if (mouse_middle_pressed && keyboard_check(vk_shift))
	{
		window_busy = "viewpancamera"
		window_focus = string(view)
	}
}

// Mousewheel
if (content_mouseon || window_busy = "viewrotatecamera")
{
	window_scroll_focus = string(view)
	
	if (window_scroll_focus_prev = string(view))
	{
		if (mouse_wheel <> 0)
			view_cam.zoom_goal = clamp(view_cam.zoom_goal * (1 + 0.25 * mouse_wheel), cam_near, cam_far)
	}
}

if (window_focus = string(view))
{
	// Select or move camera
	if (window_busy = "viewclick" || window_busy = "viewgroupselect")
	{
		mouse_cursor = cr_handpoint
		
		/*
		if (mouse_move > 5)
		{
			view_click_x = display_mouse_get_x()
			view_click_y = display_mouse_get_y()
			window_busy = "viewrotatecamera"
		}
		*/
		
		if (mouse_left && mouse_move > 5 && window_busy = "viewclick")
			window_busy = "viewgroupselect"
		
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
		
		if (!mouse_middle)
			window_busy = ""
	}
	
	// Move camera
	if (window_busy = "viewmovecamera")
	{
		mouse_cursor = cr_none
		
		camera_control_move(cam, view_click_x, view_click_y)
		
		if (!mouse_right)
		{
			camera_set_focus()
			window_busy = ""
		}
	}
	
	// Pan camera
	if (window_busy = "viewpancamera")
	{
		camera_control_pan()
		
		if (!mouse_middle)
		{
			camera_set_focus()
			window_busy = ""
		}
	}
	
	// Smoothen angles
	if ((view_cam.angle_off_xy != 0 || view_cam.angle_off_z != 0) && fps > 30 && setting_smooth_camera) // Doesn't like low FPS
	{
		view_cam.angle_off_xy -= view_cam.angle_off_xy / (4 / delta)
		view_cam.angle_off_z -= view_cam.angle_off_z / (4 / delta)
		
		view_cam.angle_xy += view_cam.angle_off_xy
		view_cam.angle_z += view_cam.angle_off_z
		view_cam.angle_z = clamp(view_cam.angle_z, -89.9, 89.9)
		
		view_cam.angle_look_xy += view_cam.angle_off_xy
		view_cam.angle_look_z -= view_cam.angle_off_z
		view_cam.angle_look_z = clamp(view_cam.angle_look_z, -89.9, 89.9)
		
		camera_set_from()
	}

}
