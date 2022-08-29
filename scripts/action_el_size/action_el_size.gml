/// action_el_size(value, add)
/// @arg value
/// @arg add

function action_el_size(value, add)
{
	el_value_set_start(action_el_size, true)
	el_value_set(e_value.WIDTH + axis_edit, value, add)
	el_value_set_done()
}
