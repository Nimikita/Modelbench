/// draw_toolbar_button(name, x, y, buttonvalue, value, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg buttonvalue
/// @arg value
/// @arg script

var name, xx, yy, buttonvalue, value, script, width, height;
var pressed;
name = argument0
xx = argument1
yy = argument2
buttonvalue = argument3
value = argument4
script = argument5

draw_set_font(font_button)
width = string_width(text_get(name)) + 16
height = content_height

pressed = false

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon && (window_busy = "")
mouseclick = (mouseon && mouse_left) || (mouseon && mouse_left_released)

microani_set(name, script, mouseon, mouseclick, value = buttonvalue)
name = text_get(name)

if (mouseon)
{
    if (mouse_left || mouse_left_released)
        pressed = true
	
    mouse_cursor = cr_handpoint
}

var ani, color, alpha;
ani = mcroani_arr[e_mcroani.ACTIVE]
color = merge_color(c_text_secondary, c_accent, ani)
alpha = lerp(a_text_secondary, 1, ani)

draw_box(xx, yy, width, height, false, c_accent_overlay, lerp(0, a_accent_overlay, mcroani_arr[e_mcroani.HOVER]))

draw_label(name, xx + width/2, yy + 27, fa_center, fa_bottom, color, alpha)

dx += width + 16

microani_update(mouseon, mouseclick, (value = buttonvalue))

if ((value = buttonvalue) && mouseon)
{
	toolbar_line_x_goal = xx
	toolbar_line_width_goal = width
	
	if (mouse_left)
	{
		toolbar_line_x_goal = xx + 8
		toolbar_line_width_goal = width - 16
	}
}

if ((value = buttonvalue) && !mouseon)
{
	toolbar_line_x_goal = xx + 8
	toolbar_line_width_goal = width - 16
}

// Press
if (pressed && mouse_left_pressed && (program_mode != buttonvalue))
{
	action_toolbar_program_mode(buttonvalue)
	
	toolbar_line_x_goal = xx + 8
	toolbar_line_width_goal = width - 16
	
	return true
}