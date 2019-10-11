/// action_el_scale_xyz(scale)
/// @arg scale

el_value_set_start(action_el_scale_xyz, true)
el_value_set(e_value.SCA_X, argument0[@ X], false)
el_value_set(e_value.SCA_Y, argument0[@ Y], false)
el_value_set(e_value.SCA_Z, argument0[@ Z], false)
el_value_set_done()
