/// model_create()

log("Creating model")

log("Using temporary save directory", temp_model_directory)

model_reset()

model_file = temp_model_directory + "temp.mimodel"
model_folder = temp_model_directory
window_state = ""

// Clear temp model directory
var ret = directory_delete_lib(temp_model_directory);
model_create_wait = true
