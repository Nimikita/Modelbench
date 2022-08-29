/// action_el_offset(value, add)
/// @arg value
/// @arg add

function action_el_offset(value, add)
{
	el_value_set_start(action_el_offset, true)
	el_value_set(e_value.OFFSET_X + axis_edit, value, add)
	el_value_set_done()
}
