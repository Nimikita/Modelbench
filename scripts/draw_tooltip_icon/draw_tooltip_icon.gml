/// draw_tooltip_icon(name, x, y, icon, text)
/// @arg name
/// @arg x
/// @arg y
/// @arg icon
/// @arg text

var name, xx, yy, icon, text;
var mouseon;
name = argument0
xx = argument1
yy = argument2
icon = argument3
text = argument4

mouseon = app_mouse_box(xx - 10, yy - 10, 20, 20) && content_mouseon
microani_set(name + "tooltip", null, mouseon, false, false)

draw_image(spr_icons, icon, xx, yy, 1, 1, merge_color(c_text_tertiary, c_text_secondary, mcroani_arr[e_mcroani.HOVER]), lerp(a_text_tertiary, a_text_secondary, mcroani_arr[e_mcroani.HOVER]))
tip_set(text, xx - 10, yy - 10, 20, 20)

microani_update(mouseon, false, false)
