/// menu_settings_draw()

function menu_settings_draw()
{
	//if (settings_menu_window != window_get_current())
	//	return 0
	
	// Animation
	if (settings_menu_ani_type = "hide") //Hide
	{
		settings_menu_ani -= 0.08 * delta
		if (settings_menu_ani <= 0)
		{
			settings_menu_ani = 0
			settings_menu_name = ""
			settings_menu_ani_type = ""
			window_busy = settings_menu_busy_prev
			context_menu_close()
			list_destroy(settings_menu_list)
			return 0
		}
	}
	else if (settings_menu_ani_type = "show") //Show
	{
		settings_menu_ani += 0.08 * delta
		if (settings_menu_ani >= 1)
		{
			settings_menu_ani = 1
			settings_menu_ani_type = ""
		}
	}
	
	if (settings_menu_name = "")
		return 0
	
	var settingsmenuease = ease(((settings_menu_ani_type = "show") ? "easeoutexpo" : "easeinexpo"), settings_menu_ani);
	
	content_x = settings_menu_x - (round(settings_menu_w/2) * settings_menu_primary)
	content_y = settings_menu_y
	content_width = settings_menu_w
	content_height = (settings_menu_script ? settings_menu_h : (28 * settings_menu_amount))
	
	// Ease position
	if (settings_menu_above && content_y - content_height > 0)
		content_y = ((content_y - content_height) + 16) - (16 * settingsmenuease)
	else
		content_y = ((content_y + settings_menu_button_h) - 16) + (16 * settingsmenuease)
	
	content_y = round(content_y)
	
	// Prepare window state
	if (window_busy = "settingsmenu" && settings_menu_ani_type = "" && settings_menu_ani = 1)
		window_busy = ""
	
	content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)
	
	if (settings_menu_steps < 2)
	{
		if (content_x + content_width > window_width)
		{
			settings_menu_x -= (settings_menu_w - settings_menu_button_w)
		}
		
		draw_set_alpha(0)
	}
	else
		draw_set_alpha(settingsmenuease)
	
	draw_dropshadow(content_x, content_y, content_width, content_height, c_black, settingsmenuease)
	draw_box(content_x, content_y, content_width, content_height, false, c_level_top, 1)
	draw_outline(content_x, content_y, content_width, content_height, 1, c_border, a_border * settingsmenuease, true)
	
	if (settings_menu_script)
	{
		dx = content_x + 12
		dy = content_y + 12
		dw = settings_menu_w - 24
		
		script_execute(settings_menu_script)
		
		dy += 4
		
		if (settings_menu_h_max = null)
			settings_menu_h = dy - content_y
		else
		{
			settings_menu_h = min(dy - content_y, settings_menu_h_max)
			
			if ((dy - content_y) > settings_menu_h_max)
			{
				scrollbar_draw(settings_menu_scroll, e_scroll.VERTICAL, content_x + content_width - 12, content_y, content_height, dy - content_y)
				window_scroll_focus = string(settings_menu_scroll)
			}
		}
	}
	else
	{
		var itemx, itemy;
		itemx = content_x
		itemy = content_y
		
		for (var i = 0; i < settings_menu_amount; i++)
		{
			list_item_draw(settings_menu_list.item[|i], itemx, itemy, content_width, 28, false)
			itemy += 28
		}
	}
	
	// Draw arrow
	if (settings_menu_primary)
	{
		draw_image(spr_tooltip_arrow, 0, settings_menu_x, content_y, 1, 1, c_level_middle, settingsmenuease)
	
		// Highlight arrow with top item
		if (settings_menu_amount > 0 && settings_menu_list.item[|0].hover)
		{
			if (mouse_left)
				draw_image(spr_tooltip_arrow, 0, settings_menu_x, content_y, 1, 1, c_accent_overlay, a_accent_overlay * settingsmenuease)
			else
				draw_image(spr_tooltip_arrow, 0, settings_menu_x, content_y, 1, 1, c_overlay, a_overlay * settingsmenuease)
		}
		
		draw_image(spr_tooltip_arrow, 1, settings_menu_x, content_y, 1, 1, c_border, a_border * settingsmenuease)
	}
	
	draw_set_alpha(1)
	
	// Flip
	if ((content_y + content_height) > window_height)
		settings_menu_above = true
	
	// Check click
	if (settings_menu_ani_type = "" && mouse_left_released && !context_menu_mouseon && (ds_list_size(menu_list) = 0) && (window_focus = "" || window_focus = string(settings_menu_scroll)))
	{
		if (settings_menu_script)
		{
			if (!app_mouse_box(content_x, content_y, content_width, content_height))
			{
				settings_menu_ani = 1
				settings_menu_ani_type = "hide"
				window_busy = "settingsmenu"
				window_focus = ""
				context_menu_close()
			}
		}
		else
		{
			if (!context_menu_mouseon)
			{
				settings_menu_ani = 1
				settings_menu_ani_type = "hide"
				window_busy = "settingsmenu"
				window_focus = ""
				context_menu_close()
			}
		}
	}
	
	settings_menu_steps++
	
	if (window_busy = "" && settings_menu_ani_type != "hide")
		window_busy = "settingsmenu"
}
