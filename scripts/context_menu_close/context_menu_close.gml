/// context_menu_close()

function context_menu_close()
{
	if (context_menu_name = "")
		return 0
	
	context_menu_name = ""
	context_menu_value = null
	
	context_menu_mouseon = false
	
	context_menu_level_amount = 0
	context_menu_mouseon_level = 0
	ds_list_clear(context_menu_level)
		
	with (obj_context_menu_level)
	{
		list_destroy(level_list)
		instance_destroy()
	}
}
