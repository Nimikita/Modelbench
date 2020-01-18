/// tab_settings_graphics()

// Blocky bending
tab_control_switch()
draw_switch("settingsgraphicsblockybending", dx, dy, setting_blocky_bending, action_setting_blocky_bending, false, "settingsgraphicsblockybendinghelp")
tab_next()

// Wind
tab_control_switch()
draw_button_collapse("settinggraphicswind", !setting_collapse_wind, action_collapse_wind, !setting_wind)
draw_switch("settingsgraphicswind", dx, dy, setting_wind, action_setting_wind, true)
tab_next()

if (setting_wind && !setting_collapse_wind)
{
	tab_control_meter()
	draw_meter("settingsgraphicswindspeed", dx, dy, dw, round(setting_wind_speed * 100), 48, 0, 200, 45, 1, tab.graphics.tbx_wind_speed, action_setting_wind_speed)
	tab_next()
	
	tab_control_meter()
	draw_meter("settingsgraphicswindstrength", dx, dy, dw, setting_wind_strength, 48, 0, 8, .5, 0.05, tab.graphics.tbx_wind_strength, action_setting_wind_strength)
	tab_next()
	
	draw_divide(dx, dy, dw)
	dy += 8
}

// Modeling SSAO
tab_control_switch()
draw_switch("settingsgraphicsmodelingssao", dx, dy, setting_modeling_ssao, action_setting_modeling_ssao, true)
tab_next()

// Modeling lighting
tab_control_switch()
draw_switch("settingsgraphicslighting", dx, dy, setting_lighting, action_setting_lighting, true)
tab_next()
