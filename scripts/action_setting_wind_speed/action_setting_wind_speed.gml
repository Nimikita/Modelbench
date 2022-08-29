/// action_setting_wind_speed(value, add)
/// @arg value
/// @arg add

function action_setting_wind_speed(value, add)
{
	setting_wind_speed = setting_wind_speed * add + value / 100
}
