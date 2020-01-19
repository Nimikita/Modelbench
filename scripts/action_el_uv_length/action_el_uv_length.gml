/// action_el_uv_length(length, add)
/// @arg length
/// @arg add

el_value_set_start(action_el_uv_length, true)
el_value_set(e_value.LENGTH, argument0, argument1)

if (setting_adjust_pivot_resize)
	el_value_set(e_value.OFFSET_Y, -(argument0/2), argument1)

el_value_set_done()
