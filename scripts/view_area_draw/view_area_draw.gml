/// view_area_draw()

// Calculate area
view_area_x = panel_area_x + panel_map[?"left"].size_real + panel_map[?"left_secondary"].size_real
view_area_y = panel_area_y
view_area_width = panel_area_width - panel_map[?"left"].size_real - panel_map[?"left_secondary"].size_real - panel_map[?"right_secondary"].size_real - panel_map[?"right"].size_real
view_area_height = panel_area_height

// Draw views
view_draw(view_main)
