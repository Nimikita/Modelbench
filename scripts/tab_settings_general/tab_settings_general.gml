/// tab_settings_general()

// FPS
tab_control_togglebutton()
togglebutton_add("settingsfps30", null, 30, room_speed = 30, action_setting_fps)
togglebutton_add("settingsfps60", null, 60, room_speed = 60, action_setting_fps)
draw_togglebutton("settingsfps", dx, dy)
tab_next()

// Backup models
tab_control_switch()
draw_button_collapse("settingsbackupmodels", !setting_collapse_backup_models, action_collapse_backup_models, !setting_backup)
draw_switch("settingsbackupmodels", dx, dy, setting_backup, action_setting_backup, true)
tab_next()

if (setting_backup && !setting_collapse_backup_models)
{
	tab_control_meter()
	draw_meter("settingsbackupmodelsminutes", dx, dy, dw, setting_backup_time, 48, 1, 10, 2, 1, tab.general.tbx_backup_time, action_setting_backup_time)
	tab_next()
	
	tab_control_meter()
	draw_meter("settingsbackupmodelsamount", dx, dy, dw, setting_backup_amount, 48, 1, 10, 3, 1, tab.general.tbx_backup_amount, action_setting_backup_amount)
	tab_next()
}

// Slow shape generation
tab_control_switch()
draw_switch("settingsslowgeneration", dx, dy, setting_slow_generation, action_setting_slow_generation, false, "settingsslowgenerationhelp")
tab_next()
