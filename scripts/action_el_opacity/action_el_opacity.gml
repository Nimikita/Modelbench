/// action_el_opacity(value, add)
/// @arg value
/// @arg add

function action_el_opacity(value, add)
{
	el_value_set_start(action_el_opacity, true)
	el_value_set(e_value.OPACITY, value / 100, add)
	el_value_set_done()
}
