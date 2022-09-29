/// app_startup_interface_context_menu()

function app_startup_interface_context_menu()
{
	enum e_context_type {
		NONE,
		NUMBER,
		STRING,
		BOOLEAN,
		COLOR
	}
	
	enum e_context_group {
		POSITION,
		PIVOT_OFFSET,
		ROTATION,
		SIZE,
		SCALE,
		BEND,
		MATERIAL,
		APPEARANCE,
		WIND,
		MINEIMATOR,
		amount
	}
	
	context_group_copy_list = ds_list_create()
	for (var i = 0; i < e_context_group.amount; i++)
		ds_list_add(context_group_copy_list, null)
	
	context_menu_copy_axis_edit = X
	context_menu_value_type = e_context_type.NONE
	context_menu_value = null
	
	context_menu_copy_type = e_context_type.NONE
	context_menu_copy = null
	
	context_menu_value_script = null
	context_menu_value_default = 0
	
	context_menu_name = ""
	context_menu_ani = ""
	
	context_menu_level_amount = 0
	context_menu_level = ds_list_create()
	context_menu_script = null
	
	context_menu_busy_prev = ""
	
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
	context_menu_group_temp = null
	context_menu_group = null
	
	context_menu_group = null
}
