/// action_setting_render_shadows_blur_quality(value, add)
/// @arg value
/// @arg add

function action_setting_render_shadows_blur_quality(value, add)
{
	setting_render_shadows_blur_quality = setting_render_shadows_blur_quality * add + value
}
