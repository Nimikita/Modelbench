/// action_el_wind_axis(axis)
/// @arg axis

function action_el_wind_axis(axis)
{
	el_value_set_start(action_el_wind_axis, false)
	el_value_set(e_value.WIND_AXIS, axis, false)
	el_value_set_done()
}
