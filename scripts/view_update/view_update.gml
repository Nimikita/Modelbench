/// view_update(view, camera)
/// @arg view
/// @arg camera

function view_update(view, cam)
{
	// Surface
	view_update_surface(view, cam)
	
	// Add shortcuts
	if (view.control_mouseon_last != null || window_busy = "rendercontrol")
	{
		if (window_busy = "rendercontrol")
			shortcut_bar_state = "rendercontrolhover"
		else
			shortcut_bar_state = "rendercontrol"
	}
	
	if (window_busy = "viewmovecamera" || window_busy = "viewmovecameratoggle")
		shortcut_bar_state = "cameramove"
	
	// Click
	if (view.control_mouseon_last = null && content_mouseon && window_busy = "")
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
		
		if ((setting_viewport_controls_middle && mouse_middle) && keyboard_check(vk_shift))
		{
			window_busy = "viewpancamera"
			view_click_x = display_mouse_get_x()
			view_click_y = display_mouse_get_y()
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
	
	if (window_busy = "viewzoom")
	{
		mouse_cursor = cr_none
		
		view_cam.zoom += (display_mouse_get_y() - view_click_y) / 2
		view_cam.zoom = clamp(view_cam.zoom, cam_near, cam_far)
		view_cam.zoom_goal = view_cam.zoom
		
		display_mouse_set(view_click_x, view_click_y)
		
		if (mouse_left_released)
		{
			app_mouse_clear()
			window_busy = ""
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
				context_menu_area(content_x, content_y, content_width, content_height, "contextmenuviewport", view_cam, e_context_type.NONE, null, null)
			}
		}
		
		// Select or orbit camera
		if (window_busy = "viewclick" || window_busy = "viewgroupselect")
		{
			mouse_cursor = cr_handpoint
			
			if (mouse_move > 5 && !setting_viewport_controls_middle && !keyboard_check(vk_shift))
			{
				view_click_x = display_mouse_get_x()
				view_click_y = display_mouse_get_y()
				window_busy = "viewrotatecamera"
			}
			
			if ((!setting_viewport_controls_middle && mouse_left) && mouse_move > 5 && keyboard_check(vk_shift))
			{
				view_click_x = display_mouse_get_x()
				view_click_y = display_mouse_get_y()
				window_busy = "viewpancamera"
				window_focus = string(view)
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
			
			shortcut_bar_state = "cameramove"
			
			if (!mouse_right && window_busy = "viewmovecamera")
			{
				camera_set_focus()
				window_busy = ""
			}
			
			if ((mouse_left_released || mouse_right_released) && window_busy = "viewmovecameratoggle")
			{
				app_mouse_clear()
				camera_set_focus()
				window_busy = ""
			}
		}
		
		// Pan camera
		if (window_busy = "viewpancamera" || window_busy = "viewpan")
		{
			mouse_cursor = cr_none
			camera_control_pan()
			
			if (setting_viewport_controls_middle ? !mouse_middle : !mouse_left)
			{
				camera_set_focus()
				window_busy = ""
			}
		}
	}
}
