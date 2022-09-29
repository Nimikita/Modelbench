/// tab_settings_interface()

function tab_settings_interface()
{
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
		if (draw_button_accent(accentboxx, accentboxy, accentboxw, 48, i) && i = 9)
		{
			// Set to custom accent
			colorpicker_show("settingsaccentcolor", setting_accent_custom, setting_accent_custom, action_setting_accent_custom, accentboxx, accentboxy, accentboxw, 48)
			update_interface_wait = true
		}
		
		accentboxx += accentboxw + 7
		
		if (i = 4)
		{
			accentboxx = dx
			accentboxy += 7 + 48
		}
	}
	tab_next()
	
	dy += 5
	
	// Language
	tab_control_menu()
	draw_button_menu("settingslanguage", e_menu.LIST, dx, dy, dw - (24 + icon_button_offset), 24, setting_language_filename, text_get("filelanguage"), action_setting_language, false, null, null, text_get("filelocale"))
	
	if (draw_button_icon("settingsopenlanguagefolder", dx + dw - 24 + icon_button_offset, dy + 18, 24, 24, false, icons.FOLDER, null, false, "settingsopenlanguagefolder"))
		open_url(languages_directory)
	
	tab_next()
	
	// Z is up
	tab_control_switch()
	draw_switch("settingszisup", dx, dy, setting_z_is_up, action_setting_z_is_up)
	tab_next()
	
	// Display shared texture UVs(UV editor)
	tab_control_switch()
	draw_switch("settingssharedtextureuvs", dx, dy, setting_shared_texture_uvs, action_setting_shared_texture_uvs, "settingssharedtextureuvshelp")
	tab_next()
	
	// Reduced motion
	tab_control_switch()
	draw_switch("settingsreducedmotion", dx, dy, setting_reduced_motion, action_setting_reduced_motion)
	tab_next()
}
