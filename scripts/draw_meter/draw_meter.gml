/// draw_meter(name, x, y, width, value, valuewidth, min, max, default, snap, textbox, script, [tip])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg value
/// @arg valuewidth
/// @arg min
/// @arg max
/// @arg default
/// @arg snap
/// @arg textbox
/// @arg script
/// @arg [tip]

function draw_meter(name, xx, yy, wid, value, valuewid, minval, maxval, def, snapval, tbx, script, tip = "")
{
	var hei, thumbhei, linex, linewid, trackx, trackwid, dragval, dragx, dragy, mouseon, slidermouseon, locked, inputfocus;
	
	thumbhei = 20
	hei = (thumbhei + 24)
	
	locked = (minval = maxval)
	
	if (xx + wid < content_x || xx > content_x + content_width || yy + hei < content_y || yy > content_y + content_height)
		return 0
	
	mouseon = app_mouse_box(xx, yy, wid, hei) && content_mouseon
	slidermouseon = app_mouse_box(xx, yy + 24, wid, thumbhei) && content_mouseon
	
	// Textbox
	microani_set(name, script, false, false, false)
	
	if (draw_inputbox(name + "input", (xx + wid - 80) + 8, yy, 80, 24, string(def) + tbx.suffix, tbx, null, false, false, font_digits, e_inputbox.RIGHT, microani_arr[e_microani.CUSTOM]))
	{
		var val = eval(tbx.text, def);
		val = clamp(snap(val, snapval), minval, maxval)
		
		script_execute(script, val, false)
	}
	
	inputfocus = microani_arr[e_microani.ACTIVE]
	
	// Idle
	if (window_busy = name || (window_busy != name + "inputpress" && window_focus != string(tbx)))
		tbx.text = string_decimals(value)
	
	// Label
	microani_set(name, script, (window_busy = name) || slidermouseon, slidermouseon && mouse_left, false, false, 1, false)
	microani_update(slidermouseon, slidermouseon && mouse_left, window_busy = name, locked, mouseon || (window_busy = name + "inputpress" || window_focus = string(tbx)))
	
	var labelcolor, labelalpha;
	labelcolor = merge_color(c_text_secondary, c_text_main, microani_arr[e_microani.HOVER])
	labelcolor = merge_color(labelcolor, c_accent, max(inputfocus, microani_arr[e_microani.ACTIVE]))
	labelalpha = lerp(a_text_secondary, a_text_main, microani_arr[e_microani.HOVER])
	labelalpha = lerp(labelalpha, a_accent, max(inputfocus, microani_arr[e_microani.ACTIVE]))
	
	draw_set_font(font_label)
	
	var labelshort = string_limit(text_get(name), dw - 80);
	draw_label(labelshort, xx, yy + 12, fa_left, fa_middle, labelcolor, labelalpha)
	
	if (string_width(labelshort) < dw)
		draw_help_circle(tip, xx + string_width(labelshort) + 4, yy + 2, false)
	
	// Slider
	yy += 24
	
	linex = xx
	linewid = wid
	trackx = linex + 6
	trackwid = linewid - 12
	
	context_menu_area(linex, yy, linewid, thumbhei, "contextmenuvalue", value, e_context_type.NUMBER, script, def)
	
	// Click on slider
	if (slidermouseon)
	{
		mouse_cursor = cr_handpoint
		if (mouse_left_pressed) // Start dragging
		{
			window_busy = name
			window_focus = name
			meter_drag_value = value
		}
	}
	
	// Dragging
	if (window_busy = name)
	{
		mouse_cursor = cr_handpoint
		meter_drag_value = clamp(minval + (mouse_x - linex) * (max(1, (maxval - minval)) / linewid), minval, maxval)
		
		var d = snap(meter_drag_value, snapval) - value;
		if (d <> 0)
			script_execute(script, d, true)
		
		if (!mouse_left)
		{
			window_busy = ""
			window_focus = ""
			app_mouse_clear()
		}
	}
	
	dragval = (window_busy = name ? meter_drag_value : value)
	
	if (locked)
		dragx = .5 * linewid
	else
		dragx = floor(percent(dragval, minval, maxval) * trackwid)
	
	dragy = yy + thumbhei / 2
	
	var pos = trackx + dragx - 6;
	
	// Snap markers
	var markers = floor((maxval - minval) / snapval);
	if (markers <= 64 && !locked)
	{
		// Only draw markers if not cramped
		if ((linewid / markers) > 20)
		{
			for (var i = 0; i < markers + 1; i++)
				draw_line_ext(linex + (linewid * (i / markers)), dragy - 6, linex + (linewid * (i / markers)), dragy + 6, c_border, a_border)
		}
		
		// Snap dragger X
		dragx = snap(floor(percent(dragval, minval, maxval) * linewid), (linewid / markers))
		
		// Clamp drag position
		pos = clamp(trackx + dragx - 6, trackx, trackx + trackwid) - 6
	}
	
	// Line
	var color, alpha;
	color = merge_color(c_text_tertiary, c_text_secondary, max(microani_arr[e_microani.HOVER], microani_arr[e_microani.ACTIVE], microani_arr[e_microani.PRESS]))
	color = merge_color(color, c_border, microani_arr[e_microani.DISABLED])
	alpha = lerp(a_text_tertiary, a_text_secondary, max(microani_arr[e_microani.HOVER], microani_arr[e_microani.ACTIVE], microani_arr[e_microani.PRESS]))
	alpha = lerp(alpha, a_border, microani_arr[e_microani.DISABLED])
	
	draw_box(linex + (pos - linex), dragy - 1, linewid - (pos - linex), 2, false, color, alpha)
	
	color = merge_color(c_accent, c_text_tertiary, microani_arr[e_microani.DISABLED])
	alpha = merge_color(a_accent, a_text_tertiary, microani_arr[e_microani.DISABLED])
	draw_box(linex, dragy - 1, pos - linex, 2, false, color, alpha)
	
	// Dragger
	color = merge_color(c_accent, c_accent_hover, microani_arr[e_microani.HOVER])
	color = merge_color(color, c_accent_pressed, max(microani_arr[e_microani.ACTIVE], microani_arr[e_microani.PRESS]))
	color = merge_color(color, c_text_tertiary, microani_arr[e_microani.DISABLED])
	alpha = lerp(1, a_text_tertiary, microani_arr[e_microani.DISABLED])
	
	draw_box(pos, dragy - 10, 12, 20, false, c_level_middle, 1)
	draw_box(pos, dragy - 10, 12, 20, false, color, alpha)
	draw_box_bevel(pos, dragy - 10, 12, 20, 1)
	draw_box_hover(pos, dragy - 10, 12, 20, microani_arr[e_microani.ACTIVE])
}