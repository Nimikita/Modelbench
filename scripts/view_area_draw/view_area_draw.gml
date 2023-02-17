/// view_area_draw()

function view_area_draw()
{
	var showuveditor, resizebox, resizemouseon, viewwid;
	showuveditor = (setting_show_uv_editor && program_mode = e_mode.MODELING)
	resizemouseon = false
	viewwid = (panel_area_width - panel_map[?"left"].size_real_ani - panel_map[?"left_secondary"].size_real_ani - panel_map[?"right"].size_real_ani - panel_map[?"right_secondary"].size_real_ani)
	
	// Update resize
	if (window_busy = "uveditorresize")
	{
		var resize;
		
		if (setting_uv_editor_location = "top" || setting_uv_editor_location = "bottom")
		{
			resize = (uv_editor_resize - ((mouse_y - mouse_click_y) / panel_area_height))
			mouse_cursor = cr_size_ns
		}
		else
		{
			resize = (uv_editor_resize - ((mouse_x - mouse_click_x) / viewwid))
			mouse_cursor = cr_size_we
		}
		
		if (resize > .485 && resize < .515)
			setting_uv_editor_size = .5
		else
			setting_uv_editor_size = clamp(resize, .25, .75)
		
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
	
	if (showuveditor)
	{
		// Calculate area
		if (setting_uv_editor_location = "bottom")
		{
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_width = viewwid
			
			view_area_y = panel_area_y + round(panel_area_height * (1 - setting_uv_editor_size))
			view_area_height = round(panel_area_height * setting_uv_editor_size)
			
			resizebox = app_mouse_box(view_area_x, view_area_y - 6, view_area_width, 12)
		}
		else if (setting_uv_editor_location = "top")
		{
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_width = viewwid
			
			view_area_y = panel_area_y
			view_area_height = round(panel_area_height * (1 - setting_uv_editor_size))
			
			resizebox = app_mouse_box(view_area_x, (view_area_y + view_area_height) - 6, view_area_width, 12)
		}
		else if (setting_uv_editor_location = "left")
		{
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_width = ceil((viewwid) * (1 - setting_uv_editor_size))
			
			view_area_y = panel_area_y
			view_area_height = panel_area_height
			
			resizebox = app_mouse_box(view_area_x + view_area_width - 6, view_area_y, 12, view_area_height)
		}
		else if (setting_uv_editor_location = "right")
		{
			var wid = (viewwid);
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani + round(wid * (1 - setting_uv_editor_size))
			view_area_width = ceil(wid * (setting_uv_editor_size))
			
			view_area_y = panel_area_y
			view_area_height = panel_area_height
			
			resizebox = app_mouse_box(view_area_x - 6, view_area_y, 12, view_area_height)
		}
		
		// Check for resize
		if (resizebox && !popup_mouseon && !toast_mouseon && !context_menu_mouseon)
		{
			resizemouseon = true
			
			if (setting_uv_editor_location = "bottom" || setting_uv_editor_location = "top")
				mouse_cursor = cr_size_ns
			else
				mouse_cursor = cr_size_we
			
			if (mouse_left_pressed)
			{
				window_busy = "uveditorresize"
				uv_editor_resize = setting_uv_editor_size
			}
		}
		
		uv_editor_draw(view_area_x, view_area_y, view_area_width, view_area_height)
		
		// Set view for viewport
		if (setting_uv_editor_location = "bottom")
		{
			draw_gradient(view_area_x, view_area_y, view_area_width, shadow_size, c_black, shadow_alpha, shadow_alpha, 0, 0)
			
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_y = panel_area_y
			view_area_width = viewwid
			view_area_height = round(panel_area_height * (1 - setting_uv_editor_size))
		}
		else if (setting_uv_editor_location = "top")
		{
			draw_gradient(view_area_x, view_area_y + view_area_height - shadow_size, view_area_width, shadow_size, c_black, 0, 0, shadow_alpha, shadow_alpha)
			
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_y = panel_area_y + ceil(panel_area_height * (1 - setting_uv_editor_size))
			view_area_width = viewwid
			view_area_height = ceil(panel_area_height * setting_uv_editor_size)
		}
		else if (setting_uv_editor_location = "left")
		{
			draw_gradient(view_area_x + view_area_width - shadow_size, view_area_y, shadow_size, view_area_height, c_black, 0, shadow_alpha, shadow_alpha, 0)
			
			view_area_x = view_area_x + view_area_width
			view_area_y = panel_area_y
			view_area_width = round(setting_uv_editor_size * (viewwid))
			view_area_height = panel_area_height
		}
		else if (setting_uv_editor_location = "right")
		{
			draw_gradient(view_area_x, view_area_y, shadow_size, view_area_height, c_black, shadow_alpha, 0, 0, shadow_alpha)
			
			var wid = (viewwid);
			
			view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
			view_area_y = panel_area_y
			view_area_width = round((1 - setting_uv_editor_size) * wid)
			view_area_height = panel_area_height
		}
	}
	else
	{
		view_area_x = panel_area_x + panel_map[?"left"].size_real_ani + panel_map[?"left_secondary"].size_real_ani
		view_area_y = panel_area_y
		view_area_width = viewwid
		view_area_height = panel_area_height
	}
	
	// Draw views
	view_draw(view_main)
	
	// Resize
	if (resizemouseon)
	{
		if (setting_uv_editor_location = "top" || setting_uv_editor_location = "bottom")
			mouse_cursor = cr_size_ns
		else
			mouse_cursor = cr_size_we
	}
	
	// Add shortcut
	if (resizemouseon || window_busy = "uveditorresize")
		shortcut_bar_state = "uveditorresize"
}
