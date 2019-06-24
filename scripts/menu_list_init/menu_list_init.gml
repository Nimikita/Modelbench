/// menu_list_init()
/// @desc Runs when a list menu is created.

switch (menu_name)
{
	case "elementeditorbendpart":
	{
		menu_add_item(e_part.RIGHT, text_get("elementeditorbendpartright"), null)
		menu_add_item(e_part.LEFT, text_get("elementeditorbendpartleft"), null)
		menu_add_item(e_part.FRONT, text_get("elementeditorbendpartfront"), null)
		menu_add_item(e_part.BACK, text_get("elementeditorbendpartback"), null)
		menu_add_item(e_part.UPPER, text_get("elementeditorbendpartupper"), null)
		menu_add_item(e_part.LOWER, text_get("elementeditorbendpartlower"), null)
		
		break
	}
}