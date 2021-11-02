/// action_model_import()

var fn, rootpart;
fn = file_dialog_import_model()

if (fn = "")
	return 0

rootpart = new(obj_model_element)

// Start model importing
var rootmap;
log("Importing model", fn)
rootmap = model_load_start(fn)

if (rootmap = null)
	return 0

// Load model
load_folder = filename_dir(fn)

with (rootpart)
{
	model_load_model(rootmap)
	element_type = TYPE_PART
	name = model_name
	
	ds_list_add(app.part_list, id)
	parent = app
	
	value[e_value.SCA_X] = root_scale
	value[e_value.SCA_Y] = root_scale
	value[e_value.SCA_Z] = root_scale
	
	shape_list = ds_list_create()
	
	if (texture_name != null)
		value[e_value.TEXTURE_OBJ] = res
}

ds_map_destroy(rootmap)

with (obj_model_element)
{
	if (element_type = TYPE_PART)
		el_update_part()
}
textures_list.update = true
app_update_name_warning()
