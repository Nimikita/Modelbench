/// window_draw()

function window_draw()
{
	draw_clear(c_background)
	
	if (window_state = "startup")
	{
		window_draw_startup()
	}
	else
	{
		panel_area_draw()
		shortcut_bar_draw()
		menu_panel_draw()
		toolbar_draw()
	}
	
	window_draw_element_move()
	popup_draw()
	menu_draw()
	settings_menu_draw()
	window_draw_snackbar()
	tip_draw()
	context_menu_draw()
	debug_draw_info()
}
