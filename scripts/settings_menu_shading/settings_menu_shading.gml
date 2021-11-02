/// settings_menu_shading()

var capwid = text_caption_width("settingsmenushadingao", "settingsmenushadinglighting");
capwid = max(180, capwid + 32)

dx = content_x + 10
dy = content_y + 8
dw = content_width - 20
dh = content_height - 16

// Modeling SSAO
tab_control_switch()
draw_switch("settingsmenushadingao", dx, dy, setting_shading_ao, action_setting_shading_ao, true)
tab_next()

// Modeling lighting
tab_control_switch()
draw_switch("settingsmenushadinglighting", dx, dy, setting_shading_lighting, action_setting_shading_lighting, true)
tab_next()

settings_menu_w = capwid
settings_menu_h = dy - content_y 
toolbar_viewport_alpha_goal = 1
