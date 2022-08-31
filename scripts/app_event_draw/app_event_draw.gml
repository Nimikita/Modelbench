/// app_event_draw()

function app_event_draw()
{
	delta = delta_time / (1000000 / 60)
	draw_event_time_start = current_time
	
	draw_set_font(font_label)
	draw_set_color(c_level_middle)
	
	window_draw()
	draw_event_time = current_time - draw_event_time_start
}
