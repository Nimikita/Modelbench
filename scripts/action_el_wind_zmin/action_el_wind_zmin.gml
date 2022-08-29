/// action_el_wind_zmin(value, add)
/// @arg value
/// @arg add

function action_el_wind_zmin(value, add)
{
	el_value_set_start(action_el_wind_zmin, true)
	el_value_set(e_value.WIND_ZMIN, value, add)
	el_value_set_done()
}
