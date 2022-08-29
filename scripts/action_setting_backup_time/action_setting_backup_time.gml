/// action_setting_backup_time(value, add)
/// @arg value
/// @arg add

function action_setting_backup_time(value, add)
{
	setting_backup_time = setting_backup_time * add + value
	model_reset_backup()
}
