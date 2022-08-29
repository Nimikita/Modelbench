/// action_el_bend_part(part)
/// @arg part

function action_el_bend_part(part)
{
	el_value_set_start(action_el_bend_part, true)
	el_value_set(e_value.BEND_PART, part, false)
	el_value_set_done()
}
