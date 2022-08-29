/// action_el_bend_offset(value, add)
/// @arg bend
/// @arg add

function action_el_bend_offset(value, add)
{
	el_value_set_start(action_el_bend_offset, true)
	el_value_set(e_value.BEND_OFFSET, value, add)
	el_value_set_done()
}
