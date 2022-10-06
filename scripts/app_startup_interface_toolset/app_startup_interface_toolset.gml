/// app_startup_interface_toolset()

function app_startup_interface_toolset()
{
	tool_selected = e_tool.SELECT
	
	toolbar_tools_alpha = .25
	toolbar_tools_alpha_goal = toolbar_tools_alpha
	
	toolbar_nav_alpha = .25
	toolbar_nav_alpha_goal = toolbar_nav_alpha
	
	// Viewport toolbar
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
}
