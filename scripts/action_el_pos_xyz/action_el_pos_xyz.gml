/// action_el_pos_xyz(point)
/// @arg point

el_value_set_start(action_el_pos_xyz, true)
el_value_set(e_value.POS_X, argument0[@ X], false)
el_value_set(e_value.POS_Y, argument0[@ Y], false)
el_value_set(e_value.POS_Z, argument0[@ Z], false)
el_value_set_done()
