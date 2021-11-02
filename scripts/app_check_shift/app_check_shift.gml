/// app_check_shift(active)
/// @arg active

if (argument0)
	return keyboard_check(vk_shift)
else
	return !keyboard_check(vk_shift)
