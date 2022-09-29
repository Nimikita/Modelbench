/// draw_wheel(name, x, y, color, value, min, max, default, snap, textbox, script, [radius, sprite])
/// @arg name
/// @arg x
/// @arg y
/// @arg color
/// @arg value
/// @arg min
/// @arg max
/// @arg default
/// @arg snap
/// @arg textbox
/// @arg script
/// @arg [radius
/// @arg sprite]

function draw_wheel()
{
	var name, xx, yy, color, value, modval, minval, maxval, def, snapval, tbx, script, rad, sprite;
	var capwid, text, labelx, labely, labelw, labeltextw;
	name = argument[0]
	xx = argument[1]
	yy = argument[2]
	color = argument[3]
	value = argument[4]
	minval = argument[5]
	maxval = argument[6]
	def = argument[7]
	snapval = argument[8]
	tbx = argument[9]
	script = argument[10]
	
	if (argument_count > 11)
	{
		rad = argument[11]
		sprite = argument[12]
	}
	else
	{
		rad = 24
		sprite = spr_control_dial
	}
	
	if (xx + rad < content_x || xx - rad > content_x + content_width || yy + rad < content_y || yy - rad > content_y + content_height)
		return 0
	
	context_menu_area(xx - rad, yy - rad, rad * 2, rad * 2, "contextmenuvalue", value, e_context_type.NUMBER, script, def)
	
	draw_set_font(font_label)
	
	modval = mod_fix(value, 360)
	capwid = string_width(text_get(name) + ":") + 5
	text = string_decimals(value) + tbx.suffix
	
	draw_set_font(font_digits)
	
	labelw = rad
	labeltextw = capwid + string_width(text)
	labelx = xx - (labeltextw/2) + capwid
	
	labely = yy + 36
	
	// Background
	draw_image(sprite, 0, xx, yy, 1, 1, c_border, a_border)
	
	// Bar
	gpu_set_tex_filter(true)
	draw_image(spr_dial_dash, 0, xx, yy, .5, .5, color, 1, value + 45)
	gpu_set_tex_filter(false)
	
	// Dragging
	if (window_busy = name)
	{
		mouse_cursor = cr_handpoint
		
		var angle1, angle2, newval;
		angle1 = point_direction(xx, yy, mouse_x, mouse_y)
		angle2 = point_direction(xx, yy, mouse_previous_x, mouse_previous_y)
		wheel_drag_value += angle_difference_fix(angle1, angle2) * dragger_multiplier
		
		newval = clamp(snap(wheel_drag_value, snapval), minval, maxval)
		script_execute(script, newval - value, true)
		
		if (!mouse_left)
		{
			window_busy = ""
			app_mouse_clear()
		}
	}
	
	// Wheel click
	if (app_mouse_box(xx - rad, yy - rad, rad * 2, rad * 2) && content_mouseon)
	{
		mouse_cursor = cr_handpoint
		
		if (mouse_left_pressed) // Start dragging
		{
			var newval = clamp(snap(value + angle_difference_fix(point_direction(xx, yy, mouse_x, mouse_y), value), snapval), minval, maxval)
			script_execute(script, newval - value, true)
			window_focus = name
			window_busy = name
			wheel_drag_value = newval
		}
	}
}
