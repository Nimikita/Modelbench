/// draw_button_text(text, x, y, script, value, [tip, [font]])
/// @arg text
/// @arg x
/// @arg y
/// @arg script
/// @arg value
/// @arg [tip
/// @arg [font]]

var text, xx, yy, script, value, tip,font,  wid, hei, mouseon;
text = argument[0]
xx = argument[1]
yy = argument[2]
script = argument[3]
value = argument[4]
tip = ""
font = font_value

if (argument_count > 5)
	tip = argument[5]
	
if (argument_count > 6)
	font = argument[6]

wid = string_width_font(text, font)
hei = string_height_font(text, font)
mouseon = app_mouse_box(xx, yy - hei, wid, hei)
//context_menu_area(xx, yy - hei, wid, hei, "contextmenuurl", url, e_value_type.NONE, null, null)

draw_label(text, xx, yy, fa_left, fa_bottom, c_accent, a_accent, font)

if (mouseon)
{
	if (!mouse_left)
	{
		mouse_cursor = cr_handpoint
		
		if (tip != "")
			tip_set(tip, xx, yy - hei, wid, hei)
	}
	
	draw_line_ext(xx, yy, xx + wid, yy, c_accent, a_accent)
	
	if (mouse_left_released)
		script_execute(script, value)
}
