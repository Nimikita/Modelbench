/// tab_settings_program()

// FPS
tab_control_togglebutton()
draw_togglebutton("settingsfps", dx, dy, array("settingsfps30", "settingsfps60"), null, array(30, 60), array(action_setting_fps, action_setting_fps), room_speed)
tab_next()

// Backup models
tab_control_switch()
draw_button_collapse("settingsbackupmodels", !setting_collapse_backup_models, action_collapse_backup_models, !setting_backup)
draw_switch("settingsbackupmodels", dx, dy, setting_backup, action_setting_backup)
tab_next()

if (setting_backup && !setting_collapse_backup_models)
{
	tab_control_meter()
	draw_meter("settingsbackupmodelsminutes", dx, dy, dw, setting_backup_time, 48, 1, 10, 2, 1, tab.program.tbx_backup_time, action_setting_backup_time)
	tab_next()
	
	tab_control_meter()
	draw_meter("settingsbackupmodelsamount", dx, dy, dw, setting_backup_amount, 48, 1, 10, 3, 1, tab.program.tbx_backup_amount, action_setting_backup_amount)
	tab_next()
}