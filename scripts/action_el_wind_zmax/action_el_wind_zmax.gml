/// action_el_wind_zmax(value, add)
/// @arg value
/// @arg add

function action_el_wind_zmax(value, add)
{
	el_value_set_start(action_el_wind_zmax, true)
	el_value_set(e_value.WIND_ZMAX, value, add)
	el_value_set_done()
}
