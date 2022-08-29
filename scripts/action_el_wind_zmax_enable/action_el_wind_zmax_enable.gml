/// action_el_wind_zmax_enable(value)
/// @arg value

function action_el_wind_zmax_enable(value)
{
	el_value_set_start(action_el_wind_zmax_enable, false)
	el_value_set(e_value.WIND_ZMAX_ENABLE, value, false)
	el_value_set_done()
}
