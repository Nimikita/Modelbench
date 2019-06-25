/// draw_textfield_num(name, x, y, width, value, multiplier, min, max, default, snap, textbox, script, [disabled])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg value
/// @arg multiplier
/// @arg min
/// @arg max
/// @arg default
/// @arg snap
/// @arg textbox
/// @arg script
/// @arg [disabled]

var name, xx, yy, wid, value, mul, minval, maxval, def, snapval, tbx, script, disabled;
var update, capwidth, hei;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
value = argument[4]
mul = argument[5]
minval = argument[6]
maxval = argument[7]
def = argument[8]
snapval = argument[9]
tbx = argument[10]
script = argument[11]
disabled = false

if (argument_count > 12)
	disabled = argument[12]

hei = 28

if (xx + wid < content_x || xx > content_x + content_width || yy + hei < content_y || yy > content_y + content_height)
	return 0

draw_set_font(font_emphasis)
capwidth = string_width(text_get(name)) + 10

if (draw_inputbox(name, xx + capwidth, yy, wid, string(def), tbx, null, disabled))
	script_execute(script, clamp(snap(string_get_real(tbx.text, 0), snapval), minval, maxval), false)

// Use microanimation from inputbox to determine color
var labelcolor, labelalpha;
labelcolor = merge_color(c_neutral50, c_accent, mcroani_arr[e_mcroani.ACTIVE])
labelcolor = merge_color(labelcolor, c_neutral30, mcroani_arr[e_mcroani.DISABLED])

labelalpha = lerp(a_neutral50, 1, mcroani_arr[e_mcroani.ACTIVE])
labelalpha = lerp(labelalpha, a_neutral30, mcroani_arr[e_mcroani.DISABLED])

draw_box_hover(xx + capwidth, yy, wid, hei, max(mcroani_arr[e_mcroani.HOVER], mcroani_arr[e_mcroani.ACTIVE]) * (1 - mcroani_arr[e_mcroani.DISABLED]))

draw_label(text_get(name), xx, yy + 21, fa_left, fa_bottom, labelcolor, labelalpha, font_emphasis)

// Drag
if (app_mouse_box(xx, yy, capwidth, hei) && content_mouseon && window_focus != string(tbx) && !disabled)
{
	mouse_cursor = cr_size_we
	
	if (mouse_left_pressed)
		window_busy = name + "press"
	
	// Reset to 0
	if (mouse_right_pressed && def != no_limit)
	{
		window_focus = name
		script_execute(script, clamp(snap(def, snapval), minval, maxval), 0)
	}
}

// Textbox press
if (app_mouse_box(xx + capwidth, yy, wid, hei) && content_mouseon && window_focus != string(tbx) && !disabled)
{
	if (mouse_left_pressed)
	{
		tbx.text = string_decimals(value)
		window_focus = string(tbx)
		window_busy = ""
	}
}

// Mouse pressed
if (window_busy = name + "press")
{
	mouse_cursor = cr_size_we
	
	if (mouse_dx != 0)
	{
		dragger_drag_value = value
		window_busy = name + "drag" // Start dragging
	}
}

// Is dragging
if (window_busy = name + "drag")
{ 
	mouse_cursor = cr_size_we
	dragger_drag_value += mouse_dx * mul

	var d = clamp(snap(dragger_drag_value, snapval), minval, maxval) - value;
	if (d <> 0)
		script_execute(script, d, true)
	
	if (!mouse_left)
	{
		window_busy = ""
		app_mouse_clear()
	}
}
