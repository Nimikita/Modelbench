/// button_menu_list_init()

switch (button_menu_name)
{
	case "startupnewmodeloptions":
	{
		button_menu_add_item(null, text_get("startupstartfromscratch"), e_icon.new_file, model_create)
		button_menu_add_item(null, text_get("startuploadatemplate"), e_icon.new_file_template, model_create_template)
		
		break
	}
}
