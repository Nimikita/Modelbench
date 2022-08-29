/// action_el_hide_front(hide)
/// @arg hide

function action_el_hide_front(hide)
{
	el_value_set_start(action_el_hide_front, false)
	el_value_set(e_value.HIDE_FRONT, hide, false)
	el_value_set_done()
}
