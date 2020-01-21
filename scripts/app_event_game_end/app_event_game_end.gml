/// app_event_game_end()

if (startup_error)
	return false

if (model_temporary = true)
{
	if (question(text_get("questionconfirmsaveexit", model_name)))
		model_save()
	
	// Clear temporary model directory
	directory_delete_lib(temp_model_directory)
}
else
{
	if (model_changed)
		if (question(text_get("questionconfirmexit", model_name)))
			model_save()
}

// Save settings and recent models
settings_save()
recent_save()

log("Closing...")

file_delete_lib(log_previous_file)
file_rename_lib(log_file, log_previous_file)
