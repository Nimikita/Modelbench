/// app_startup_interface_panels()

panel_map = ds_map_create()
panel_map[?"left"] = new(obj_panel)
panel_map[?"left"].size = setting_panel_left_size
panel_map[?"left"].location = "left"
panel_map[?"right"] = new(obj_panel)
panel_map[?"right"].size = setting_panel_right_size
panel_map[?"right"].location = "right"
panel_map[?"left_secondary"] = new(obj_panel)
panel_map[?"left_secondary"].size = setting_panel_left_secondary_size
panel_map[?"left_secondary"].location = "left_secondary"
panel_map[?"right_secondary"] = new(obj_panel)
panel_map[?"right_secondary"].size = setting_panel_right_secondary_size
panel_map[?"right_secondary"].location = "right_secondary"

panel_area_x = 0
panel_area_y = 0
panel_area_width = 0
panel_area_height = 0

panel_resize = null
panel_resize_size = 0
