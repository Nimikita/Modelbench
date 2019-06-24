/// action_el_bend_angle(value, add)
/// @arg bend
/// @arg add

el_value_set_start(action_el_bend_angle, true)
el_value_set(e_value.BEND_ANGLE_X + axis_edit, argument0, argument1)
el_value_set_done()
