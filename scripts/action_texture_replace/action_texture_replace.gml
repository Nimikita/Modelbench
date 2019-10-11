/// action_texture_replace()

var texobj = context_menu_value;

if (!history_undo && !history_redo)
{
	with (texobj)
	{
		var fn = tex_load_browse();
		
		if (fn = "")
			return 0
			
		filename = filename_name(fn)
		load_folder = filename_dir(fn)
		save_folder = app.model_folder
	
		tex_load()
	}
}

with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && res = texobj)
		update_vbuffer = true
}

el_update_part()
textures_list.update = true

if (texobj = res_edit)
{
	tex_preview.update = true
	tex_preview.reset_view = true
}
