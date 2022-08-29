/// action_el_inflate(value, add)
/// @arg value
/// @arg add

function action_el_inflate(value, add)
{
	el_value_set_start(action_el_inflate, true)
	el_value_set(e_value.INFLATE, value, add)
	el_value_set_done()
}
