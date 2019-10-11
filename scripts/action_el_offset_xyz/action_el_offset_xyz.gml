/// action_el_offset_xyz(offset)
/// @arg offset

el_value_set_start(action_el_offset_xyz, true)
el_value_set(e_value.OFFSET_X, argument0[@ X], false)
el_value_set(e_value.OFFSET_Y, argument0[@ Y], false)
el_value_set(e_value.OFFSET_Z, argument0[@ Z], false)
el_value_set_done()
