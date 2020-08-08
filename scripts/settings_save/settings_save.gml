/// settings_save()

log("Saving settings", settings_file)

json_save_start(settings_file)
json_save_object_start()
json_save_var("format", real(settings_format))

json_save_object_start("general")

	json_save_var("fps", room_speed)
	json_save_var("feature_set", setting_feature_set)
	json_save_var_bool("backup", setting_backup)
	json_save_var("backup_time", setting_backup_time)
	json_save_var("backup_amount", setting_backup_amount)
	json_save_var("slow_generation", setting_slow_generation)
	json_save_var_bool("refresh_textures", setting_refresh_textures)

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
	json_save_var("key_remove_selection", setting_key_remove_selection)
	json_save_var_bool("key_remove_selection_control", setting_key_remove_selection_control)
	json_save_var("key_duplicate_selection", setting_key_duplicate_selection)
	json_save_var_bool("key_duplicate_selection_control", setting_key_duplicate_selection_control)
	json_save_var("key_select_elements", setting_key_select_elements)
	json_save_var_bool("key_select_elements_control", setting_key_select_elements_control)
	json_save_var("key_uv_editor", setting_key_uv_editor)
	json_save_var_bool("key_uv_editor_control", setting_key_uv_editor_control)
	
	json_save_var("key_tool_select", setting_key_tool_select)
	json_save_var_bool("key_tool_select_control", setting_key_tool_select_control)
	json_save_var("key_tool_pivot", setting_key_tool_pivot)
	json_save_var_bool("key_tool_pivot_control", setting_key_tool_pivot_control)
	json_save_var("key_tool_move", setting_key_tool_move)
	json_save_var_bool("key_tool_move_control", setting_key_tool_move_control)
	json_save_var("key_tool_rotate", setting_key_tool_rotate)
	json_save_var_bool("key_tool_rotate_control", setting_key_tool_rotate_control)
	json_save_var("key_tool_scale", setting_key_tool_scale)
	json_save_var_bool("key_tool_scale_control", setting_key_tool_scale_control)
	json_save_var("key_tool_transform", setting_key_tool_transform)
	json_save_var_bool("key_tool_transform_control", setting_key_tool_transform_control)
	json_save_var("setting_key_tool_bend", setting_key_tool_bend)
	json_save_var_bool("setting_key_tool_bend_control", setting_key_tool_bend_control)
	
	json_save_var("key_snap", setting_key_snap)
	json_save_var_bool("key_snap_control",setting_key_snap_control)
	
	json_save_var("key_forward", setting_key_forward)
	json_save_var("key_back", setting_key_back)
	json_save_var("key_left", setting_key_left)
	json_save_var("key_right", setting_key_right)
	json_save_var("key_ascend", setting_key_ascend)
	json_save_var("key_descend", setting_key_descend)
	json_save_var("key_reset", setting_key_reset)
	json_save_var("key_fast", setting_key_fast)
	json_save_var("key_slow", setting_key_slow)
	
	json_save_var("look_sensitivity", setting_look_sensitivity)
	
	json_save_var_bool("smooth_camera", setting_smooth_camera)
	

json_save_object_done()

json_save_object_start("interface")

	json_save_var("theme", setting_theme.name)
	json_save_var("accent_index", setting_accent)
	json_save_var("language_filename", setting_language_filename)
	json_save_var_color("accent_custom", setting_accent_custom)
	json_save_var_bool("z_is_up", setting_z_is_up)
	json_save_var_bool("shared_texture_uvs", setting_shared_texture_uvs)
	json_save_var_bool("startup_tips", setting_show_startup_tips)
	
	json_save_var("panel_left_size", panel_map[?"left"].size)
	json_save_var("panel_right_size", panel_map[?"right"].size)
	json_save_var("panel_left_secondary_size", panel_map[?"left_secondary"].size)
	json_save_var("panel_right_secondary_size", panel_map[?"right_secondary"].size)
	
	json_save_var("assets_location", assets.panel.location)
	json_save_var("element_editor_location", element_editor.panel.location)
	
	json_save_var_bool("show_uv_editor", setting_show_uv_editor)
	json_save_var("uv_editor_size", setting_uv_editor_size)
	
	json_save_var_bool("adjust_pivot_resize", setting_adjust_pivot_resize)
	
json_save_object_done()

json_save_object_start("render")

	json_save_var_bool("render_ssao", setting_render_ssao)
	
	/*
	json_save_var("render_ssao_radius", setting_render_ssao_radius)
	json_save_var("render_ssao_power", setting_render_ssao_power)
	json_save_var("render_ssao_blur_passes", setting_render_ssao_blur_passes)
	*/
	
	json_save_var_bool("render_shadows", setting_render_shadows)
	
	/*
	json_save_var("render_shadows_blur_quality", setting_render_shadows_blur_quality)
	json_save_var("render_shadows_blur_size", setting_render_shadows_blur_size)
	*/
	
	json_save_var_bool("render_aa", setting_render_aa)

json_save_object_done()

json_save_object_start("preview")
	
	json_save_var_bool("overlay", setting_preview_overlay)
	
	json_save_var("scenery", setting_preview_scenery.name)
	json_save_var("light_rotation", setting_preview_light_rotation)
	json_save_var("light_range", setting_preview_light_range)
	
	json_save_var("export_size", setting_preview_export_size)
	json_save_var_bool("background", setting_preview_background)

json_save_object_done()

json_save_object_start("viewport")

	json_save_var_bool("snap", setting_snap)
	json_save_var("snap_absolute", setting_snap_absolute)
	json_save_var("snap_size_position", setting_snap_size_position)
	json_save_var("snap_size_rotation", setting_snap_size_rotation)
	json_save_var("snap_size_scale", setting_snap_size_scale)
	json_save_var("snap_size_uv", setting_snap_size_uv)
	
	json_save_var_bool("overlays", setting_overlays)
	json_save_var_bool("overlays_grid", setting_overlays_grid)
	json_save_var_bool("overlays_gizmos", setting_overlays_gizmos)
	json_save_var_bool("overlays_outlines", setting_overlays_outlines)
	json_save_var("overlays_outline_opacity", setting_overlays_outline_opacity)
	
	json_save_var_bool("wind", setting_wind)
	json_save_var("wind_speed", setting_wind_speed)
	json_save_var("wind_strength", setting_wind_strength)
	
	json_save_var_bool("shading", setting_shading)
	json_save_var_bool("shading_ao", setting_shading_ao)
	json_save_var_bool("shading_lighting", setting_shading_lighting)
	
	json_save_var_bool("blocky_bending", setting_blocky_bending)
	
json_save_object_done()

json_save_object_done()
json_save_done()

debug("Saved settings")
