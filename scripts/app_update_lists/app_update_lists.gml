/// app_update_lists()

function app_update_lists()
{
	if (textures_list.update)
	{
		for (var i = 0; i < ds_list_size(textures_list.item); i++)
			instance_destroy(textures_list.item[|i])
		
		ds_list_clear(textures_list.item)
		list_edit = textures_list
		
		with (obj_texture)
			list_add_item(filename + (filepath = "" ? "*" : ""), id, text_get("assetstexturesize", size[X], size[Y]), sprite, null, (id = app.res ? icons.STAR : null), action_texture_select)
		
		textures_list.update = false
		
		list_edit = null
	}
}
