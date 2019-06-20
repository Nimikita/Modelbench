/// draw_switch(name, x, y, active, script, [tip])
/// @arg name
/// @arg x
/// @arg y
/// @arg active
/// @arg script
/// @arg [tip]

var name, xx, yy, active, script, tip;
var switchx, switchy, w, h, caption, mouseon, pressed;
name = text_get(argument[0])
xx = argument[1]
yy = argument[2]
active = argument[3]
script = argument[4]
tip = ""

if (argument_count > 5)
	tip = text_get(argument[5])

caption = text_get(name)

switchx = (xx + dw - 24)
switchy = (yy + (28/2) - 8)
w = dw
h = 28

// Mouse
var mouseon, mouseclick;
mouseon = app_mouse_box(switchx, switchy, 24, 16) && content_mouseon && (window_busy = "")
mouseclick = mouseon && mouse_left

pressed = false

if (mouseon)
{
    if (mouse_left || mouse_left_released)
        pressed = true
	
    mouse_cursor = cr_handpoint
}

// Set micro animation before drawing
microani_set(argument[0], script, mouseon, mouseclick, active)

// Draw background
var color, alpha;
if (setting_dark_theme)
{
	color = c_neutral40
	alpha = a_neutral40
}
else
{
	color = c_neutral60
	alpha = a_neutral60
}

var backgroundcolor = merge_color(color, c_accent, mcroani_arr[e_mcroani.ACTIVE]);
var backgroundalpha = lerp(alpha, 1, mcroani_arr[e_mcroani.ACTIVE]);
draw_box(switchx, switchy, 24, 16, false, backgroundcolor, backgroundalpha)

// Draw button
var buttonx = switchx + 2 + (10 * mcroani_arr[e_mcroani.ACTIVE]);
var buttony = switchy + 2;
var buttoncolor = c_accent10;
var buttonalpha = lerp(0, a_accent10, mcroani_arr[e_mcroani.PRESS]);
draw_box(buttonx, buttony, 10, 12, false, c_white, 1)
draw_box(buttonx, buttony, 10, 12, false, buttoncolor, buttonalpha)
draw_box_bevel(buttonx, buttony, 10, 12, 1, true)

// Draw hover outline
draw_box_hover(switchx, switchy, 24, 16, mcroani_arr[e_mcroani.HOVER])

// Label
draw_label(name, xx, yy + 14, fa_left, fa_middle, c_neutral60, a_neutral60, font_emphasis)

microani_update(mouseon, mouseclick, active)

if (tip != "")
{
	mouseon = app_mouse_box(xx + string_width_font(name, font_emphasis) + 8, yy + 4, 20, 20) && content_mouseon
	microani_set(argument[0] + "help", null, mouseon, false, false)
	
	draw_image(spr_icons, e_icon.help, xx + string_width_font(name, font_emphasis) + 10 + 8, yy + 14, 1, 1, merge_color(c_neutral40, c_neutral60, mcroani_arr[e_mcroani.HOVER]), lerp(a_neutral40, a_neutral60, mcroani_arr[e_mcroani.HOVER]))
	tip_set(text_get(argument[0] + "help"), xx + string_width_font(name, font_emphasis) + 8, yy + 4, 20, 20)
	
	microani_update(mouseon, false, false)
}

// Press
if (pressed && mouse_left_released)
{
	if (script != null)
		script_execute(script, !active)
	
	return true
}