/// action_setting_snap_size(value, add)
/// @arg value
/// @arg add

setting_snap_size = setting_snap_size * argument1 + argument0

if (setting_snap)
	snap_value = setting_snap_size
else
	snap_value = snap_min
		