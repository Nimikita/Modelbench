/// action_el_bend_lock(lock)
/// @arg lock

function action_el_bend_lock(lock)
{
	el_value_set_start(action_el_bend_lock, false)
	el_value_set(e_value.BEND_LOCK, lock, false)
	el_value_set_done()
}
