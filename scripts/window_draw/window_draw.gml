/// window_draw()

draw_clear(c_background)

if (window_state = "test")
{
	window_draw_testscreen()
	return 0
}


if (window_state = "startup")
{
	window_draw_startup()
}
else
{
	panel_area_draw()
	menu_panel_draw()
	toolbar_draw()
}

window_draw_element_move()
popup_draw()
menu_draw()
button_menu_draw()
window_draw_snackbar()
tip_draw()
context_menu_draw()
debug_draw_info()
