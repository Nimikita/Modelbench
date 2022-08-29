/// tab_settings_general()

function tab_settings_general()
{
	// FPS
	tab_control_togglebutton()
	togglebutton_add("settingsfps30", null, 30, room_speed = 30, action_setting_fps)
	togglebutton_add("settingsfps60", null, 60, room_speed = 60, action_setting_fps)
	draw_togglebutton("settingsfps", dx, dy)
	tab_next()
	
	// Feature set
	var text = (setting_feature_set = e_features.MIMODEL ? "settingsfeaturesetmimodel" : "settingsfeaturesetobj");
	var caption = (setting_feature_set = e_features.MIMODEL ? ".mimodel" : ".obj");
	
	tab_control_menu()
	draw_button_menu("settingsfeatureset", e_menu.LIST, dx, dy, dw, 28, setting_feature_set, text_get(text), action_setting_feature_set, false, null, null, caption)
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
		
		draw_divide(dx, dy, dw)
		dy += 8
	}
	
	// Slow shape generation
	tab_control_switch()
	draw_switch("settingsslowgeneration", dx, dy, setting_slow_generation, action_setting_slow_generation, false, "settingsslowgenerationhelp")
	tab_next()
	
	// Refresh textures on focus
	tab_control_switch()
	draw_switch("settingsrefreshtextures", dx, dy, setting_refresh_textures, action_setting_refresh_textures, false, "settingsrefreshtextureshelp")
	tab_next()
	
	// Adjust pivot on resizing
	tab_control_switch()
	draw_switch("settingsadjustpivotresize", dx, dy, setting_adjust_pivot_resize, action_setting_adjust_pivot_resize, false, "settingsadjustpivotresizehelp")
	tab_next()
}
