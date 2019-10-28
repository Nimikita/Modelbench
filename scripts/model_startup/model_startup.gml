/// model_startup()

globalvar load_format, load_folder, save_folder, el_edit, el_edit_amount, res_edit,
		  axis_edit, save_id_seed;

el_edit = null
el_edit_amount = 0
res_edit = null
axis_edit = null

save_id = "root"
save_id_seed = random_get_seed()
extend = false

part_list = ds_list_create()
shape_list = null
res = null

model_file = ""
model_folder = ""
model_create_wait = false

model_name = ""
player_skin = true
root_scale = vec3(1)
model_temporary = false
model_changed = false

warning_empty_part_names = false
warning_same_part_names = false

update_vbuffer_list = ds_list_create()

// Recover model from previous session
if (file_exists_lib(temp_model_backup))
	snackbar_recover_model()
