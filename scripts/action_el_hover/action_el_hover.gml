/// action_el_hover(hover)
/// @arg hover

function action_el_hover(hover)
{
	el_value_set_start(action_el_hover, false)
	el_value_set(e_value.HOVER, hover, false)
	el_value_set_done()
}
