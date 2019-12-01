/// model_save([filename])
/// @arg [filename]

var fn;
if (argument_count > 0)
	fn = argument[0]
else
	fn = model_file

if (model_temporary && !model_temporary_backup)
{
	fn = file_dialog_save_model()
	
	if (fn = "")
		return 0
	
	model_file = fn
	model_folder = filename_dir(fn)
	model_temporary = false
	
	log("Updated model save location", model_file)
}

//log("model_temporary", model_temporary)
log("Saving model", fn)

save_folder = model_folder
load_folder = model_folder
log("save_folder", save_folder)
log("load_folder", load_folder)

debug_timer_start()

model_save_start(fn)
model_save_children()
model_save_done()

// Export texture(s)
with (obj_texture)
	model_save_texture_file(id)

debug_timer_stop("model_save")
log("Model saved")

if (!string_contains(filename_ext(fn), "backup"))
{
	model_changed = false
	
	if (!model_temporary && !model_create_wait)
	{
		recent_add_wait = true
		snackbar_save_model()
	}
}

textures_list.update = true
