/// action_el_rot(value, add)
/// @arg value
/// @arg add

function action_el_rot(value, add)
{
	el_value_set_start(action_el_rot, true)
	el_value_set(e_value.ROT_X + axis_edit, value, add)
	el_value_set_done()
}
