/// model_load([filename])
/// @arg [filename]
/// @desc Opens a .mimodel or .mbbackup model file.

var fn;
if (argument_count > 0)
	fn = argument[0]
else
	fn = file_dialog_open_model()
	
if (fn = "")
	return 0
	
var name = filename_new_ext(filename_name(fn), "");

if (!file_exists(fn))
	return 0
	
// Start model loading
var rootmap;
log("Opening model", fn)
rootmap = model_load_start(fn)
if (rootmap = null)
	return 0
	
model_reset()

model_file = filename_new_ext(fn, ".mimodel")
model_folder = filename_dir(fn)

window_set_caption(name + ".mimodel - Modelbench")

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

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE)
		shape_update_vbuffer()
}

res_edit = res
window_state = ""