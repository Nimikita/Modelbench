/// action_el_sca(value, add)
/// @arg value
/// @arg add

function action_el_sca(value, add)
{
	el_value_set_start(action_el_sca, true)
	el_value_set(e_value.SCA_X + axis_edit, value, add)
	el_value_set_done()
}
