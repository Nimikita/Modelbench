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

var name, xx, yy, wid, value, valuewid, minval, maxval, def, snapval, tbx, script, tip;
var hei, linewid, dragval, dragx, dragy, mouseon;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
value = argument[4]
valuewid = argument[5]
minval = argument[6]
maxval = argument[7]
def = argument[8]
snapval = argument[9]
tbx = argument[10]
script = argument[11]

valuewid = 48
hei = 30
//if (xx + wid<content_x || xx > content_x + content_width || yy + hei<content_y || yy > content_y + content_height)
//	return 0

draw_label(text_get(name), xx, yy + 15, fa_left, fa_bottom, c_neutral60, a_neutral60, font_label)
yy += 18

//draw_box(xx, yy, wid, hei, false, c_red, 0.25)

if (argument_count > 13)
	tip = argument[13]
else
	tip = text_get(name + "tip")
	
//tip += "\n" + text_get("metertip")
	
linewid = wid - valuewid
//if (window_focus != string(tbx))
//	tip_set(tip, xx, yy, wid, hei)

mouseon = app_mouse_box(xx - 8, yy, linewid + 16, hei) && content_mouseon

// Click on meter
if (mouseon)
{
	mouse_cursor = cr_handpoint
	if (mouse_left_pressed) // Start dragging
	{
		window_busy = name
		window_focus = name
		meter_drag_value = value
	}
	if (mouse_right_pressed && def != no_limit)
		script_execute(script, def, false)
}

// Type
if (app_mouse_box(xx + linewid, yy, valuewid, hei) && content_mouseon && mouse_left_pressed)
{
	tbx.text = string_decimals(value)
	window_focus = string(tbx)
}

// Dragging
if (window_busy = name)
{
	mouse_cursor = cr_handpoint
	meter_drag_value = clamp(minval + (mouse_x - xx) * (max(1, (maxval - minval)) / linewid), minval, maxval)
	
	var d = snap(meter_drag_value, snapval) - value;
	if (d <> 0)
		script_execute(script, d, true)
		
	if (!mouse_left)
	{
		window_busy = ""
		app_mouse_clear()
	}
}

// Mouse wheel
if (window_busy = "" && window_focus = name && mouse_wheel<>0)
{
	if (snapval = 0)
		script_execute(script, clamp(value - mouse_wheel, minval, maxval) - value, true)
	else
		script_execute(script, clamp(value - mouse_wheel * snapval * 5, minval, maxval) - value, true)
}

// Caption
//draw_label(text_get(name) + ":", xx, yy + hei / 2, fa_left, fa_middle)

// Textbox
if (window_focus = string(tbx))
{
	draw_set_font(font_value)
	var textsize = string_width(tbx.text);
	var suffixsize = string_width(tbx.suffix);
	if (textbox_draw(tbx, xx + wid - textsize - suffixsize, yy + hei / 2 - 8, textsize + suffixsize, 18))
	{
		var tbxval = string_get_real(tbx.text, 0)
		
		tbxval = clamp(tbxval, minval, maxval)
		
		tbxval = snap(tbxval, snapval)
		script_execute(script, tbxval, false)
	}
}
else
	draw_label(string(value) + tbx.suffix, xx + wid, yy + hei / 2, fa_right, fa_middle, c_neutral100, a_neutral100, font_value)

dragval = test(window_busy = name, meter_drag_value, value)
dragx = floor(percent(dragval, minval, maxval) * linewid)
dragy = yy + hei / 2

microani_set(name, script, (window_busy = name) || mouseon, mouseon && mouse_left, false)
microani_update((window_busy = name) || mouseon, mouseon && mouse_left, false)

// Snap markers
var markers = floor((maxval - minval) / snapval);
if (markers <= 32)
{
	for (var i = 0; i < markers + 1; i++)
		draw_line_ext(xx + (linewid * (i / markers)), dragy - 6, xx + (linewid * (i / markers)), dragy + 6, c_neutral20, a_neutral20)
	
	// Snap dragger X
	dragx = snap(floor(percent(dragval, minval, maxval) * linewid), (linewid / markers))
}

// Line
draw_box(xx, dragy - 1, linewid + 1, 2, false, c_neutral60, a_neutral60)
draw_box(xx, dragy - 1, dragx + 1, 2, false, c_accent, 1)

// Dragger
draw_box(xx + dragx - 6, dragy - 10, 12, 20, false, c_accent, 1)
//draw_box(xx + dragx - 6, dragy - 10, 12, 20, false, c_neutral60, a_neutral60)
draw_box_bevel(xx + dragx - 6, dragy - 10, 12, 20, 1)
draw_box_hover(xx + dragx - 6, dragy - 10, 12, 20, mcroani_arr[e_mcroani.HOVER])
