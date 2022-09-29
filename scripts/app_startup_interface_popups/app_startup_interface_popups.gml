/// app_startup_interface_popups()

function app_startup_interface_popups()
{
	// About popup
	popup_about = new_popup("about", popup_about_draw, 542, 480, false, true)
	
	// OBJ export popup
	popup_export = new_popup("export", popup_export_draw, 300, 94, true, true)
}
