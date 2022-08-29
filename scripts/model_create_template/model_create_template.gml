/// model_create_template()

function model_create_template()
{
	var save = false;
	
	if (model_changed)
	{
		if (model_temporary)
		{
			if (question(text_get("questionconfirmsaveopen")))
				save = true
		}
		else
		{
			if (question(text_get("questionconfirmopen", model_name)))
				save = true
		}
	}
	
	var fn = file_dialog_open_model_template();
	
	if (fn = "")
		return 0
	
	// Save model
	if (save)
	{
		if (!model_save())
			return 0
	}
	model_changed = false
	
	log("Creating model from template")
	
	model_load(fn)
	
	log("Using temporary save directory", temp_model_directory)
	
	model_file = temp_model_directory + "temp.mimodel"
	model_folder = temp_model_directory
	window_state = ""
	
	save_folder = model_folder
	load_folder = model_folder
	
	// Clear temp model directory
	directory_delete_lib(temp_model_directory)
	model_create_wait = true
	recent_add_wait = false
}
