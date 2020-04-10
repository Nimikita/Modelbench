/// settings_startup()

program_mode = e_mode.MODELING
setting_feature_set = e_features.MIMODEL

toolbar_line_x = 0
toolbar_line_width = 0
toolbar_line_x_goal = 0
toolbar_line_width_goal = 0

setting_panel_left_size = 300
setting_panel_right_size = 300
setting_panel_left_secondary_size = 300
setting_panel_right_secondary_size = 300

setting_assets_location = "right"
setting_element_editor_location = "right_secondary"
setting_preview_location = "right"
setting_uv_editor_size = 0.5

backup_next = 0
setting_backup = true
setting_backup_time = 2
setting_backup_amount = 3
setting_slow_generation = false
setting_refresh_textures = false
setting_adjust_pivot_resize = true

setting_key_open = ord("O")
setting_key_open_control = true
setting_key_save = ord("S")
setting_key_save_control = true
setting_key_undo = ord("Z")
setting_key_undo_control = true
setting_key_redo = ord("Y")
setting_key_redo_control = true
setting_key_remove_selection = vk_delete
setting_key_remove_selection_control = false
setting_key_duplicate_selection = ord("D")
setting_key_duplicate_selection_control = true
setting_key_select_elements = ord("A")
setting_key_select_elements_control = true
setting_key_uv_editor = ord("E")
setting_key_uv_editor_control = true

setting_key_tool_select = ord("W")
setting_key_tool_select_control = false
setting_key_tool_pivot = ord("Q")
setting_key_tool_pivot_control = false
setting_key_tool_move = ord("G")
setting_key_tool_move_control = false
setting_key_tool_rotate = ord("R")
setting_key_tool_rotate_control = false
setting_key_tool_scale = ord("S")
setting_key_tool_scale_control = false
setting_key_tool_transform = ord("T")
setting_key_tool_transform_control = false
setting_key_tool_bend = ord("B")
setting_key_tool_bend_control = false
setting_key_snap = ord("F")
setting_key_snap_control = false

setting_key_forward = ord("W")
setting_key_back = ord("S")
setting_key_left = ord("A")
setting_key_right = ord("D")
setting_key_ascend = ord("E")
setting_key_descend = ord("Q")
setting_key_reset = ord("R")
setting_key_fast = vk_space
setting_key_slow = vk_lshift
setting_move_speed = 0.7
setting_look_sensitivity = .75
setting_fast_modifier = 2.25
setting_slow_modifier = 0.25
setting_smooth_camera = false

setting_theme = theme_light
setting_accent = 6
setting_accent_custom = hex_to_color("03A9F4")
setting_language_filename = "english.mblanguage"
setting_tip_show = true
setting_z_is_up = false
setting_shared_texture_uvs = true
setting_outline_opacity = .15
setting_show_startup_tips = true

setting_blocky_bending = false
setting_wind = true
setting_wind_speed = .45
setting_wind_strength = .5
setting_modeling_ssao = true
setting_lighting = true

setting_render_shadows = true
setting_render_shadows_blur_quality = 64
setting_render_shadows_blur_size = .1
setting_render_shadows_sun_buffer_size = 2048

setting_render_ssao = true
setting_render_ssao_radius = 5
setting_render_ssao_power = 1
setting_render_ssao_color = c_black//hex_to_color("696EA1")
setting_render_ssao_blur_passes = 2

setting_render_aa = true

// Preview settings
setting_preview_overlay = false

setting_preview_scenery = null
setting_preview_background_top = c_white
setting_preview_background_bottom = c_white
setting_preview_light_color = c_white
setting_preview_ambient_color = c_white
setting_preview_lights = 1

setting_preview_light_rotation = 225
setting_preview_light_range = 200

setting_preview_export_size = 256
setting_preview_background = true

// Misc settings
setting_hide_shapes = false
setting_combine_scale = false

setting_collapse_backup_models = true
setting_collapse_wind = true
setting_collapse_ssao = true
setting_collapse_shadows = true
setting_collapse_bend_axis[X] = true
setting_collapse_bend_axis[Y] = true
setting_collapse_bend_axis[Z] = true

// UV editor
setting_show_uv_editor = false
setting_uv_editor_size = 0.5

// Snap
setting_snap = false
setting_snap_size_position = 1
setting_snap_size_rotation = 15
setting_snap_size_scale = 1
setting_snap_size_uv = 1

// Orientation
setting_orientation = e_orientation.GIMBAL

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
