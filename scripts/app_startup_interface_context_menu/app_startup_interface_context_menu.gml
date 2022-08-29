/// app_startup_interface_context_menu()

function app_startup_interface_context_menu()
{
	enum e_value_type {
		NONE,
		NUMBER,
		STRING,
		BOOLEAN,
		COLOR
	}
	
	context_menu_copy_axis_edit = X
	context_menu_value_type = e_value_type.NONE
	context_menu_value = null
	
	context_menu_copy_type = e_value_type.NONE
	context_menu_copy = null
	
	context_menu_value_script = null
	context_menu_value_default = 0
	
	context_menu_name = ""
	
	context_menu_level_amount = 0
	context_menu_level = ds_list_create()
	
	context_menu_mouseon = false
	context_menu_mouseon_level = 0
	context_menu_mouseon_item = null
	context_menu_mouseon_reset = false
	
	// Textbox
	context_menu_tbx_action = false
	context_menu_tbx_cut = false
	context_menu_tbx_copy = false
	context_menu_tbx_paste = false
	context_menu_tbx_select_all = false
	
	// Copy/paste categories
	context_menu_copy_category = null
}
