/// model_save_texture_file(tex)
/// @arg tex
/// @desc Saves a texture file if it doesn't exist relative to the model file

var tex = argument0;

if (!file_exists_lib(app.model_folder + tex.filename))
	sprite_save_lib(tex.sprite, 0, app.model_folder + "//" + tex.filename)

// Update filepaths
if (!app.model_create_wait && !app.model_temporary)
	tex.filepath = app.model_folder + "//" + tex.filename
