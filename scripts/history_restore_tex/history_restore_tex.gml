/// history_restore_tex(save)
/// @arg save

var save, tex;
save = argument0
tex = new(obj_texture)

with (save)
	tex_copy(tex)
	
save_folder = app.model_folder
load_folder = app.model_folder

with (tex)
{
	save_id = save.save_id
	
	tex_load(filepath)
	
	// Restore element usage
	for (var s = 0; s < save.usage_el_texture_amount; s++)
	{
		with (save_id_find(save.usage_el_texture_save_id[s]))
			value[e_value.TEXTURE_OBJ] = tex
	}
}

return tex