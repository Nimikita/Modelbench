/// draw_accent_item(x, y, width, height, index)
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg index

var xx, yy, width, height, index;
var mouseon, mouseclick, accent;
xx = argument0
yy = argument1
width = floor(argument2)
height = floor(argument3)
index = argument4

mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
mouseclick = mouseon && mouse_left

if (index < 9)
	accent = test(setting_dark_theme, theme_dark.accent_list[index], theme_light.accent_list[index])
else
	accent = null

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set("accentlistitem" + string(index), null, mouseon, mouseclick, setting_accent = index, 0.5)

if (accent != null)
{
	draw_box(xx, yy, width, height, false, accent, 1)
	draw_image(spr_icons, e_icon.checkmark, xx + width/2, yy + height/2, 1, 1, c_background, mcroani_arr[e_mcroani.ACTIVE])
}
else
{
	draw_outline(xx + 1, yy + 1, width - 1, height - 1, 1, c_neutral20, a_neutral20)
	draw_image(spr_icons, e_icon.eyedropper, xx + width/2, yy + height/2, 1, 1, c_neutral50, a_neutral50)
}

if (mouseon && mouse_left_pressed && index < 9)
{
	setting_accent = index
	interface_update()
}

microani_update(mouseon, mouseclick, setting_accent = index)
