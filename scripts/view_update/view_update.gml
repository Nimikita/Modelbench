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
	else if (mouse_right_pressed)
	{
		window_busy = "viewrightclick"
		window_focus = string(view)
	}
	
	if ((setting_viewport_controls_middle && mouse_middle_pressed) && !keyboard_check(vk_shift))
	{
		window_busy = "viewrotatecamera"
		
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
			
		window_focus = string(view)
	}
	
	if ((setting_viewport_controls_middle ? mouse_middle_pressed : mouse_left_pressed) && keyboard_check(vk_shift))
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
	// Right-click or move camera
	if (window_busy = "viewrightclick")
	{
		if (mouse_move_right > 1)
		{
			view_click_x = display_mouse_get_x()
			view_click_y = display_mouse_get_y()
			window_busy = "viewmovecamera"
			window_focus = string(view)
		}
		
		if (!mouse_right)
		{
			window_busy = ""
			
			if (view_cam = view_cam_viewport)
				context_menu_area(content_x, content_y, content_width, content_height, "contextmenuviewport", el_edit, e_value_type.NONE, null, null)
		}
	}
	
	// Select or orbit camera
	if (window_busy = "viewclick" || window_busy = "viewgroupselect")
	{
		mouse_cursor = cr_handpoint
		
		if (mouse_move > 5 && !setting_viewport_controls_middle)
		{
			view_click_x = display_mouse_get_x()
			view_click_y = display_mouse_get_y()
			window_busy = "viewrotatecamera"
		}
		
		//if (mouse_left && mouse_move > 5 && window_busy = "viewclick")
		//	window_busy = "viewgroupselect"
		
		if (!mouse_left)
		{
			window_busy = ""
			
			if (view_cam = view_cam_viewport)
				view_click(view, cam)
		}
	}
	
	// Rotate camera
	if (window_busy = "viewrotatecamera")
	{
		mouse_cursor = cr_none
		
		camera_control_rotate(cam, view_click_x, view_click_y)
		
		if (!setting_viewport_controls_middle ? !mouse_left : !mouse_middle)
			window_busy = ""
	}
	
	// Move camera
	if (window_busy = "viewmovecamera" || window_busy = "viewmovecameratoggle")
	{
		mouse_cursor = cr_none
		
		camera_control_move(cam, view_click_x, view_click_y)
		
		if (!mouse_right && window_busy = "viewmovecamera")
		{
			camera_set_focus()
			window_busy = ""
		}
		
		if (mouse_left_pressed || mouse_right_pressed && window_busy = "viewmovecameratoggle")
		{
			app_mouse_clear()
			camera_set_focus()
			window_busy = ""
		}
	}
	
	// Pan camera
	if (window_busy = "viewpancamera")
	{
		camera_control_pan()
		
		if (setting_viewport_controls_middle ? !mouse_middle : !mouse_left)
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
