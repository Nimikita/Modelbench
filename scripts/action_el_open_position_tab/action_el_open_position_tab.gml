/// action_el_open_position_tab(open)
/// @arg open

function action_el_open_position_tab(open)
{
	el_value_set_start(action_el_open_position_tab, false)
	el_value_set(e_value.OPEN_POSITION_TAB, open, false)
	el_value_set_done()
}
