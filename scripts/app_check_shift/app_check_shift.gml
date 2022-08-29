/// app_check_shift(active)
/// @arg active

function app_check_shift(active)
{
	if (active)
		return keyboard_check(vk_shift)
	else
		return !keyboard_check(vk_shift)
}
