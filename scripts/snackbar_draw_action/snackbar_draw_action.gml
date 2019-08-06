/// snackbar_draw_action(name, x, y, height, script, value, snackbar)
/// @arg name
/// @arg x
/// @arg y
/// @arg height
/// @arg script
/// @arg value
/// @arg snackbar

var name, xx, yy, hei, script, value, snackbar;
var mouseon, color, alpha;
name = argument0
xx = argument1
yy = argument2
hei = argument3
script = argument4
value = argument5
snackbar = argument6

if (text_exists(name))
	name = text_get(name)

mouseon = app_mouse_box(xx, yy, string_width_font(name, font_button), 18)

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set("snackbaraction" + string(snackbar), script, mouseon, mouseon && mouse_left, false)

color = merge_color(c_text_secondary, c_text_main, mcroani_arr[e_mcroani.HOVER])
color = merge_color(color, c_accent, mcroani_arr[e_mcroani.PRESS])

alpha = lerp(a_text_secondary, a_text_main, mcroani_arr[e_mcroani.HOVER])
alpha = lerp(alpha, 1, mcroani_arr[e_mcroani.PRESS])

draw_label(name, xx, yy + hei/2, fa_left, fa_center, color, alpha, font_button)

microani_update(mouseon, mouseon && mouse_left, false)

if (mouseon && mouse_left_released)
{
	snackbar_script = script
	snackbar_script_value =value
}
