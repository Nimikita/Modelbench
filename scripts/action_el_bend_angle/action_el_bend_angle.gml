/// action_el_bend_angle(value, add)
/// @arg bend
/// @arg add

function action_el_bend_angle(value, add)
{
	el_value_set_start(action_el_bend_angle, true)
	el_value_set(e_value.BEND_ANGLE_X + axis_edit, value, add)
	el_value_set_done()
}
