/// menu_list_init()
/// @desc Runs when a list menu is created.

switch (menu_name)
{
	case "elementeditorbendpart":
	{
		menu_add_item(e_part.RIGHT, text_get("elementeditorbendpartright"))
		menu_add_item(e_part.LEFT, text_get("elementeditorbendpartleft"))
		menu_add_item(e_part.FRONT, text_get("elementeditorbendpartfront"))
		menu_add_item(e_part.BACK, text_get("elementeditorbendpartback"))
		menu_add_item(e_part.UPPER, text_get("elementeditorbendpartupper"))
		menu_add_item(e_part.LOWER, text_get("elementeditorbendpartlower"))
		
		break
	}
	
	case "elementeditortexture":
	{
		// Inherit texture
		menu_add_item(null, text_get("elementeditorinherittexture"))
		
		// Add all loaded textures in model
		with (obj_texture)
			menu_add_item(id, filename, sprite)
			
		break
	}
	
	case "elementeditorwindaxis":
	{
		menu_add_item(e_vertex_wave.NONE, text_get("elementeditorwindaxisnone"))
		menu_add_item(e_vertex_wave.ALL, text_get("elementeditorwindaxisall"))
		menu_add_item(e_vertex_wave.Z_ONLY, text_get("elementeditorwindaxis" + test(setting_z_is_up, "z", "y")))
		
		break
	}
}