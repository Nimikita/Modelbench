/// action_el_bend_max(value, add)
/// @arg value
/// @arg add

el_value_set_start(action_el_bend_max, true)
el_value_set(e_value.BEND_X_MAX + axis_edit, argument0, argument1)
el_value_clamp_bend(axis_edit)
el_value_set_done()
