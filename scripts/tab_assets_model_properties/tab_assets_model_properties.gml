/// tab_assets_model_properties()

tab_control(48)
if (draw_textfield("assetsmodelname", dx, dy, dw, model_name, tab.model_properties.tbx_model_name, null, text_get("assetsmodelname")))
	model_name = tab.model_properties.tbx_model_name.text
tab_next()

tab_control_switch()
draw_switch("assetsplayerskin", dx, dy, player_skin, action_player_skin, "assetsplayerskinhelp")
tab_next()

//tab_control_meter()
//draw_meter("assetsmodelscale", dx, dy, dw, round(root_scale * 100), 48, 25, 1000, 100, 25, tab.model_properties.tbx_model_scale, action_model_scale)
//tab_next()
