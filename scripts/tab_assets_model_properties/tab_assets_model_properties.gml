/// tab_assets_model_properties()

tab_control(48)
if (draw_textfield("assetsmodelname", dx, dy, dw, 28, model_name, tab.model_properties.tbx_model_name, action_model_name, text_get("assetsmodelname"), "top", model_name = ""))
	model_name = tab.model_properties.tbx_model_name.text
tab_next()

if (model_name ="")
{
	tab_control(8)
	draw_label(text_get("assetsemptymodelname"), dx, dy + 8, fa_left, fa_bottom, c_error, 1, font_caption)
	tab_next()
}

// Model location
tab_control(40)
draw_label(text_get("assetsmodellocation") + ":", dx, dy + 20, fa_left, fa_bottom, c_text_main, a_text_main, font_value)


if (model_temporary)
{
	draw_label(text_get("assetsmodelnotsaved"), dx, dy + 34, fa_left, fa_bottom, c_error, 1, font_caption)
	if (draw_button_icon("assetssavemodel", dx + dw - 24 + icon_button_offset, dy + 8, 24, 24, false, e_icon.save, null, null, "assetssavemodel"))
		model_save()
}
else
{
	var directory = ".../" + filename_name(model_folder) + "/" + filename_name(model_file);
	
	draw_label(directory, dx, dy + 34, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_caption)
	if (draw_button_icon("assetsopenfolder", dx + dw - 24 + icon_button_offset, dy + 8, 24, 24, false, e_icon.open_file, null, null, "assetsopenfolder"))
		open_url(model_folder)
}

tab_next(false)

tab_control_switch()
draw_switch("assetsplayerskin", dx, dy, player_skin, action_player_skin, false, "assetsplayerskinhelp")
tab_next()

tab_control(28)
draw_textfield_num("assetsmodelscale", dx, dy, 86, root_scale, 0.001, snap_min, no_limit, 1, snap_min, tab.model_properties.tbx_model_scale, action_model_scale)
tab_next()
