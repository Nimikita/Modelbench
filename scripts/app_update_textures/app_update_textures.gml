/// app_update_textures()
/// @desc Refreshes all textures in the current model when the window is refocused

function app_update_textures()
{
	if (!setting_refresh_textures)
		return 0
	
	if (window_in_focus != window_has_focus())
	{
		window_in_focus = window_has_focus()
		
		if (window_in_focus)
		{
			with (obj_texture)
				tex_refresh(id)
			
			textures_list.update = true
			tex_preview.update = true
			
			with (obj_model_element)
			{
				if (element_type = TYPE_SHAPE)
					update_vbuffer = true
			}
		}
	}
}
