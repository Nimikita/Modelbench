/// settings_menu_snap()

function settings_menu_snap()
{
	var capwid = text_caption_width("settingsmenusnapmove", "settingsmenusnaprotate", "settingsmenusnapscale", "settingsmenusnapuv", "settingsmenusnapabsolute");
	capwid = max(180, capwid + dragger_width + 16)
	
	dx = content_x + 10
	dy = content_y + 8
	dw = content_width - 20
	dh = content_height - 16
	
	tab_control_dragger()
	draw_dragger("settingsmenusnapmove", dx, dy, dragger_width, setting_snap_size_position, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_position, action_setting_snap_size_position)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingsmenusnaprotate", dx, dy, dragger_width, setting_snap_size_rotation, 0.01, snap_min, no_limit, 15, snap_min, tbx_snap_size_rotation, action_setting_snap_size_rotation)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingsmenusnapscale", dx, dy, dragger_width, setting_snap_size_scale, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_scale, action_setting_snap_size_scale)
	tab_next()
	
	tab_control_dragger()
	draw_dragger("settingsmenusnapuv", dx, dy, dragger_width, setting_snap_size_uv, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_uv, action_setting_snap_size_uv)
	tab_next()
	
	draw_divide(content_x, dy, content_width)
	dy += 8
	
	tab_control_switch()
	draw_switch("settingsmenusnapabsolute", dx, dy, setting_snap_absolute, action_setting_snap_absolute, "settingsmenusnapabsolutetip")
	tab_next()
	
	settings_menu_w = capwid
	settings_menu_h = dy - content_y 
}
