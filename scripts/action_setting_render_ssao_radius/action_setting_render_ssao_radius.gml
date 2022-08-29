/// action_setting_render_ao_range(value, add)
/// @arg value
/// @arg add

function action_setting_render_ssao_radius(value, add)
{
	setting_render_ao_radius = setting_render_ao_radius * add + value
}
