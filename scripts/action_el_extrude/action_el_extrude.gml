/// action_el_extrude(extrude)
/// @arg extrude

function action_el_extrude(extrude)
{
	el_value_set_start(action_el_extrude, false)
	el_value_set(e_value.EXTRUDE, extrude, false)
	el_value_set_done()
}
