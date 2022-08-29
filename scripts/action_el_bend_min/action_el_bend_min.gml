/// action_el_bend_min(value, add)
/// @arg value
/// @arg add

function action_el_bend_min(value, add)
{
	el_value_set_start(action_el_bend_min, true)
	el_value_set(e_value.BEND_X_MIN + axis_edit, value, add)
	el_value_clamp_bend(axis_edit)
	el_value_set_done()
}
