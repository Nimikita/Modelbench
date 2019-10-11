/// tab_settings_interface()

// Theme
tab_control_togglebutton()
togglebutton_add("settingsthemelight", null, theme_light, setting_theme = theme_light, action_setting_theme)
togglebutton_add("settingsthemedark", null, theme_dark, setting_theme = theme_dark, action_setting_theme)
togglebutton_add("settingsthemedarker", null, theme_darker, setting_theme = theme_darker, action_setting_theme)
draw_togglebutton("settingstheme", dx, dy)
tab_next()

var accentboxx, accentboxy, accentboxw;
accentboxx = dx
accentboxy = dy + 22
accentboxw = (dw - (7*4)) / 5

tab_control((48 * 2) + 7 + 22)
draw_label(text_get("settingsaccentcolor"), dx, accentboxy - 7, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_label)

for (var i = 0; i < 10; i++)
{
	if (draw_accent_item(accentboxx, accentboxy, accentboxw, 48, i) && i = 9)
	{
		// Set to custom accent
		popup_colorpicker_show("settingsaccentcolor", setting_accent_custom, setting_accent_custom, action_setting_accent_custom)
		interface_update()
	}
	
	accentboxx += accentboxw + 7
	
	if (i = 4)
	{
		accentboxx = dx
		accentboxy += 7 + 48
	}
}
tab_next()

// Z is up
tab_control_switch()
draw_switch("settingszisup", dx, dy, setting_z_is_up, action_setting_z_is_up, false)
tab_next()

// Shape outline opacity
tab_control_meter()
draw_meter("settingsshapeoutlineopacity", dx, dy, dw, round(setting_outline_opacity * 100), 48, 0, 100, 15, 1, tab.interface.tbx_outline_opacity, action_setting_shape_outline_opacity)
tab_next()
