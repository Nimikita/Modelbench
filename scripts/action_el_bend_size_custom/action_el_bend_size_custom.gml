/// action_el_bend_size_custom(custom)
/// @arg bend

function action_el_bend_size_custom(custom)
{
	el_value_set_start(action_el_bend_size_custom, true)
	el_value_set(e_value.BEND_SIZE_CUSTOM, custom, false)
	el_value_set_done()
}
