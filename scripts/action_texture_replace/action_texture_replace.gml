/// action_texture_replace([texture, fn])
/// @arg [texture
/// @arg fn]

function action_texture_replace()
{
	var texobj, fn;
	
	if (argument_count > 0)
	{
		texobj = argument[0]
		fn = argument[1]
	}
	else
	{
		texobj = list_item_value;
		fn = ""
	}
	
	if (!history_undo && !history_redo)
	{
		show_debug_message(list_item_value)
		
		with (texobj)
		{
			if (fn = "")
				fn = tex_load_browse()
			
			if (fn = "")
				return 0
				
			filename = filename_name(fn)
			load_folder = filename_dir(fn)
			save_folder = app.model_folder
			
			tex_load()
		}
	}
	
	with (app)
		el_update_part()
	
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE && res = texobj)
			update_vbuffer = true
	}
	
	textures_list.update = true
	
	if (texobj = res_edit)
	{
		tex_preview.update = true
		tex_preview.reset_view = true
	}
}
