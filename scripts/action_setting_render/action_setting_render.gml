/// action_setting_render(value)
/// @arg value

function action_setting_render(value)
{
	setting_render_mode = value
	
	if (setting_render_mode = e_viewport_render.FLAT)
		setting_shading = false
	else
		setting_shading = true
}
