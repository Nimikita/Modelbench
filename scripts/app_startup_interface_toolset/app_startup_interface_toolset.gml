/// app_startup_interface_toolset()

tool_selected = e_tool.SELECT

toolset_alpha = .25
toolset_alpha_goal = toolset_alpha

// Viewport toolbar
toolbar_viewport_width = 0
toolbar_viewport_alpha = .25
toolbar_viewport_alpha_goal = toolbar_viewport_alpha

tbx_snap_size_position = new_textbox_decimals()
tbx_snap_size_rotation = new_textbox_decimals()
tbx_snap_size_rotation.suffix = "°"
tbx_snap_size_scale = new_textbox_decimals()
tbx_snap_size_uv = new_textbox_decimals()

tbx_overlays_outline_opacity = new_textbox_integer()
tbx_overlays_outline_opacity.suffix = "%"

tbx_wind_speed = new_textbox_integer()
tbx_wind_speed.suffix = "%"
tbx_wind_strength = new_textbox_decimals()