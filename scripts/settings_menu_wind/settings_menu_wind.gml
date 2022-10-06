/// settings_menu_wind()

function settings_menu_wind()
{
	var capwid = text_caption_width("settingsmenuwindspeed", "settingsmenuwindstrength");
	capwid = max(180, capwid + 48 + dragger_width)
	
	dx = content_x + 10
	dy = content_y + 8
	dw = content_width - 20
	dh = content_height - 16
	
	tab_control_meter()
	draw_meter("settingsmenuwindspeed", dx, dy, dw, round(setting_wind_speed * 100), 48, 0, 200, 45, 1, tbx_wind_speed, action_setting_wind_speed)
	tab_next()
	
	tab_control_meter()
	draw_meter("settingsmenuwindstrength", dx, dy, dw, setting_wind_strength, 48, 0, 8, .5, 0.05, tbx_wind_strength, action_setting_wind_strength)
	tab_next()
	
	settings_menu_w = capwid
	settings_menu_h = dy - content_y 
}
