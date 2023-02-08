/// window_draw_startup()

function window_draw_startup()
{
	content_x = 0
	content_y = 0
	content_width = window_width
	content_height = window_height
	content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !toast_mouseon && !context_menu_mouseon
	
	// Draw background
	var headersize = 144;
	draw_clear_alpha(c_level_middle, 1)
	draw_pattern(0, headersize, window_width, window_height - headersize)
	
	// Header
	draw_box(0, 0, window_width, headersize, false, c_level_top, 1)
	draw_divide(0, headersize, window_width)
	
	// Logo
	draw_sprite(spr_logo, 0, window_width / 2, headersize/2)
	
	// Version
	draw_button_text(text_get("startupversion", modelbench_version_full), (window_width / 2) + 259, floor((headersize/2) + (sprite_get_height(spr_logo)/2)) + 3, popup_switch, popup_about)
	
	dy = headersize
	dw = min(window_width - 48, 1008)
	
	// Recover model
	if (model_recover_show)
	{
		dy += 8
		
		dx = (window_width/2) - (dw/2)
		draw_outline(dx, dy, dw, 128, 1, c_accent, a_accent)
		draw_dropshadow(dx, dy, dw, 128, c_black, 1)
		
		draw_label(text_get("startupmodeldetected"), dx + 16, dy + 16, fa_left, fa_top, c_accent, a_accent, font_heading_big)
		
		draw_label(text_get("startupmodeldetecteddesc"), dx + 16, dy + 64, fa_left, fa_top, c_text_main, a_text_main, font_value)
		
		draw_button_label("startuprecovermodel", dx + dw - 16, (dy + 128) - (32 + 16), null, null, e_button.PRIMARY, model_recover, fa_right)
		
		dy += 128 + 8
	}
	
	dy += 48
	
	// No recent projects text
	if (ds_list_size(recent_list) = 0)
	{
		draw_label(text_get("recentnone"), window_width / 2, dy, fa_center, fa_middle, c_accent, 1, font_heading_big)
		dy += 48
	}
	
	// Draw buttons
	var newmodelwidth, browsewidth, centerx;
	newmodelwidth = string_width_font(text_get("startupnewmodel"), font_button) + 52
	browsewidth = string_width_font(text_get("startupbrowse"), font_button) + 52
	centerx = round((window_width / 2) - ((browsewidth + 24 + newmodelwidth + 24) / 2))
	
	if (recent_list_amount > 0)
		dx = (window_width / 2) + (dw / 2) - 24
	else
		dx = centerx + (browsewidth + 24 + newmodelwidth)
	
	// New model
	draw_settings_button("startupnewmodeloptions", dx, dy, 24, 32, true)
	dx -= newmodelwidth
	draw_button_label("startupnewmodel", dx, dy, null, icons.FILE, e_button.PRIMARY, model_create)
	
	if (recent_list_amount > 0)
		dx -= 12 + browsewidth
	else
		dx = centerx 
	
	// Browse
	draw_button_label("startupbrowse", dx, dy, browsewidth, icons.FOLDER, e_button.SECONDARY, model_load)
	
	// Show recent models
	if (recent_list_amount > 0)
	{
		// Recent model grid/list button
		dx -= (12 + 28)
		
		dx = (window_width / 2) - (dw / 2)
		
		// Recent models label
		draw_label(text_get("startuprecentmodels"), dx, dy + 16, fa_left, fa_middle, c_accent, 1, font_heading)
		dy += 72
		
		var listheight = 28 + min(window_height - dy, (min(recent_list_amount, 8) * 44));
		tab_control(listheight)
		draw_recent(dx, dy, dw, listheight)
		tab_next()
	}
	else
	{
		// Ashley splash
		var midx, midy;
		midx = snap(window_width / 2, 2)
		midy = snap(192 + ((window_height - 192) / 1.75), 2)
		
		// Only draw splash if it fits well on screen
		if ((midy + (sprite_get_height(spr_ashley_splash) / 1.75)) < (window_height - 50))
			draw_image(spr_ashley_splash, 0, midx, midy)
	}
}
