/// draw_button_color(name, x, y, color, default, script)
/// @arg name
/// @arg x
/// @arg y
/// @arg color
/// @arg default
/// @arg script

var name, xx, yy, color, def, script;
var wid, hei, mouseon, mouseclick;
name = argument0
xx = argument1
yy = argument2
color = argument3
def = argument4
script = argument5

wid = dw
hei = 28
mouseon = app_mouse_box(xx, yy, 28, 28) && content_mouseon
mouseclick = mouseon && mouse_left

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set(name, script, mouseon, mouseclick, popup = popup_colorpicker && popup_colorpicker.value_name = "settingsaccentcolor")

// Draw button background
draw_box(xx, yy, 28, 28, false, color, 1)

var buttoncolor, buttonalpha;
buttoncolor = merge_color(c_white, c_black, mcroani_arr[e_mcroani.PRESS])
buttonalpha = lerp(0, .17, mcroani_arr[e_mcroani.HOVER] * (1 - mcroani_arr[e_mcroani.PRESS]))
buttonalpha = lerp(buttonalpha, .20, mcroani_arr[e_mcroani.PRESS])

draw_box(xx, yy, 28, 28, false, buttoncolor, buttonalpha)
draw_outline(xx + 2, yy + 2, 24, 24, 2, test(color_get_lum(color) > 150, c_black, c_white), a_neutral20)

// Colorpicker icon
var iconcolor, iconalpha;
iconcolor = test(color_get_lum(color) > 150, c_black, c_white)
iconalpha = test(color_get_lum(color) > 150, 0.5, 1)
draw_image(spr_icons, e_icon.eyedropper, xx + 14, yy + 14, 1, 1, iconcolor, iconalpha * max(mcroani_arr[e_mcroani.HOVER], mcroani_arr[e_mcroani.PRESS], mcroani_arr[e_mcroani.ACTIVE]))

// Hover effect
draw_box_hover(xx, yy, 28, 28, mcroani_arr[e_mcroani.HOVER])

draw_label(text_get(name), xx + 28 + 12, yy + 14, fa_left, fa_middle, lerp(c_neutral50, c_neutral30, mcroani_arr[e_mcroani.DISABLED]), lerp(a_neutral50, a_neutral30, mcroani_arr[e_mcroani.DISABLED]), font_emphasis)

microani_update(mouseon, mouseclick, popup = popup_colorpicker && popup_colorpicker.value_name = name)

if (mouseon && mouse_left_released)
	popup_colorpicker_show(name, color, def, script)
