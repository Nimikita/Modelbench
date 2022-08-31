/// draw_button_color(name, x, y, color, default, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg color
/// @arg default
/// @arg script

function draw_button_color(name, xx, yy, color, def, script)
{
	var w, h, mouseon, mouseclick;
	w = dw
	h = 28
	mouseon = app_mouse_box(xx, yy, 28, 28) && content_mouseon
	mouseclick = mouseon && mouse_left
	
	if (xx + w < content_x || xx > content_x + content_width || yy + h < content_y || yy > content_y + content_height)
		return 0
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	context_menu_area(xx, yy, 28, 28, "contextmenuvalue", color, e_value_type.COLOR, script, def)
	
	microani_set(name, script, mouseon, mouseclick, popup = popup_colorpicker && popup_colorpicker.value_name = "settingsaccentcolor")
	
	// Draw button background
	draw_box(xx, yy, 28, 28, false, color, 1)
	
	var buttoncolor, buttonalpha;
	buttoncolor = merge_color(c_white, c_black, microani_arr[e_microani.PRESS])
	buttonalpha = lerp(0, .17, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
	buttonalpha = lerp(buttonalpha, .20, microani_arr[e_microani.PRESS])
	
	draw_box(xx, yy, 28, 28, false, buttoncolor, buttonalpha)
	draw_outline(xx + 2, yy + 2, 24, 24, 2, (color_get_lum(color) > 150 ? c_black : c_white), a_border)
	
	// Colorpicker icon
	var iconcolor, iconalpha;
	iconcolor = (color_get_lum(color) > 150 ? c_black : c_white)
	iconalpha = (color_get_lum(color) > 150 ? 0.5 : 1)
	draw_image(spr_icons, icons.PICKER, xx + 14, yy + 14, 1, 1, iconcolor, iconalpha * max(microani_arr[e_microani.HOVER], microani_arr[e_microani.PRESS], microani_arr[e_microani.ACTIVE]))
	
	// Hover effect
	draw_box_hover(xx, yy, 28, 28, microani_arr[e_microani.HOVER])
	
	draw_label(text_get(name), xx + 28 + 12, yy + 14, fa_left, fa_middle, lerp(c_text_secondary, c_text_tertiary, microani_arr[e_microani.DISABLED]), lerp(a_text_secondary, a_text_tertiary, microani_arr[e_microani.DISABLED]), font_label)
	
	microani_update(mouseon, mouseclick, popup = popup_colorpicker && popup_colorpicker.value_name = name)
	
	if (mouseon && mouse_left_released)
		popup_colorpicker_show(name, color, def, script)
}
