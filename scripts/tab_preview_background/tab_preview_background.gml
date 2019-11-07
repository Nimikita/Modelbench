/// tab_preview_background()

var sceneryboxx, sceneryboxy, sceneryboxw;
sceneryboxx = dx
sceneryboxy = dy + 22
sceneryboxw = (dw - (7*4)) / 5

tab_control((48 * 2) + 7 + 22)
draw_label(text_get("previewscenery"), dx, sceneryboxy - 7, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_label)

for (var i = 0; i < 10; i++)
{
	draw_box(sceneryboxx, sceneryboxy, sceneryboxw, 48, false, c_background_secondary, 1)
	
	/*
	if (draw_accent_item(sceneryboxx, sceneryboxy, sceneryboxw, 48, i) && i = 9)
	{
		// Set to custom accent
		popup_colorpicker_show("settingsaccentcolor", setting_accent_custom, setting_accent_custom, action_setting_accent_custom)
		interface_update()
	}
	*/
	
	sceneryboxx += sceneryboxw + 7
	
	if (i = 4)
	{
		sceneryboxx = dx
		sceneryboxy += 7 + 48
	}
}
tab_next()
