/// app_startup_interface_settings_menus()

function app_startup_interface_settings_menus()
{
	// Button menu
	settings_menu_name = ""
	
	settings_menu_ani = 0
	settings_menu_ani_type = ""
	//settings_menu_window = e_window.MAIN
	
	settings_menu_x = 0
	settings_menu_y = 0
	settings_menu_w = 0
	settings_menu_h = 0
	settings_menu_h_max = null
	
	settings_menu_button_w = 0
	settings_menu_button_h = 0
	
	settings_menu_amount = 0
	settings_menu_primary = false
	settings_menu_script = null
	settings_menu_above = false
	
	settings_menu_list = null
	settings_menu_amount = 0
	settings_menu_busy_prev = ""
	settings_menu_scroll = new_obj(obj_scrollbar)
	
	settings_menu_steps = 0
	
	colorpicker_startup()
}
