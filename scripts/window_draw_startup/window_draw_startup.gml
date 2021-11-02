/// window_draw_startup()

content_x = 0
content_y = 0
content_width = window_width
content_height = window_height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height) && !popup_mouseon && !snackbar_mouseon && !context_menu_mouseon

// Draw background
draw_clear_alpha(c_background, 1)
draw_box(0, 0, window_width, 192, false, c_overlay, a_overlay)

var pattern = (setting_theme = theme_light ? 0 : 1);
draw_image(spr_startup_left, pattern, 0, 0)
draw_image(spr_startup_right, pattern, window_width, 0)

// Logo
draw_sprite(spr_logo, 0, window_width / 2, 96)

// Version
draw_button_text(text_get("startupversion", modelbench_version_full), (window_width / 2) + 245, 130, popup_show, popup_about)

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
draw_settings_button("startupnewmodeloptions", dx, dy, 24, 36, true)
dx -= newmodelwidth
draw_button_primary("startupnewmodel", dx, dy, newmodelwidth, model_create, icons.NEW_FILE)

if (recent_list_amount > 0)
	dx -= 12 + browsewidth
else
	dx = centerx 

// Browse
draw_button_secondary("startupbrowse", dx, dy, browsewidth, model_load, icons.OPEN_FILE)

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
