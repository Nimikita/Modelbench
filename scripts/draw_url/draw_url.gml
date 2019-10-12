/// draw_url(text, url, x, y)
/// @arg text
/// @arg url
/// @arg x
/// @arg y

var text, url, xx, yy, wid, hei, mouseon;
text = argument0
url = argument1
xx = argument2
yy = argument3

wid = string_width_font(text, font_value)
hei = string_height_font(text, font_value)
mouseon = app_mouse_box(xx, yy - hei, wid, hei)
context_menu_area(xx, yy - hei, wid, hei, "contextmenuurl", url, e_value_type.NONE, null, null)

draw_label(text, xx, yy, fa_left, fa_bottom, c_accent, a_accent, font_value)

if (mouseon)
{
	if (!mouse_left)
	{
		mouse_cursor = cr_handpoint
		tip_set(url, xx, yy - hei, wid, hei)
	}
	
	draw_line_ext(xx, yy, xx + wid, yy, c_accent, a_accent)
	
	if (mouse_left_released)
		open_url(url)
}
