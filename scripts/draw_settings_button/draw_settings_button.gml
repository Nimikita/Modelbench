/// draw_settings_button(name, x, y, width, height, [primary_style], [script])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg [primary_style
/// @arg [script]]
/// @desc Draw a drop down button that reveals settings when pressed.

var name, xx, yy, width, height, primary, script;
name = argument[0]
xx = argument[1]
yy = argument[2]
width = argument[3]
height = argument[4]
primary = false
script = null

if (argument_count > 5)
	primary = argument[5]

if (argument_count > 6)
	script = argument[6]

var mouseon, mouseclick;
mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon
mouseclick = mouseon && mouse_left

if (mouseon)
	mouse_cursor = cr_handpoint

microani_set(name, null, mouseon, mouseclick, false)

// Open menu
if (mouseon && mouse_left_released)
{
	window_busy = "settingsmenu"
	app_mouse_clear()
	
	settings_menu_name = name
	settings_menu_ani = 0
	settings_menu_ani_type = "show"
	
	// Init
	settings_menu_primary = primary
	settings_menu_x = xx + ((width/2) * settings_menu_primary)
	settings_menu_y = yy + height + (2 * settings_menu_primary)
	
	// Primary style
	if (script)
	{
		settings_menu_script = script
		settings_menu_h = 0
	}
	else
	{
		settings_menu_list = list_init(settings_menu_name)
		settings_menu_amount = ds_list_size(settings_menu_list.item)
		settings_menu_w = settings_menu_list.width
	
		if ((settings_menu_x + (settings_menu_w/2)) > window_width)
			settings_menu_x += window_width - (settings_menu_x + (settings_menu_w/2))
	}
}

var menuactive, buttoncolor, buttonalpha;
menuactive = (settings_menu_name = name)

if (primary)
{
	buttoncolor = merge_color(c_accent, c_accent_hover, mcroani_arr[e_mcroani.HOVER] * (1 - mcroani_arr[e_mcroani.PRESS]))
	buttoncolor = merge_color(buttoncolor, c_accent_pressed, mcroani_arr[e_mcroani.PRESS])
	buttonalpha = lerp(1, a_accent_hover, mcroani_arr[e_mcroani.HOVER] * (1 - mcroani_arr[e_mcroani.PRESS]))
	buttonalpha = lerp(buttonalpha, a_accent_pressed, mcroani_arr[e_mcroani.PRESS])
	
	// Button background
	draw_box(xx, yy, width, height, false, buttoncolor, buttonalpha)
	
	// Bevel shading
	draw_box_bevel(xx, yy, width, height, 1)
	
	// Icon
	draw_image(spr_arrow_up_down_ani, mcroani_arr[e_mcroani.ACTIVE] * 15, xx + width/2, yy + height/2, 1 , 1, c_background, 1)
	
	// Accent accent hover outline
	draw_box_hover(xx, yy, width, height, mcroani_arr[e_mcroani.HOVER])
	
	microani_update(mouseon || menuactive, mouseclick || menuactive, menuactive)
}
else
{
	buttoncolor = merge_color(c_text_tertiary, c_text_secondary, min(1, mcroani_arr[e_mcroani.PRESS] + mcroani_arr[e_mcroani.ACTIVE]))
	buttonalpha = lerp(a_text_tertiary, a_text_secondary, min(1, mcroani_arr[e_mcroani.PRESS] + mcroani_arr[e_mcroani.ACTIVE]))
	
	// Button background
	draw_box(xx, yy, width, height, false, c_background_secondary, mcroani_arr[e_mcroani.ACTIVE])
	
	// Icon
	draw_image(spr_chevrons, chevrons.DOWN, xx + width/2, yy + height/2, 1 , 1, buttoncolor, buttonalpha)
	
	microani_update(mouseon, mouseclick || menuactive, menuactive)
}

// Accent accent hover outline
draw_box_hover(xx, yy, width, height, mcroani_arr[e_mcroani.HOVER])
