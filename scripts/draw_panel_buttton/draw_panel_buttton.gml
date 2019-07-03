/// draw_panel_buttton(name, x, y, width, height, value, icon, [arrow, [script, [disabled]]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg value
/// @arg icon
/// @arg [arrow
/// @arg [script
/// @arg [disabled]]]

var name, xx, yy, wid, hei, value, icon, arrow, script, disabled;
var mouseon;
name = argument[0]
xx = argument[1]
yy = argument[2]
wid = argument[3]
hei = argument[4]
value = argument[5]
icon = argument[6]
arrow = false
script = null
disabled = false

if (argument_count > 7)
	arrow = argument[7]

if (argument_count > 8)
	script = argument[8]

if (argument_count > 9)
	disabled = argument[9]

mouseon = app_mouse_box(xx, yy, wid, hei) && content_mouseon && !disabled

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set(name, script, mouseon, mouseon && mouse_left, value || (mouseon && mouse_left) || (mouseon && mouse_left_released))

draw_box(xx, yy, wid, hei, false, c_neutral10, mcroani_arr[e_mcroani.HOVER] * a_neutral10)
draw_box(xx, yy, wid, hei, false, c_accent10, a_accent10 * mcroani_arr[e_mcroani.ACTIVE])

var labelcolor, labelalpha;
labelcolor = merge_color(c_neutral60, c_neutral30, mcroani_arr[e_mcroani.DISABLED])
labelalpha = lerp(a_neutral60, a_neutral30, mcroani_arr[e_mcroani.DISABLED])
draw_label(text_get(name), xx + 70, yy + hei/2, fa_left, fa_center, labelcolor, labelalpha, font_value)

var iconcolor, iconalpha;
iconcolor = merge_color(c_neutral30, c_neutral20, mcroani_arr[e_mcroani.DISABLED])
iconalpha = lerp(a_neutral30, a_neutral20, mcroani_arr[e_mcroani.DISABLED])
draw_image(spr_icons, icon, xx + 38, yy + hei/2, 1, 1, iconcolor, iconalpha)

if (arrow)
	draw_image(spr_icons, e_icon.arrow_right_small, xx + wid - 36, yy + hei/2, 1, 1, iconcolor, iconalpha)

microani_update(mouseon, mouseon && mouse_left, value || (mouseon && mouse_left) || (mouseon && mouse_left_released), disabled)

if (mouseon && mouse_left_released)
{
	if (script != null)
		script_execute(script)
	
	return true
}