/// window_draw_startup()

content_x = 0
content_y = 0
content_width = window_width
content_height = window_height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)

// Draw background
draw_clear_alpha(c_background, 1)
draw_box(0, 0, window_width, 192, false, c_overlay, a_overlay)

var pattern = test(setting_theme = theme_light, 0, 1);
draw_image(spr_startup_left, pattern, 0, 0)
draw_image(spr_startup_right, pattern, window_width, 0)

// Logo
draw_sprite(spr_logo, 0, window_width / 2, 96)

// Version
draw_label("v " + modelbench_version_full, (window_width / 2) + 245, 130, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_value)

dy = 240
dw = min(window_width - 48, 996)

// No recent models text
if (recent_list_amount = 0)
{
	draw_label(text_get("recentnone"), window_width / 2, dy, fa_center, fa_middle, c_text_tertiary, a_text_tertiary, font_startup)
	dy += 48
}

// Draw buttons
var newmodelwidth, browsewidth, centerx;
newmodelwidth = string_width_font(text_get("startupnewmodel"), font_button) + (28 * 2)
browsewidth = string_width_font(text_get("startupbrowse"), font_button) + (28 * 2)
centerx = round((window_width / 2) - ((browsewidth + 24 + newmodelwidth + 24) / 2))

if (recent_list_amount > 0)
	dx = (window_width / 2) + (dw / 2) - 24
else
	dx = centerx + (browsewidth + 24 + newmodelwidth)

// New model
draw_button_options("startupnewmodeloptions", dx, dy, 24, 36)
dx -= newmodelwidth
draw_button_primary("startupnewmodel", dx, dy, newmodelwidth, model_create, e_icon.new_file)

if (recent_list_amount > 0)
	dx -= 12 + browsewidth
else
	dx = centerx 

// Browse
draw_button_secondary("startupbrowse", dx, dy, browsewidth, model_load, e_icon.open_file)

// Show recent models
if (recent_list_amount > 0)
{
	// Recent model grid/list button
	dx -= (12 + 28)
	
	if (draw_button_icon("recentlistmode", dx, dy + 4, 28, 28, false, test(recent_display_mode = "grid", e_icon.recent_list, e_icon.recent_grid)))
	{
		if (recent_display_mode = "list")
			recent_display_mode = "grid"
		else
			recent_display_mode = "list"
	}
	
	dx = (window_width / 2) - (dw / 2)
	
	// Recent models label
	draw_label(text_get("startuprecentmodels"), dx, dy + 16, fa_left, fa_middle, c_accent, 1, font_heading)
	dy += 72
	
	min(window_height)
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
	if ((midy + (sprite_get_height(ashley_splash) / 1.75)) < (window_height - 50))
	{
		if (current_step < 5 || render_splash_center)
		{
			recent_splash_x = midx
			recent_splash_y = midy
			recent_splash_goal_x = recent_splash_x
			recent_splash_goal_y = recent_splash_y
			render_splash_center = false
		}
		else
		{
			recent_splash_goal_x = midx - ((mouse_x - midx) / 20)
			recent_splash_goal_y = midy - ((mouse_y - midy) / 20)
			recent_splash_x += (recent_splash_goal_x - recent_splash_x) / max(1, 5 / delta)
			recent_splash_y += (recent_splash_goal_y - recent_splash_y) / max(1, 5 / delta)
		}
	
		draw_image(ashley_splash, 1, recent_splash_x, recent_splash_y)
	}
}
