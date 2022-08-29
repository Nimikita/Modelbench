/// action_el_uv_length(length, add)
/// @arg length
/// @arg add

function action_el_uv_length(length, add)
{
	el_value_set_start(action_el_uv_length, true)
	el_value_set(e_value.LENGTH, length, add)
	
	if (setting_adjust_pivot_resize)
		el_value_set(e_value.OFFSET_Y, -(length/2), add)
	
	el_value_set_done()
}
