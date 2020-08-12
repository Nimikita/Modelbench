/// settings_menu_snap()

var capwid = text_caption_width("settingsmenusnapmove", "settingsmenusnaprotate", "settingsmenusnapscale", "settingsmenusnapuv", "settingsmenusnapabsolute");
capwid = max(180, capwid + 64)

dx = content_x + 10
dy = content_y + 8
dw = content_width - 20
dh = content_height - 16

tab_control(28)
draw_textfield_num("settingsmenusnapmove", dx, dy, 64, setting_snap_size_position, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_position, action_setting_snap_size_position, false, true)
tab_next()

tab_control(28)
draw_textfield_num("settingsmenusnaprotate", dx, dy, 64, setting_snap_size_rotation, 0.01, snap_min, no_limit, 15, snap_min, tbx_snap_size_rotation, action_setting_snap_size_rotation, false, true)
tab_next()

tab_control(28)
draw_textfield_num("settingsmenusnapscale", dx, dy, 64, setting_snap_size_scale, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_scale, action_setting_snap_size_scale, false, true)
tab_next()

tab_control(28)
draw_textfield_num("settingsmenusnapuv", dx, dy, 64, setting_snap_size_uv, 0.01, snap_min, no_limit, 1, snap_min, tbx_snap_size_uv, action_setting_snap_size_uv, false, true)
tab_next()

draw_divide(content_x, dy, content_width)
dy += 8

tab_control_switch()
draw_switch("settingsmenusnapabsolute", dx, dy, setting_snap_absolute, action_setting_snap_absolute, false)
tab_next()

settings_menu_w = capwid
settings_menu_h = dy - content_y 
toolbar_viewport_alpha_goal = 1
