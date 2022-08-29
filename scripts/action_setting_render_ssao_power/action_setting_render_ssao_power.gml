/// action_setting_render_ao_power(value, add)
/// @arg value
/// @arg add

function action_setting_render_ssao_power(value, add)
{
	setting_render_ao_power = setting_render_ao_power * add + value / 100
}
