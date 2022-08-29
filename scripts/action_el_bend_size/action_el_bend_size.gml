/// action_el_bend_size(value, add)
/// @arg bend
/// @arg add

function action_el_bend_size(value, add)
{
	el_value_set_start(action_el_bend_size, true)
	el_value_set(e_value.BEND_SIZE, value, add)
	el_value_set_done()
}
