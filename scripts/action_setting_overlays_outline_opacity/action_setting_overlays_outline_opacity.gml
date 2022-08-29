/// action_setting_overlays_outline_opacity(value, add)
/// @arg value
/// @arg add

function action_setting_overlays_outline_opacity(value, add)
{
	setting_overlays_outline_opacity = setting_overlays_outline_opacity * add + value / 100
}
