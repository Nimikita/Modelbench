/// settings_save()

log("Saving settings", settings_file)

json_save_start(settings_file)
json_save_object_start()
json_save_var("format", settings_format)

json_save_object_start("general")

	json_save_var("fps", room_speed)
	json_save_var_bool("backup", setting_backup)
	json_save_var("backup_time", setting_backup_time)
	json_save_var("backup_amount", setting_backup_amount)
	
json_save_object_done()

json_save_object_start("controls")

	json_save_var("key_open", setting_key_open)
	json_save_var_bool("key_open_control", setting_key_open_control)
	json_save_var("key_save", setting_key_save)
	json_save_var_bool("key_save_control", setting_key_save_control)
	json_save_var("key_undo", setting_key_undo)
	json_save_var_bool("key_undo_control", setting_key_undo_control)
	json_save_var("key_redo", setting_key_redo)
	json_save_var_bool("key_redo_control", setting_key_redo_control)
	json_save_var("key_remove_elements", setting_key_remove_elements)
	json_save_var_bool("key_remove_elements_control", setting_key_remove_elements_control)
	json_save_var("key_duplicate_elements", setting_key_duplicate_elements)
	json_save_var_bool("key_duplicate_elements_control", setting_key_duplicate_elements_control)
	json_save_var("key_select_elements", setting_key_select_elements)
	json_save_var_bool("key_select_elements_control", setting_key_select_elements_control)
	
	json_save_var("key_tool_select", setting_key_tool_select)
	json_save_var_bool("key_tool_select_control", setting_key_tool_select_control)
	json_save_var("key_tool_move", setting_key_tool_move)
	json_save_var_bool("key_tool_move_control", setting_key_tool_move_control)
	json_save_var("key_tool_rotate", setting_key_tool_rotate)
	json_save_var_bool("key_tool_rotate_control", setting_key_tool_rotate_control)
	json_save_var("key_tool_scale", setting_key_tool_scale)
	json_save_var_bool("key_tool_scale_control", setting_key_tool_scale_control)
	json_save_var("key_tool_transform", setting_key_tool_transform)
	json_save_var_bool("key_tool_transform_control", setting_key_tool_transform_control)
	
	json_save_var("key_forward", setting_key_forward)
	json_save_var("key_back", setting_key_back)
	json_save_var("key_left", setting_key_left)
	json_save_var("key_right", setting_key_right)
	json_save_var("key_ascend", setting_key_ascend)
	json_save_var("key_descend", setting_key_descend)
	json_save_var("key_reset", setting_key_reset)
	json_save_var("key_fast", setting_key_fast)
	json_save_var("key_slow", setting_key_slow)
	
	json_save_var_bool("smooth_camera", setting_smooth_camera)
	json_save_var("smooth_camera_amount", setting_smooth_camera_amount)
	
	json_save_var_bool("snap", setting_snap)
	json_save_var("snap_size", setting_snap_size)

json_save_object_done()

json_save_object_start("interface")

	json_save_var("theme", setting_theme.name)
	json_save_var("accent_index", setting_accent)
	json_save_var_color("accent_custom", setting_accent_custom)
	json_save_var_bool("z_is_up", setting_z_is_up)
	json_save_var("outline_opacity", setting_outline_opacity)
	
	json_save_var("panel_left_size", panel_map[?"left"].size)
	json_save_var("panel_right_size", panel_map[?"right"].size)
	json_save_var("panel_left_secondary_size", panel_map[?"left_secondary"].size)
	json_save_var("panel_right_secondary_size", panel_map[?"right_secondary"].size)
	
	json_save_var("assets_location", assets.panel.location)
	json_save_var("element_editor_location", element_editor.panel.location)
	
json_save_object_done()

json_save_object_start("graphics")

	json_save_var_bool("blocky_bending", setting_blocky_bending)
	json_save_var_bool("wind", setting_wind)
	json_save_var("wind_speed", setting_wind_speed)
	json_save_var("wind_strength", setting_wind_strength)
	
json_save_object_done()

json_save_object_start("render")

	json_save_var_bool("render_ssao", setting_render_ssao)
	json_save_var("render_ssao_radius", setting_render_ssao_radius)
	json_save_var("render_ssao_power", setting_render_ssao_power)
	json_save_var("render_ssao_blur_passes", setting_render_ssao_blur_passes)

	json_save_var_bool("render_shadows", setting_render_shadows)
	json_save_var("render_shadows_blur_quality", setting_render_shadows_blur_quality)
	json_save_var("render_shadows_blur_size", setting_render_shadows_blur_size)
	
	json_save_var_bool("render_aa", setting_render_aa)

json_save_object_done()

json_save_object_done()
json_save_done()

debug("Saved settings")
recent_save()
