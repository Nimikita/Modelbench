/// model_create()

log("Creating model")

log("Using temporary save directory", temp_model_directory)

model_reset()

model_file = temp_model_directory + "temp.mimodel"
model_folder = temp_model_directory
window_state = ""

// Clear temp model directory
directory_destroy(temp_model_directory)
model_create_wait = true

// Add default texture to model
res_edit = new(obj_texture)
res_edit.sprite = sprite_duplicate(spr_empty)
res_edit.size = point2D(16, 16)
res_edit.filename = text_get("assetsdefaulttexture") + ".png"
res = res_edit
