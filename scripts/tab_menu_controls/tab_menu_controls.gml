/// tab_menu_controls(name)
/// @arg name

var name = argument0;

switch (name)
{
	case "menunewmodel": return text_control_name(setting_key_new);
	case "menunewmodeltemplate": return text_control_name(setting_key_new_template);
	case "menuopenmodel": return text_control_name(setting_key_open);
	case "menusave": return text_control_name(setting_key_save);
	case "menusaveas": return text_control_name(setting_key_save_as);
	case "menuimportmodel": return text_control_name(setting_key_import);
}

return ""
