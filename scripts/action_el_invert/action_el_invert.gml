/// action_el_invert(invert)
/// @arg invert

function action_el_invert(invert)
{
	el_value_set_start(action_el_invert, false)
	el_value_set(e_value.INVERT, invert, false)
	el_value_set_done()
}
