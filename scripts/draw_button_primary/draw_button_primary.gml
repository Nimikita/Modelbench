/// draw_button_primary(name, x, y, width, script, [icon, [anchor]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg script
/// @arg [icon
/// @arg [anchor]]

function draw_button_primary()
{
	var name, xx, yy, width, height, script, icon, anchor;
	name = argument[0]
	xx = argument[1]
	yy = argument[2]
	width = argument[3]
	height = 28
	script = argument[4]
	icon = null
	anchor = fa_left
	
	if (argument_count > 5)
		icon = argument[5]
	
	if (argument_count > 6)
		anchor = argument[6]
	
	if (yy > content_y + content_height || yy + height < content_y)
		return 0
	
	draw_set_font(font_button)
	
	var textwidth = string_width(text_get(name)) + 28;
	width = textwidth
	
	if (icon != null)
	{
		width += 28
		height = 36
	}
	
	// Set anchor
	if (anchor = fa_center)
		xx = xx + (dw/2) - (width/2)
	else if (anchor = fa_right)
		xx = xx + dw - width
	
	var mouseon, mouseclick;
	mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
	mouseclick = mouseon && mouse_left
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set(name, script, mouseon, mouseclick, false)
	
	// Draw button background
	var buttoncolor, buttonalpha;
	buttoncolor = merge_color(c_accent, c_accent_hover, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
	buttoncolor = merge_color(buttoncolor, c_accent_pressed, microani_arr[e_microani.PRESS])
	buttonalpha = lerp(1, a_accent_hover, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
	buttonalpha = lerp(buttonalpha, a_accent_pressed, microani_arr[e_microani.PRESS])
	
	draw_box(xx, yy, width, height, false, buttoncolor, buttonalpha)	
	
	// Accent accent hover outline
	draw_box_hover(xx, yy, width, height, microani_arr[e_microani.HOVER])
	
	// Bevel shading
	draw_box_bevel(xx, yy, width, height, 1)
	
	var textx, darkcolor, lightcolor, color, alpha;
	textx = xx
	
	if (color_get_lum(c_button_text) > color_get_lum(c_text_main))
	{
		darkcolor = c_text_main
		lightcolor = c_button_text
	}
	else
	{
		darkcolor = c_button_text
		lightcolor = c_text_main
	}
	
	color = (setting_accent < 9 ? c_button_text : (color_get_lum(c_accent) > 135 ? darkcolor : lightcolor))
	alpha = (setting_accent < 9 ? a_button_text : (color_get_lum(c_accent) > 135 ? a_button_text : a_text_main))
	if (icon != null)
		textx += 28
	
	draw_label(text_get(name), textx + textwidth/2, yy + height/2, fa_center, fa_middle, color, alpha)
	
	if (icon != null)
		draw_image(spr_icons, icon, xx + 18, yy + 18, 1, 1, color, 1)
	
	microani_update(mouseon, mouseclick, false)
	
	if (mouseon && mouse_left_released)
	{
		if (script != null)
			script_execute(script)
		
		return true
	}
}
