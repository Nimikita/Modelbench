/// action_el_bend_end_offset(value, add)
/// @arg value
/// @arg add

function action_el_bend_end_offset(value, add)
{
	el_value_set_start(action_el_bend_end_offset, true)
	el_value_set(e_value.BEND_END_OFFSET, value, add)
	el_value_set_done()
}
