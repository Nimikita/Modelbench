/// action_texture_refresh()

function action_texture_refresh()
{
	var texobj = list_item_value;
	
	tex_refresh(texobj)
	
	textures_list.update = true
	
	if (texobj = res_edit)
	{
		tex_preview.update = true
		tex_preview.reset_view = true
	}
}
