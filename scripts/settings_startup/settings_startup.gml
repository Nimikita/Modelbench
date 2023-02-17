/// settings_startup()

function settings_startup()
{
	program_mode = e_mode.MODELING
	setting_feature_set = e_features.MIMODEL
	
	toolbar_line_x = 0
	toolbar_line_width = 0
	toolbar_line_x_goal = 0
	toolbar_line_width_goal = 0
	
	shortcut_bar_list = ds_list_create()
	shortcut_bar_width_list = ds_list_create()
	shortcut_bar_width = 0
	shortcut_bar_width_prev = 0
	shortcut_bar_lines = 1
	
	setting_panel_left_size = 300
	setting_panel_right_size = 300
	setting_panel_left_secondary_size = 300
	setting_panel_right_secondary_size = 300
	
	setting_assets_location = "right"
	setting_element_editor_location = "right_secondary"
	setting_preview_location = "right"
	setting_settings_location = "right_secondary"
	setting_uv_editor_size = 0.5
	
	backup_next = 0
	setting_backup = true
	setting_backup_time = 2
	setting_backup_amount = 3
	setting_slow_generation = false
	setting_refresh_textures = false
	setting_adjust_pivot_resize = true
	
	setting_viewport_controls_middle = false
	
	action_controls_reset()
	
	setting_theme = theme_light
	setting_accent = 6
	setting_accent_custom = hex_to_color("03A9F4")
	setting_language_filename = "english.mblanguage"
	setting_tip_show = true
	setting_z_is_up = false
	setting_shared_texture_uvs = true
	setting_show_shortcuts_bar = true
	
	setting_reduced_motion = false
	
	setting_blocky_bending = false
	
	setting_render_shadows = true
	setting_render_shadows_blur_quality = 64
	setting_render_shadows_blur_size = .1
	setting_render_shadows_sun_buffer_size = 2048
	
	setting_render_ao = true
	setting_render_ao_radius = 5
	setting_render_ao_power = 1
	setting_render_ao_color = c_black//hex_to_color("696EA1")
	setting_render_ao_blur_passes = 2
	
	setting_render_aa = true
	
	// Preview settings
	setting_preview_guides = false
	
	setting_preview_scenery = null
	setting_preview_background_top = c_white
	setting_preview_background_bottom = c_white
	setting_preview_light_color = c_white
	setting_preview_ambient_color = c_white
	setting_preview_lights = 1
	setting_preview_cubemap_sprite = null
	setting_preview_cubemap_repeat = 1
	setting_preview_cubemap_mapped = false
	setting_preview_cubemap_update = true
	
	setting_preview_light_rotation = 225
	setting_preview_light_range = 200
	
	setting_preview_export_size = 256
	setting_preview_background = true
	
	// Misc settings
	setting_hide_shapes = false
	
	setting_collapse_backup_models = true
	setting_collapse_controls_file = true
	setting_collapse_controls_editing = true
	setting_collapse_controls_tools = true
	setting_collapse_controls_navigation = true
	
	setting_collapse_bend_axis[X] = true
	setting_collapse_bend_axis[Y] = true
	setting_collapse_bend_axis[Z] = true
	
	// UV editor
	setting_show_uv_editor = false
	setting_uv_editor_size = 0.5
	setting_uv_editor_location = "left"
	
	// Snap
	setting_snap = false
	setting_snap_absolute = false
	setting_snap_size_position = 1
	setting_snap_size_rotation = 15
	setting_snap_size_scale = 1
	setting_snap_size_uv = 1
	
	// Overlays
	setting_overlays = true
	setting_overlays_grid = true
	setting_overlays_gizmos = true
	setting_overlays_highlights = true
	setting_overlays_outlines = true
	setting_overlays_outline_opacity = .15
	
	// Wind
	setting_wind = true
	setting_wind_speed = .45
	setting_wind_strength = .5
	
	// Shading
	setting_render_mode = e_viewport_render.TEXTURED
	setting_shading = true
	setting_shading_ao = true
	setting_shading_lighting = true
	
	settings_load()
	interface_update()
	
	// Choose first scenery option by default
	if (setting_preview_scenery = null && ds_list_size(scenery_list) > 0)
		setting_preview_scenery = scenery_list[|0]
	
	// Update preview scenery colors
	action_preview_scenery(setting_preview_scenery)
	
	//setting_texture_filtering = false
	setting_texture_filtering_level = 1
	texture_set_mipmap_level(setting_texture_filtering_level)
}
