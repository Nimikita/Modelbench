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
	draw_outline(xx + 1, yy + 1, width - 2, height - 2, 1, c_neutral20, a_neutral20)
	draw_box(xx, yy, width, height, false, c_accent, mcroani_arr[e_mcroani.ACTIVE])
	draw_image(spr_icons, e_icon.eyedropper, xx + width/2, yy + height/2, 1, 1, merge_color(c_neutral50, c_background, mcroani_arr[e_mcroani.ACTIVE]), lerp(a_neutral50, 1, mcroani_arr[e_mcroani.ACTIVE]))
}

if (mouseon && mouse_left_pressed)
{
	setting_accent = index
	
	if (index < 9)
	{	
		if (popup = popup_colorpicker && popup_colorpicker.value_name = "settingsaccentcolor")
			popup_close()
		interface_update()
	}
	
	return true
}

microani_update(mouseon, mouseclick, setting_accent = index)
