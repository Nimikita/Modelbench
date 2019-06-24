/// action_el_bend_axis(bend)
/// @arg bend

el_value_set_start(action_el_bend_axis, false)
el_value_set(e_value.BEND_AXIS_X + axis_edit, argument0, false)
el_value_set_done()
