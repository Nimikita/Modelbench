/// list_init(name)
/// @arg name
/// @desc Makes a list and returns it based on name

var name, list;
name = argument0
list = new_list()
list_edit = list

switch (name)
{
	case "startupnewmodeloptions":
	{
		list_add_item(text_get("startupstartfromscratch"), e_part.FRONT, "", null, e_icon.new_file, null, model_create)
		list_add_item(text_get("startuploadatemplate"), false, "", null, e_icon.new_file_template, null, model_create_template)
		break
	}
	
	case "elementeditorbendpart":
	{
		list_add_item(text_get("elementeditorbendpartright"), e_part.RIGHT, "")
		list_add_item(text_get("elementeditorbendpartleft"), e_part.LEFT, "")
		list_add_item(text_get("elementeditorbendpartfront"), e_part.FRONT, "")
		list_add_item(text_get("elementeditorbendpartback"), e_part.BACK, "")
		list_add_item(text_get("elementeditorbendpartupper"), e_part.UPPER, "")
		list_add_item(text_get("elementeditorbendpartlower"), e_part.LOWER, "")
		
		break
	}
	
	case "elementeditortexture":
	{
		// Inherit texture
		list_add_item(text_get("elementeditorinherittexture"), null, "")
		
		// Add all loaded textures in model
		with (obj_texture)
			list_add_item(filename, id, "", sprite, null, null, null)
		
		break
	}
	
	case "elementeditorwindaxis":
	{
		list_add_item(text_get("elementeditorwindaxisnone"), e_vertex_wave.NONE, "")
		list_add_item(text_get("elementeditorwindaxisall"), e_vertex_wave.ALL, "")
		list_add_item(text_get("elementeditorwindaxis" + test(setting_z_is_up, "z", "y")), e_vertex_wave.Z_ONLY, "")
		
		break
	}
}

list_update_width(list)

return list