/// action_setting_render_ao_blur_passes(value, add)
/// @arg value
/// @arg add

function action_setting_render_ssao_blur_passes(value, add)
{
	setting_render_ao_blur_passes = setting_render_ao_blur_passes * add + value
}
