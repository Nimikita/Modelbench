/// app_update_lists()

function app_update_lists()
{
	if (list_item_script != null)
	{
		if (list_item_script_value = undefined)
			script_execute(list_item_script)
		else
			script_execute(list_item_script, list_item_script_value)
	
		list_item_script = null
		list_item_script_value = null
		list_item_value = null
	}
	
	if (textures_list.update)
	{
		for (var i = 0; i < ds_list_size(textures_list.item); i++)
			instance_destroy(textures_list.item[|i])
		
		ds_list_clear(textures_list.item)
		list_edit = textures_list
		
		with (obj_texture)
			list_item_add(filename + (filepath = "" ? "*" : ""), id, "", sprite, null, (id = app.res ? icons.STAR : null), action_texture_select)
		
		textures_list.update = false
		
		list_edit = null
	}
}
