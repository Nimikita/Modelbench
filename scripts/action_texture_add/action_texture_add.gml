/// action_texture_add(filename)
/// @arg filename

if (history_undo)
{
	with (history_data)
	{
		with (save_id_find(tex_save_id))
		{
			if (object_index = obj_texture && copied)
				file_delete_lib(app.model_folder + "\\" + filename)
			instance_destroy()
		}
	}
}
else
{
	var fn, tex, hobj;
	
	if (history_redo)
		fn = history_data.filename
	else
	{
		fn = argument0
		hobj = history_set(action_texture_add)
	}
	
	tex = new_tex(fn)
	
	with (tex)
	{
		loaded = true
		tex_load()
	}
	
	if (history_redo)
		tex.save_id = history_data.tex_save_id
	
	if (!history_redo && !tex.replaced)
	{
		with (hobj)
		{
			filename = fn
			tex_save_id = tex.save_id
		}
	}
}

el_update_part()
textures_list.update = true

model_reset_loaded()