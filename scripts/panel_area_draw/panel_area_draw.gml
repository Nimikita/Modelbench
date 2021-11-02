/// panel_area_draw()

// Set busy if menu is open
var busyprev = window_busy;
if (menu_panel_ani > 0)
{
	busyprev = window_busy
	window_busy = "menupanel"
}

// Calculate area
panel_area_x = 0
panel_area_y = 0
panel_area_width = window_width
panel_area_height = window_height

tab_move_mouseon_panel = null
tab_move_mouseon_position = 0

// Adjust panel size for toolbar
panel_area_y += 36
panel_area_height -= 36

// Adjust panel height for shortcut bar
panel_area_height -= 28 * shortcut_bar_lines

with (obj_panel)
	size_real = size * (tab_list_amount > 0)

// Stop panels overlapping
panel_map[?"left"].size_real -= max(0, panel_map[?"left_secondary"].size_real + panel_map[?"left"].size_real + panel_map[?"right"].size_real + panel_map[?"right_secondary"].size_real - panel_area_width)
panel_map[?"left_secondary"].size_real -= max(0, panel_map[?"left_secondary"].size_real + panel_map[?"right_secondary"].size_real + panel_map[?"right"].size_real - panel_area_width)

// Set max size
panel_map[?"left_secondary"].size_real = min(panel_map[?"left_secondary"].size_real, panel_area_width)
panel_map[?"right_secondary"].size_real = min(panel_map[?"right_secondary"].size_real, panel_area_width)

// Draw views
view_area_draw()

// Draw panels
panel_draw(panel_map[?"left_secondary"])
panel_draw(panel_map[?"right_secondary"])
panel_draw(panel_map[?"left"])
panel_draw(panel_map[?"right"])

// Resizing
if (window_busy = "panelresize")
{
	var resizex;
	var sizesnap = (keyboard_check(vk_control) ? 20 : 1);
	
	if (panel_resize = panel_map[?"left"] || panel_resize = panel_map[?"left_secondary"])
	{
		if (panel_resize = panel_map[?"left"])
			resizex = panel_area_x + panel_map[?"left"].size_real
		else
			resizex = panel_area_x + panel_map[?"left"].size_real + panel_resize.size_real
		
		mouse_cursor = cr_size_we
		panel_resize.size = max(288, snap(panel_resize_size + (mouse_x - mouse_click_x), sizesnap))
	}
	else if (panel_resize = panel_map[?"right"] || panel_resize = panel_map[?"right_secondary"])
	{
		if (panel_resize = panel_map[?"right"])
			resizex = panel_area_x + panel_area_width - panel_resize.size_real
		else
			resizex = panel_area_x + panel_area_width - panel_map[?"right"].size_real - panel_resize.size_real
			
		mouse_cursor = cr_size_we
		panel_resize.size = max(288, snap(panel_resize_size - (mouse_x - mouse_click_x), sizesnap))
	}
	
	tip_set(string(panel_resize.size) + "px", resizex, max(mouse_y, panel_area_y), 0, 0, false)
	
	if (!mouse_left)
		window_busy = ""
}

// Moving
if (window_busy = "tabmove")
{
	panel_move_draw()
	
	// Find panel
	if (tab_move_mouseon_panel = null)
	{
		// Calculate sizes of the boxes to check
		var lefttopw, leftbottomw, righttopw
		lefttopw = view_area_width
		leftbottomw = view_area_width
		righttopw = view_area_width
			
		// Left top
		if (!panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
			lefttopw *= 0.5
		if (!panel_map[?"left_secondary"].size_real)
			lefttopw *= 0.5
			
		// Left bottom
		if (!panel_map[?"right"].size_real || !panel_map[?"right_secondary"].size_real)
			leftbottomw *= 0.5
			
		// Right top
		if (!panel_map[?"left"].size_real || !panel_map[?"left_secondary"].size_real)
			righttopw *= 0.5
		if (!panel_map[?"right_secondary"].size_real)
			righttopw *= 0.5		
		
		if (mouse_x <= view_area_x + lefttopw && !panel_map[?"left"].size_real)
			tab_move_mouseon_panel = panel_map[?"left"]
		else if (mouse_x <= view_area_x + leftbottomw && !panel_map[?"left_secondary"].size_real)
			tab_move_mouseon_panel = panel_map[?"left_secondary"]
		else if (mouse_x >= view_area_x + view_area_width - righttopw && !panel_map[?"right"].size_real)
			tab_move_mouseon_panel = panel_map[?"right"]
		else
			tab_move_mouseon_panel = panel_map[?"right_secondary"]
			
		tab_move_mouseon_panel.glow = min(1, tab_move_mouseon_panel.glow + 0.1 * delta)
	}
	
	// Let it go
	if (!mouse_left)
	{
		panel_tab_list_add(tab_move_mouseon_panel, tab_move_mouseon_position, tab_move)
		window_busy = ""
		
		with (obj_tab)
			glow = 0
			
		with (obj_panel)
		{
			list_glow = 0
			glow = 0
		}
	}
}

// Restore busy state
if (window_busy = "menupanel")
	window_busy = busyprev
