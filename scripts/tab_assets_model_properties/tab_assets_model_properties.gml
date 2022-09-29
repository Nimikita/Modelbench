/// tab_assets_model_properties()

function tab_assets_model_properties()
{
	tab_control_textfield()
	if (draw_textfield("assetsmodelname", dx, dy, dw, 24, tab.model_properties.tbx_model_name, action_model_name, text_get("assetsnewmodel"), "top"))
		model_name = tab.model_properties.tbx_model_name.text
	tab_next()
	
	// Model location
	var directory = ".../" + filename_name(model_folder) + "/" + filename_name(model_file);
	
	tab_control(40)
	draw_label_value(dx, dy, dw - 28, 40, text_get("assetsmodellocation"), model_temporary ? text_get("assetsmodelnotsaved") : directory, true)
	
	if (model_temporary)
	{
		if (draw_button_icon("assetssavemodel", dx + dw - 24 + icon_button_offset, dy + 8, 24, 24, false, icons.SAVE, null, null, "assetssavemodel"))
			model_save()
	}
	else
	{
		if (draw_button_icon("assetsopenfolder", dx + dw - 24 + icon_button_offset, dy + 8, 24, 24, false, icons.FILE, null, null, "assetsopenfolder"))
			open_url(model_folder)
	}
	
	tab_next(true)
	
	tab_control_switch()
	draw_switch("assetsplayerskin", dx, dy, player_skin, action_player_skin, "assetsplayerskinhelp")
	tab_next()
	
	var snapval = (dragger_snap ? setting_snap_size_scale : snap_min);
	
	tab_control_dragger()
	draw_dragger("assetsmodelscale", dx, dy, dragger_width, root_scale, 0.01, snap_min, no_limit, 1, snapval, tab.model_properties.tbx_model_scale, action_model_scale)
	tab_next()
}
