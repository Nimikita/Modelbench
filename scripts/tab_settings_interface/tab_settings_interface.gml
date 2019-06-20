/// tab_settings_interface()

// Dark theme
tab_control_switch()
draw_switch("settingsdarktheme", dx, dy, setting_dark_theme, action_setting_dark_theme)
tab_next()

var accentboxx, accentboxy, accentboxw;
accentboxx = dx
accentboxy = dy + 22
accentboxw = (dw - (7*4)) / 5

tab_control((48 * 2) + 7 + 22)
draw_label(text_get("settingsaccentcolor"), dx, accentboxy - 7, fa_left, fa_bottom, c_neutral60, a_neutral60, font_label)

for (var i = 0; i < 10; i++)
{
	draw_accent_item(accentboxx, accentboxy, accentboxw, 48, i)
	
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
draw_switch("settingszisup", dx, dy, setting_z_is_up, action_setting_z_is_up)
tab_next()

// Shape outline opacity
tab_control_meter()
draw_meter("settingsshapeoutlineopacity", dx, dy, dw, round(setting_outline_opacity * 100), 48, 0, 100, 15, 1, tab.interface.tbx_outline_opacity, action_setting_shape_outline_opacity)
tab_next()
