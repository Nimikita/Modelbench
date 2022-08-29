/// action_el_pos(value, add)
/// @arg value
/// @arg add

function action_el_pos(value, add)
{
	el_value_set_start(action_el_pos, true)
	el_value_set(e_value.POS_X + axis_edit, value, add)
	el_value_set_done()
}
