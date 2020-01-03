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

var labelcolor, labelalpha, iconcolor, iconalpha;
labelcolor = merge_color(c_text_main, c_accent, mcroani_arr[e_mcroani.ACTIVE])
labelcolor = merge_color(labelcolor, c_accent, mcroani_arr[e_mcroani.PRESS])
labelcolor = merge_color(labelcolor, c_text_tertiary, mcroani_arr[e_mcroani.DISABLED])

labelalpha = lerp(a_text_main, 1, mcroani_arr[e_mcroani.ACTIVE])
labelalpha = lerp(labelalpha, 1, mcroani_arr[e_mcroani.PRESS])
labelalpha = lerp(labelalpha, a_text_tertiary, mcroani_arr[e_mcroani.DISABLED])


iconcolor = merge_color(c_text_tertiary, c_accent, mcroani_arr[e_mcroani.ACTIVE])
iconcolor = merge_color(iconcolor, c_accent, mcroani_arr[e_mcroani.PRESS])
iconcolor = merge_color(iconcolor, c_text_tertiary, mcroani_arr[e_mcroani.DISABLED])

iconalpha = lerp(a_text_tertiary, 1, mcroani_arr[e_mcroani.ACTIVE])
iconalpha = lerp(iconalpha, 1, mcroani_arr[e_mcroani.PRESS])
iconalpha = lerp(iconalpha, a_text_tertiary, mcroani_arr[e_mcroani.DISABLED])

draw_box(xx, yy, wid, hei, false, c_overlay, a_overlay * clamp(mcroani_arr[e_mcroani.ACTIVE] + mcroani_arr[e_mcroani.HOVER], 0, 1))
draw_box(xx, yy, wid, hei, false, c_accent_overlay, a_accent_overlay * mcroani_arr[e_mcroani.PRESS])


draw_label(text_get(name), xx + 44, yy + hei/2, fa_left, fa_center, labelcolor, labelalpha, font_value)
draw_image(spr_icons, icon, xx + 22, yy + hei/2, 1, 1, iconcolor, iconalpha)

if (arrow)
	draw_image(spr_icons, icons.ARROW_RIGHT_SMALL, xx + wid - 22, yy + hei/2, 1, 1, iconcolor, iconalpha)

microani_update(mouseon, mouseon && mouse_left, value || (mouseon && mouse_left_released), disabled)

if (mouseon && mouse_left_released)
{
	if (script != null)
		script_execute(script)
	
	return true
}