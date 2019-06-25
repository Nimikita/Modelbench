/// action_el_brightness(value, add)
/// @arg value
/// @arg add

el_value_set_start(action_el_brightness, true)
el_value_set(e_value.BRIGHTNESS, argument0 / 100, argument1)
el_value_set_done()
