/// model_create_template()

var fn = file_dialog_open_model_template();

if (fn = "")
	return 0

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
