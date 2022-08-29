/// action_setting_render_shadows_blur_size(value, add)
/// @arg value
/// @arg add

function action_setting_render_shadows_blur_size(value, add)
{
	setting_render_shadows_blur_size = setting_render_shadows_blur_size * add + value / 100
}
