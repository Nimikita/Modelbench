/// model_save_as()
/// @desc Creates a new model from the saveas dialog settings.

var fn = file_dialog_save_model();

if (fn = "")
	return 0

log("Saving model as new", fn)

load_folder = model_folder
model_folder = filename_dir(fn)
model_file = fn
save_folder = model_folder

model_save()
