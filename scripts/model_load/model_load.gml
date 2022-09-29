/// model_load([filename])
/// @arg [filename]
/// @desc Opens a .mimodel or .mbbackup model file.

function model_load()
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
	
	var fn;
	if (argument_count > 0)
		fn = argument[0]
	else
		fn = file_dialog_open_model()
	
	if (fn = "")
		return 0
	
	if (!file_exists_lib(fn))
		return 0
	
	// Save model
	if (save)
	{
		if (!model_save())
			return 0
	}
	model_changed = false
	
	// Start model loading
	var rootmap;
	log("Opening model", fn)
	rootmap = model_load_start(fn)
	if (rootmap = null)
		return 0
	
	model_reset()
	
	model_file = filename_new_ext(fn, ".mimodel")
	model_folder = filename_dir(fn)
	
	save_folder = model_folder
	load_folder = filename_dir(fn)
	log("save_folder", save_folder)
	log("load_folder", load_folder)
	
	// Load model
	model_load_model(rootmap)
	ds_map_destroy(rootmap)
	
	with (obj_model_element)
	{
		if (element_type = TYPE_PART)
			el_update_part()
	}
	
	assets.model_properties.tbx_model_name.text = model_name
	
	res_edit = res
	window_state = ""
	recent_add_wait = true
	
	textures_list.update = true
	
	el_update_lock_tree(false)
	el_update_hidden_tree(false)
}
