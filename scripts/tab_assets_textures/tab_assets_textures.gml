/// tab_assets_textures()

// Preview selected texture
tab_control(160)
preview_draw(tex_preview, dx, dy, dw, 160)
tab_next()

tab_control(ds_list_size(textures_list.item) * 32)
for (var i = 0; i < ds_list_size(textures_list.item); i++)
{
	var tex = textures_list.item[|i];
	
	draw_list_item(tex, dx, dy + i * 32, dw, 32, tex.value = res_edit, 4)
	
	context_menu_area(dx, dy + i * 32, dw, 32, "contextmenutexture", tex.value, null, null, null)
}
tab_next()

if (res_edit != null)
{
	tab_control_meter()
	draw_meter("assetstexturescale", dx, dy, dw, res_edit.scale, 16, 1, 32, 1, 1, tab.textures.tbx_texture_scale, action_texture_scale)
	tab_next()
}

// Add texture
tab_control(36)
if (draw_button_primary("assetsaddtexture", dx, dy, 0, null, e_icon.add, fa_center))
{
	var fn = file_dialog_open_image();
	
	if (fn != "")
		action_texture_add(fn)
}

tab_next()
