/// action_el_bend(bend)
/// @arg bend

function action_el_bend(bend)
{
	el_value_set_start(action_el_bend, false)
	el_value_set(e_value.BEND_SHAPE, bend, false)
	el_value_set_done()
}
