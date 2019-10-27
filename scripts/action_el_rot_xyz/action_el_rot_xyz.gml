/// action_el_rot_xyz(rotation)
/// @arg rotation

el_value_set_start(action_el_rot_xyz, true)
el_value_set(e_value.ROT_X, argument0[@ X], false)
el_value_set(e_value.ROT_Y, argument0[@ Y], false)
el_value_set(e_value.ROT_Z, argument0[@ Z], false)
el_value_set_done()

view_control_update_rotate()
