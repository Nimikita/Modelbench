/// action_el_brightness(value, add)
/// @arg value
/// @arg add

function action_el_brightness(value, add)
{
	el_value_set_start(action_el_brightness, true)
	el_value_set(e_value.BRIGHTNESS, value / 100, add)
	el_value_set_done()
}
