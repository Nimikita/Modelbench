/// model_create()

var save = false;

if (model_changed)
{
	if (model_temporary)
	{
		if (question(text_get("questionconfirmsavenew")))
			save = true
	}
	else
	{
		if (question(text_get("questionconfirmnew")))
			save = true
	}
}

// Save model
if (save)
{
	if (!model_save())
		return 0
		
	model_changed = false
}

log("Creating model")

log("Using temporary save directory", temp_model_directory)

model_reset()

model_file = temp_model_directory + "temp.mimodel"
model_folder = temp_model_directory
window_state = ""

// Clear temp model directory
directory_delete_lib(temp_model_directory)
model_create_wait = true

// Add default texture to model
res_edit = new(obj_texture)
res_edit.sprite = sprite_duplicate(spr_empty)
res_edit.size = point2D(16, 16)
res_edit.filename = text_get("assetsdefaulttexture") + ".png"
res = res_edit
