/// action_el_sca_xyz(scale, add)
/// @arg scale
/// @arg add

el_value_set_start(action_el_sca_xyz, true)
el_value_set(e_value.SCA_X, argument0, argument1)
el_value_set(e_value.SCA_Y, argument0, argument1)
el_value_set(e_value.SCA_Z, argument0, argument1)
el_value_set_done()
