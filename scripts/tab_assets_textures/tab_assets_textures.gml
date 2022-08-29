/// tab_assets_textures()

function tab_assets_textures()
{
	// Preview selected texture
	tab_control(160)
	preview_draw(tex_preview, dx, dy, dw, 160)
	tab_next()
	
	var itemhover = null;
	
	tab_control(ds_list_size(textures_list.item) * 32)
	for (var i = 0; i < ds_list_size(textures_list.item); i++)
	{
		var tex = textures_list.item[|i];
		
		draw_list_item(tex, dx, dy + i * 32, dw, 32, tex.value = res_edit, 4)
		
		if (!itemhover && app_mouse_box(dx, dy + i * 32, dw, 32))
			itemhover = tex
		
		context_menu_area(dx, dy + i * 32, dw, 32, "contextmenutexture", tex.value, null, null, null)
	}
	tab_next()
	
	// Add shortcuts
	if (itemhover != null)
	{
		if (itemhover.value = res_edit)
			shortcut_bar_add(null, e_mouse.LEFT_CLICK, "deselect")
		else
			shortcut_bar_add(null, e_mouse.LEFT_CLICK, "select")
		
		shortcut_bar_add(null, e_mouse.RIGHT_CLICK, "contextmenutexture")
	}
	
	if (res_edit != null)
	{
		tab_control_meter()
		draw_meter("assetstexturescale", dx, dy, dw, res_edit.scale, 16, 1, 32, 1, 1, tab.textures.tbx_texture_scale, action_texture_scale)
		tab_next()
	}
	
	// Add texture
	tab_control(36)
	if (draw_button_primary("assetsaddtexture", dx, dy, 0, null, icons.ADD, fa_center))
	{
		var fn = file_dialog_open_image();
		
		if (fn != "")
			action_texture_add(fn)
	}
	
	tab_next()
}
