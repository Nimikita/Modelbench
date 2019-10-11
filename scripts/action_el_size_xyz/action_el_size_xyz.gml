/// action_el_size_xyz(size)
/// @arg size

el_value_set_start(action_el_size_xyz, true)
el_value_set(e_value.WIDTH, argument0[@ X], false)
el_value_set(e_value.LENGTH, argument0[@ Y], false)
el_value_set(e_value.HEIGHT, argument0[@ Z], false)
el_value_set_done()
