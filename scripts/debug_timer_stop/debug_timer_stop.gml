/// debug_timer_stop(message)
/// @arg message

function debug_timer_stop(mes)
{
	debug(mes, string(current_time - debug_timer) + " msec")
}
