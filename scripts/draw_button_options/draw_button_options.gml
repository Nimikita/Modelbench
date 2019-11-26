/// draw_button_options(name, x, y, width, height)
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height

var name, xx, yy, width, height;
name = argument[0]
xx = argument[1]
yy = argument[2]
width = argument[3]
height = argument[4]

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
mouseclick = mouseon && mouse_left

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set(name, null, mouseon, mouseclick, false)

// Open menu
if (mouseon && mouse_left_released)
{
	window_busy = "buttonmenu"
	app_mouse_clear()
	
	button_menu_name = name
	button_menu_ani = 0
	button_menu_ani_type = "show"
	button_menu_x = xx + width/2
	button_menu_y = yy + height
	
	// Init
	button_menu_list = list_init(button_menu_name)
	button_menu_amount = ds_list_size(button_menu_list.item)
	button_menu_w = button_menu_list.width
	
	if ((button_menu_x + (button_menu_w/2)) > window_width)
		button_menu_x += window_width - (button_menu_x + (button_menu_w/2))
}

// Draw button background
var buttoncolor, buttonalpha;
buttoncolor = merge_color(c_accent, c_accent_hover, mcroani_arr[e_mcroani.HOVER] * (1 - mcroani_arr[e_mcroani.PRESS]))
buttoncolor = merge_color(buttoncolor, c_accent_pressed, mcroani_arr[e_mcroani.PRESS])
buttonalpha = lerp(1, a_accent_hover, mcroani_arr[e_mcroani.HOVER] * (1 - mcroani_arr[e_mcroani.PRESS]))
buttonalpha = lerp(buttonalpha, a_accent_pressed, mcroani_arr[e_mcroani.PRESS])

draw_box(xx, yy, width, height, false, buttoncolor, buttonalpha)

// Accent accent hover outline
draw_box_hover(xx, yy, width, height, mcroani_arr[e_mcroani.HOVER])

// Bevel shading
draw_box_bevel(xx, yy, width, height, 1)

var menuactive = (window_busy = "buttonmenu" && button_menu_name = name);

draw_image(spr_arrow_up_down_ani, mcroani_arr[e_mcroani.ACTIVE] * 15, xx + width/2, yy + height/2, 1 , 1, c_background, 1)

microani_update(mouseon || menuactive, mouseclick || menuactive, menuactive)