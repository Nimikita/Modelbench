/// action_el_rot(value, add)
/// @arg value
/// @arg add

el_value_set_start(action_el_rot, true)
el_value_set(e_value.ROT_X + axis_edit, argument0, argument1)
el_value_set_done()
