/// draw_menu_button(x, y, width, height)
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var xx, yy, wid, hei;
var mouseon;
xx = argument0
yy = argument1
wid = argument2
hei = argument3

mouseon = app_mouse_box(xx, yy, wid, hei) && content_mouseon

if (mouseon)
	mouse_cursor = cr_handpoint
	
microani_set("menu", null, mouseon, mouseon && mouse_left, menu_open)

if (menu_open || mcroani_arr[e_mcroani.ACTIVE_LINEAR] > 0)
{
	var frame = floor((sprite_get_number(spr_menu_open) - 1) * mcroani_arr[e_mcroani.ACTIVE_LINEAR]);
	draw_image(spr_menu_open, frame, xx + wid/2, yy + wid/2, 1, 1, c_neutral50, a_neutral50)
	tip_set(text_get("tooltipclosemenu"), xx, yy, wid, hei)
}
else
{
	var frame = floor((sprite_get_number(spr_menu_hover) - 1) * mcroani_arr[e_mcroani.HOVER_LINEAR]);
	draw_image(spr_menu_hover, frame, xx + wid/2, yy + wid/2, 1, 1, c_neutral50, a_neutral50)
	tip_set(text_get("tooltipopenmenu"), xx, yy, wid, hei)
}

microani_update(mouseon, mouseon && mouse_left, menu_open, false)

if (mouse_left_released && mouseon)
	menu_open = !menu_open
