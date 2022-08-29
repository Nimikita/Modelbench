/// app_check_control(active)
/// @arg active

function app_check_control(active)
{
	if (active)
		return keyboard_check(vk_control)
	else
		return !keyboard_check(vk_control)
}
