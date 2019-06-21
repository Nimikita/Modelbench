/// settings_startup()

setting_panel_left_size = 300
setting_panel_right_size = 300
setting_panel_left_secondary_size = 300
setting_panel_right_secondary_size = 300

setting_assets_location = "right"
setting_element_editor_location = "right_secondary"

setting_view_split = 0.5

backup_next = 0
setting_backup = true
setting_backup_time = 2
setting_backup_amount = 3

setting_key_open = ord("O")
setting_key_open_control = true
setting_key_save = ord("S")
setting_key_save_control = true
setting_key_undo = ord("Z")
setting_key_undo_control = true
setting_key_redo = ord("Y")
setting_key_redo_control = true

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

setting_dark_theme = false
setting_accent = 6
setting_tip_show = true
setting_z_is_up = false
setting_smooth_camera = true
setting_smooth_camera_amount = 2

setting_blocky_bending = false
setting_outline_opacity = .15
setting_graphics_wind = true
setting_graphics_wind_speed = .45
setting_graphics_wind_strength = .5

setting_render_shadows = false
setting_render_shadows_blur_quality = 64
setting_render_shadows_blur_size = .2
setting_render_shadows_sun_buffer_size = 8192

setting_render_ssao = true
setting_render_ssao_radius = 5
setting_render_ssao_power = 1
setting_render_ssao_color = c_black//hex_to_color("696EA1")
setting_render_ssao_blur_passes = 2

setting_texture_filtering = true
setting_texture_filtering_level = 1

// Misc settings
setting_hide_shapes = false

setting_collapse_backup_models = true
setting_collapse_wind = true
setting_collapse_ssao = true
setting_collapse_shadows = true

texture_set_mipmap_level(setting_texture_filtering_level)