/// action_el_sca_xyz(scale, add)
/// @arg scale
/// @arg add

function action_el_sca_xyz(scale, add)
{
	el_value_set_start(action_el_sca_xyz, true)
	el_value_set(e_value.SCA_X, scale, add)
	el_value_set(e_value.SCA_Y, scale, add)
	el_value_set(e_value.SCA_Z, scale, add)
	el_value_set_done()
}
