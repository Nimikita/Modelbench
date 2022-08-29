/// app_update_backup()

function app_update_backup()
{
	if (window_busy = "" && model_folder != "" && setting_backup && backup_next && current_time > backup_next)
		model_backup()
}
