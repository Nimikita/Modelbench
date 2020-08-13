/// tab_menu_controls(name)
/// @arg name

var name = argument0;

switch (name)
{
	case "menunewmodel": return text_control_name(setting_key_new, setting_key_new_control);
	case "menunewmodeltemplate": return text_get("keyshift") + " + " + text_control_name(setting_key_new, setting_key_new_control);
	case "menuopenmodel": return text_control_name(setting_key_open, setting_key_open_control);
	case "menusave": return text_control_name(setting_key_save, setting_key_save_control);
	case "menusaveas": return text_get("keyshift") + " + " + text_control_name(setting_key_save, setting_key_save_control);
	case "menuimportmodel": return text_control_name(setting_key_import, setting_key_import_control);
}

return ""
