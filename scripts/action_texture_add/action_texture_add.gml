/// action_texture_add(filename)
/// @arg filename

if (history_undo)
{
	with (history_data)
		history_destroy_loaded()
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
	
	if (!history_redo && !tex.replaced)
	{
		with (hobj)
		{
			filename = fn
			history_save_loaded()
		}
	}
}

textures_list.update = true