/// draw_button_secondary(name, x, y, width, height, script, [icon])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg script
/// @arg [icon]

var name, xx, yy, width, height, script, icon;
name = argument[0]
xx = argument[1]
yy = argument[2]
width = argument[3]
height = 28
script = argument[4]
icon = null

if (argument_count > 5)
	icon = argument[5]

draw_set_font(font_button)

var textwidth = string_width(text_get(name)) + 28;
width = textwidth

if (icon != null)
{
	width += 28
	height = 36
}

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
mouseclick = mouseon && mouse_left

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set(name, script, mouseon, mouseclick, false)

// Accent hover outline
draw_box_hover(xx, yy, width, height, mcroani_arr[e_mcroani.HOVER])

// Box
/*
var backgroundcolor, backgroundalpha;
backgroundcolor = merge_color(c_accent20, c_accent10, mcroani_arr[e_mcroani.HOVER])
backgroundalpha = lerp(a_accent20, a_accent10, mcroani_arr[e_mcroani.HOVER])
backgroundcolor = merge_color(backgroundcolor, c_accent, mcroani_arr[e_mcroani.PRESS])
backgroundalpha = lerp(backgroundalpha, 1, mcroani_arr[e_mcroani.PRESS])
draw_box(xx, yy, width, height, false, backgroundcolor, backgroundalpha)

var textx = xx;
if (icon != null)
	textx += 28

draw_label(text_get(name), textx + textwidth/2, yy + height/2, fa_center, fa_middle, merge_color(c_accent, c_white, mcroani_arr[e_mcroani.PRESS]), 1)

if (icon != null)
	draw_image(spr_icons, icon, xx + 18, yy + 18, 1, 1, merge_color(c_accent, c_white, mcroani_arr[e_mcroani.PRESS]), 1)
*/
draw_box(xx, yy, width, height, false, c_accent10, a_accent10 * mcroani_arr[e_mcroani.PRESS])
draw_outline(xx + 1, yy + 1, width - 2, height - 2, 1, c_neutral20, a_neutral20 * (1.0 - (mcroani_arr[e_mcroani.HOVER] - mcroani_arr[e_mcroani.PRESS])))

var textx = xx;
if (icon != null)
	textx += 28

draw_label(text_get(name), textx + textwidth/2, yy + height/2, fa_center, fa_middle, c_neutral50, a_neutral50)

if (icon != null)
	draw_image(spr_icons, icon, xx + 18, yy + 18, 1, 1, c_neutral50, a_neutral50)

microani_update(mouseon, mouseclick, false)

if (mouseon && mouse_left_released && script != null)
	script_execute(script)