/// app_check_shortcut(shortcut, pressed)
/// @arg shortcut
/// @arg [pressed]
/// @desc [ keyID, control, shift ]

function app_check_shortcut()
{
	var shortcut, pressed;
	shortcut = argument[0]
	
	if (argument_count > 1)
		pressed = argument[1]
	else
		pressed = true
	
	if ((!shortcut[2] && !keyboard_check(vk_shift)) || (shortcut[2] && keyboard_check(vk_shift)))
		if ((!shortcut[1] && !keyboard_check(vk_control)) || (shortcut[1] && keyboard_check(vk_control)))
			if (pressed ? keyboard_check_pressed(shortcut[0]) : keyboard_check(shortcut[0]))
				return true
	
	return false
}
