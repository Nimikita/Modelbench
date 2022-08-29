/// action_open_settings()

function action_open_settings()
{
	if (popup = popup_about)
		popup_close()
	
	menu_panel_ext = settings
	menu_panel_ext_ani_type = "show"
}
