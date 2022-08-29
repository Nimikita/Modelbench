/// action_el_scale_xyz(scale)
/// @arg scale

function action_el_scale_xyz(scale)
{
	el_value_set_start(action_el_scale_xyz, true)
	el_value_set(e_value.SCA_X, scale[@ X], false)
	el_value_set(e_value.SCA_Y, scale[@ Y], false)
	el_value_set(e_value.SCA_Z, scale[@ Z], false)
	el_value_set_done()
}
