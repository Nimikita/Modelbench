/// draw_settings_button(name, x, y, width, height, [primary_style, [script, [disabled]]])
/// @arg name
/// @arg x
/// @arg y
/// @arg width
/// @arg height
/// @arg [primary_style
/// @arg [script
/// @arg [disabled]]]
/// @desc Draw a drop down button that reveals settings when pressed.

function draw_settings_button()
{
	var name, xx, yy, width, height, primary, script, disabled;
	name = argument[0]
	xx = argument[1]
	yy = argument[2]
	width = argument[3]
	height = argument[4]
	primary = false
	script = null
	disabled = false
	
	if (argument_count > 5)
		primary = argument[5]
	
	if (argument_count > 6)
		script = argument[6]
	
	if (argument_count > 7)
		disabled = argument[7]
	
	var mouseon, mouseclick;
	mouseon = app_mouse_box(xx, yy, width, height) && content_mouseon && !disabled
	mouseclick = mouseon && mouse_left
	
	if (mouseon)
		mouse_cursor = cr_handpoint
	
	microani_set(name, null, mouseon, mouseclick, false)
	
	// Open menu
	if (mouseon && mouse_left_released)
	{
		menu_settings_set(xx + ((width/2) * settings_menu_primary), yy + height + (2 * settings_menu_primary), name, 0)
		
		if (script)
		{
			settings_menu_script = script
			settings_menu_h = 0
		}
		else
		{
			settings_menu_list = list_init(settings_menu_name)
			settings_menu_amount = ds_list_size(settings_menu_list.item)
			settings_menu_w = settings_menu_list.width + 8
			
			if ((settings_menu_x + (settings_menu_w/2)) > window_width)
				settings_menu_x += window_width - (settings_menu_x + (settings_menu_w/2))
		}
	}
	
	var menuactive, buttoncolor, buttonalpha;
	menuactive = (settings_menu_name = name)
	
	if (primary)
	{
		buttoncolor = merge_color(c_accent, c_accent_hover, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
		buttoncolor = merge_color(buttoncolor, c_accent_pressed, microani_arr[e_microani.PRESS])
		buttonalpha = lerp(1, a_accent_hover, microani_arr[e_microani.HOVER] * (1 - microani_arr[e_microani.PRESS]))
		buttonalpha = lerp(buttonalpha, a_accent_pressed, microani_arr[e_microani.PRESS])
		
		// Button background
		draw_box(xx, yy, width, height, false, buttoncolor, buttonalpha)
		
		// Bevel shading
		draw_box_bevel(xx, yy, width, height, 1)
		
		// Icon
		draw_image(spr_arrow_up_down_ani, microani_arr[e_microani.ACTIVE] * 15, xx + width/2, yy + height/2, 1 , 1, c_level_middle, 1)
		
		// Accent accent hover outline
		draw_box_hover(xx, yy, width, height, microani_arr[e_microani.HOVER])
		
		microani_update(mouseon || menuactive, mouseclick || menuactive, menuactive, disabled)
	}
	else
	{
		draw_button_icon(name, xx, yy, width, height, menuactive, icons.CHEVRON_DOWN_TINY, null, disabled)
		microani_update(mouseon, mouseclick, menuactive, disabled)
	}
	
	// Accent accent hover outline
	if (primary)
		draw_box_hover(xx, yy, width, height, microani_arr[e_microani.HOVER])
}
