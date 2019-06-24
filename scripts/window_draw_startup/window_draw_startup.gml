/// window_draw_startup()

content_x = 0
content_y = 0
content_width = window_width
content_height = window_height
content_mouseon = app_mouse_box(content_x, content_y, content_width, content_height)

// Draw background
draw_clear_alpha(c_background, 1)
draw_box(0, 0, window_width, 192, false, c_neutral10, a_neutral10)
draw_image(spr_startup_left, setting_dark_theme, 0, 0)
draw_image(spr_startup_right, setting_dark_theme, window_width, 0)

// Logo
draw_sprite(spr_logo, 0, window_width / 2, 96)

// Version
draw_label("v " + modelbench_version_full, (window_width / 2) + 245, 130, fa_left, fa_bottom, c_neutral50, a_neutral50, font_value)

dx = (window_width / 2) + (996 / 2) - 24
dy = 240
dw = 996

// Recover last session
if (file_exists_lib(temp_model_backup))
{
	var xx;
	xx = (window_width / 2) - (996 / 2)
	
	dy = 192 + 8
	//dw /= 2
	draw_outline(xx, dy, dw, 144, 1, c_neutral20, a_neutral20)
	
	draw_image(spr_icons, e_icon.warning, xx + 20, dy + 22, 1, 1, c_error, 1)
	draw_label(text_get("startuprecovermodelheader"), xx + 36, dy + 22, fa_left, fa_middle, c_error, 1, font_heading)
	
	draw_set_font(font_emphasis)
	draw_label(string_wrap(text_get("startuprecovermodeldesc", text_get("startuprecovermodel")), dw - 16), xx + 8, dy + 40, fa_left, fa_top, c_neutral50, a_neutral50, font_emphasis)
	
	draw_button_primary("startuprecovermodel", xx - 8, dy + 144 - 36 - 8, null, model_recover, e_icon.refresh, fa_right)
	dw = 996
	
	//draw_box(xx, dy, dw, 144, false, c_accent10, a_accent10)
	dy += 160
}

// Draw buttons
var buttonwidth;
buttonwidth = string_width_font(text_get("startupnewmodel"), font_button) + (28 * 2)

// New model
draw_button_options("startupnewmodeloptions", dx, dy, 24, 36)
dx -= buttonwidth
draw_button_primary("startupnewmodel", dx, dy, buttonwidth, model_create, e_icon.new_file)

buttonwidth = string_width_font(text_get("startupbrowse"), font_button) + (28 * 2)
dx -= 12 + buttonwidth

// Browse
draw_button_secondary("startupbrowse", dx, dy, buttonwidth, model_load, e_icon.open_file)

// Recent model grid/list button
dx -= (12 + 28)

if (draw_button_icon("recentlistmode", dx, dy + 4, 28, 28, false, test(recent_display_mode = "grid", e_icon.recent_list, e_icon.recent_grid)))
{
	if (recent_display_mode = "list")
		recent_display_mode = "grid"
	else
		recent_display_mode = "list"
}

// Recent models
dx = (window_width / 2) - (996 / 2)

draw_label(text_get("startuprecentmodels"), dx, dy + 16, fa_left, fa_middle, c_accent, 1, font_heading)
dy += 72

tab_control(500)
draw_recent(dx, dy, dw, 500)
tab_next()
