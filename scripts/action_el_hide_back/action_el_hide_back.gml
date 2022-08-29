/// action_el_hide_back(hide)
/// @arg hide

function action_el_hide_back(hide)
{
	el_value_set_start(action_el_hide_back, false)
	el_value_set(e_value.HIDE_BACK, hide, false)
	el_value_set_done()
}
