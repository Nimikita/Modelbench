/// snackbar_draw_action(name, x, y, height, script, value, snackbar)
/// @arg name
/// @arg x
/// @arg y
/// @arg height
/// @arg script
/// @arg value
/// @arg snackbar

function snackbar_draw_action(name, xx, yy, hei, script, value, snackbar)
{
	var mouseon, color, alpha;
	
	if (text_exists(name))
		name = text_get(name)
	
	mouseon = app_mouse_box(xx, yy, string_width_font(name, font_button), 18)
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set("snackbaraction" + string(snackbar), script, mouseon, mouseon && mouse_left, false)
	
	color = merge_color(c_text_secondary, c_text_main, microani_arr[e_microani.HOVER])
	color = merge_color(color, c_accent, microani_arr[e_microani.PRESS])
	
	alpha = lerp(a_text_secondary, a_text_main, microani_arr[e_microani.HOVER])
	alpha = lerp(alpha, 1, microani_arr[e_microani.PRESS])
	
	draw_label(name, xx, yy + hei/2, fa_left, fa_center, color, alpha, font_button)
	
	microani_update(mouseon, mouseon && mouse_left, false)
	
	if (mouseon && mouse_left_released)
	{
		snackbar_script = script
		snackbar_script_value =value
	}
}
