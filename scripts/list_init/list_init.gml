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
	
	// Context menu
	case "contextmenuvalue":
	case "contextmenucategory":
	{
		// Single value copy-paste
		if (name = "contextmenuvalue")
		{
			list_add_item(text_get("contextmenuvaluecut"), null, "", null, e_icon.cut, null, action_value_cut, true)
			list_add_item(text_get("contextmenuvaluecopy"), null, "", null, e_icon.copy, null, action_value_copy, false)
		
			var caption = "";
		
			if (context_menu_copy_type = e_value_type.NUMBER)
				caption = string(context_menu_copy)
			else if (context_menu_copy_type = e_value_type.BOOLEAN)
				caption = test(context_menu_copy, "On", "Off")
			else if (context_menu_copy_type = e_value_type.COLOR)
				caption = color_to_hex(context_menu_copy)
			else if (context_menu_copy_type = e_value_type.STRING)
				caption = context_menu_copy
		
			list_add_item(text_get("contextmenuvaluepaste"), null, caption, null, e_icon.paste, null, action_value_paste, false)
			listitem_last.disabled = (context_menu_value_type = e_value_type.NONE || (context_menu_copy_type != context_menu_value_type))
		
			list_add_item(text_get("contextmenuvaluereset"), null, "", null, e_icon.reset, null, action_value_reset, false)
		}
		
		if (context_menu_copy_category != null && context_menu_copy_category.copy != null)
		{
			list_add_item(text_get("contextmenucategorycopy", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, e_icon.copy, null, action_category_copy, true)
			list_add_item(text_get("contextmenucategorypaste", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, e_icon.paste, null, action_category_paste, false)
			list_add_item(text_get("contextmenucategoryreset", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, e_icon.reset, null, action_category_reset, false)
		}
		
		break
	}
	
	case "contextmenutextbox":
	{
		var ctrl = text_get("keycontrol") + " + ";
		list_add_item(text_get("contextmenutextboxcut"), null, ctrl + "X", null, e_icon.cut, null, action_textbox_cut, true)
		listitem_last.disabled = (textbox_select_startpos = textbox_select_endpos)
		
		list_add_item(text_get("contextmenutextboxcopy"), null, ctrl + "C", null, e_icon.copy, null, action_textbox_copy, false)
		listitem_last.disabled = (textbox_select_startpos = textbox_select_endpos)
		
		list_add_item(text_get("contextmenutextboxpaste"), null, ctrl + "V", null, e_icon.paste, null, action_textbox_paste, false)
		listitem_last.disabled = (clipboard_get_text() = "" || !clipboard_has_text())
		
		list_add_item(text_get("contextmenutextboxselectall"), null, ctrl + "A", null, e_icon.edit, null, action_textbox_select_all, false)
		break
	}
	
	case "contextmenutexture":
	{
		list_add_item(text_get("contextmenutexturesetmain"), null, "", null, e_icon.star, null, action_texture_set_main, true)
		listitem_last.disabled = (context_menu_value = app.res)
		
		list_add_item(text_get("contextmenutextureremove"), null, "", null, e_icon.delete, null, action_texture_remove, false)
		listitem_last.disabled = (context_menu_value = app.res)
		
		list_add_item(text_get("contextmenutexturereplace"), null, "", null, e_icon.replace, null, action_texture_replace, false)
		break
	}
	
	case "contextmenukeycontrol":
	{
		list_add_item(text_get("contextmenukeycontrolreset"), null, "", null, e_icon.reset, null, action_keycontrol, true)
		break
	}
	
	case "contextmenuelement":
	{
		list_add_item(text_get("contextmenuelementadd"), null, "", null, e_icon.add, e_icon.arrow_right_small, null, true)
		listitem_last.context_menu_name = "contextmenuaddelement"
		listitem_last.disabled = context_menu_value.element_type = TYPE_SHAPE
		
		list_add_item(text_get("contextmenuelementdelete"), null, "", null, e_icon.delete, null, action_el_remove_single, false)
		break
	}
	
	case "contextmenuaddelement":
	{
		list_add_item(text_get("contextmenuaddelementpart"), e_element.PART, "", null, e_icon.part_add, null, action_element_create_menu, true)
		list_add_item(text_get("contextmenuaddelementblock"), e_element.BLOCK, "", null, e_icon.block_add, null, action_element_create_menu, false)
		list_add_item(text_get("contextmenuaddelementplane"), e_element.PLANE, "", null, e_icon.plane_add, null, action_element_create_menu, false)
		list_add_item(text_get("contextmenuaddelement3dplane"), e_element.PLANE_3D, "", null, e_icon.plane3d_add, null, action_element_create_menu, false)
		break
	}
}

list_update_width(list)

if (ds_list_size(list.item) > 0 && list.item[|0].divider)
	list.item[|0].divider = false

return list