/// action_el_bend_invert(invert)
/// @arg invert

function action_el_bend_invert(invert)
{
	el_value_set_start(action_el_bend_invert, false)
	el_value_set(e_value.BEND_INVERT_X + axis_edit, invert, false)
	el_value_clamp_bend(axis_edit)
	el_value_set_done()
}
