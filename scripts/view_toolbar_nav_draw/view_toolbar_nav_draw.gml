/// view_toolbar_nav_draw(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

function view_toolbar_nav_draw(barx, bary, barw, barh)
{
	dx = barx
	dy = bary
	dw = barw
	dh = barh
	dy_start = dy
	dx_start = dx
	
	content_mouseon = app_mouse_box(dx, dy, dw, dh) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon
	
	if (dh > dw)
		tip_force_left = true
	
	var busy, buttonsize;
	busy = window_busy
	buttonsize = 28 + 4
	
	window_busy = ""
	
	if (app_mouse_box(dx - 80, dy - 80, dw + 160, dh + 160) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon)
		toolbar_nav_alpha_goal = 1
	else
		toolbar_nav_alpha_goal = .65
	
	window_busy = busy
	
	if (window_busy = "viewzoom" || window_busy = "viewmovecameratoggle" || window_busy = "viewpan")
		toolbar_nav_alpha_goal = 1
	
	draw_set_alpha(toolbar_nav_alpha)
	
	// Background
	draw_box(dx, dy, dw, dh, false, c_level_middle, 1)
	draw_dropshadow(dx, dy, dw, dh, c_black, 1)
	draw_outline(dx, dy, dw, dh, 1, c_border, a_border)
	
	dy += 4
	dx += 4
	
	// Walk navigation toggle
	tip_set_keybind(e_keybind.CAM_WALK)
	if (draw_button_icon("toolwalknav", dx, dy, 28, 28, window_busy = "viewmovecameratoggle", icons.WALK, null, false, "tooltipwalknav"))
	{
		window_focus = string(content_view)
		window_busy = "viewmovecameratoggle"
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
	}
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Zoom
	draw_button_icon("toolzoom", dx, dy, 28, 28, window_busy = "viewzoom", icons.ZOOM, null, false, "tooltipzoom")
	if (current_microani.holding.value && window_busy != "viewzoom")
	{
		window_focus = string(content_view)
		window_busy = "viewzoom"
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
	}
	
	if (dw > dh)
		dx += buttonsize
	else
		dy += buttonsize
	
	// Pan
	draw_button_icon("toolpan", dx, dy, 28, 28, window_busy = "viewpan", icons.PAN, null, false, "tooltippan")
	if (current_microani.holding.value && window_busy != "viewpan")
	{
		window_focus = string(content_view)
		window_busy = "viewpan"
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
	}
	
	draw_set_alpha(1)
	tip_force_left = false
}
