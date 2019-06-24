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
	return 0
}

panel_area_draw()
toolbar_draw()

menu_draw()
tip_draw()

/*
panel_area_draw()
window_draw_glow()
toolbar_draw()
window_draw_cover()
window_draw_timeline_move()
toolbar_draw_alerts()
if (!bench_show_ani)
	popup_draw()
menu_draw()
if (bench_show_ani)
	popup_draw()
tip_draw()
debug_info_draw()
*/