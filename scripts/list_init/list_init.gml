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
		list_add_item(text_get("startupstartfromscratch"), e_part.FRONT, "", null, icons.NEW_FILE, null, model_create)
		list_add_item(text_get("startuploadatemplate"), false, "", null, icons.NEW_FILE_TEMPLATE, null, model_create_template)
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
		list_add_item(text_get("elementeditorwindaxis" + (setting_z_is_up ? "z" : "y")), e_vertex_wave.Z_ONLY, "")
		
		break
	}
	
	case "exportmode":
	{
		list_add_item(text_get("exportmodecombineall"), e_export.COMBINE_ALL, "")
		list_add_item(text_get("exportmodeseperateparts"), e_export.SEPERATE_PARTS, "")
		list_add_item(text_get("exportmodeseperateshapes"), e_export.SEPERATE_SHAPES, "")
		
		break
	}
	
	case "settingslanguage":
	{
		var file, name, locale, err;
		file = file_find_first(languages_directory + "*.mblanguage", 0)
		mouse_cursor = cr_hourglass
		
		// Read each file's language key
		while (file != "")
		{
			// Convert unicode (external)
			var convfn = file_directory + "conv.tmp";
			json_file_convert_unicode(languages_directory + file, convfn)
			
			if (!file_exists_lib(convfn))
			{
				file = file_find_next()
				continue
			}
			
			var json = json_load(convfn);
			name = filename_name(file)
			locale = ""
			err = false
			
			if (ds_map_valid(json))
			{
				if (!is_undefined(json[?"file/"]))
				{
					var filemap = json[? "file/"];
					name = value_get_string(filemap[?"language"], name)
					locale = value_get_string(filemap[?"locale"], "")
				}
				
				ds_map_destroy(json)
			}
			else
				err = true
			
			list_add_item(name, filename_name(file), locale, null, null, err ? icons.WARNING : null, null)
			file = file_find_next()
		}
		file_find_close()
		
		break
	}
	
	case "settingsfeatureset":
	{
		list_add_item(text_get("settingsfeaturesetmimodel"), e_features.MIMODEL, ".mimodel")
		list_add_item(text_get("settingsfeaturesetobj"), e_features.OBJ, ".obj")
		break
	}
	
	// Context menu
	case "contextmenuvalue":
	case "contextmenucategory":
	{	
		// Combine scale
		if (context_menu_copy_category != null && context_menu_copy_category.name = "scale")
		{
			var text = (setting_combine_scale ? "contextmenuseperatescale" : "contextmenucombinescale");
			list_add_item(text_get(text), null, "", null, icons.TOOLSET_SCALE, null, action_category_combine_scale, true)
		}
		
		// Offset centering
		if (context_menu_copy_category != null && context_menu_copy_category = element_editor.pivot_offset)
			list_add_item(text_get("contextmenucenteraxis"), null, "", null, icons.PIVOT, null, action_el_offset_center, true)
		
		// Single value copy-paste
		if (name = "contextmenuvalue")
		{
			list_add_item(text_get("contextmenuvaluecut"), null, "", null, icons.CUT, null, action_value_cut, true)
			list_add_item(text_get("contextmenuvaluecopy"), null, "", null, icons.COPY, null, action_value_copy, false)
		
			var caption = "";
		
			if (context_menu_copy_type = e_value_type.NUMBER)
				caption = string(context_menu_copy)
			else if (context_menu_copy_type = e_value_type.COLOR)
				caption = color_to_hex(context_menu_copy)
			else if (context_menu_copy_type = e_value_type.STRING)
				caption = context_menu_copy
		
			list_add_item(text_get("contextmenuvaluepaste"), null, caption, null, icons.PASTE, null, action_value_paste, false)
			listitem_last.disabled = (context_menu_value_type = e_value_type.NONE || (context_menu_copy_type != context_menu_value_type))
		
			list_add_item(text_get("contextmenuvaluereset"), null, "", null, icons.RESET, null, action_value_reset, false)
		}
		
		if (context_menu_copy_category != null && context_menu_copy_category.copy != null)
		{
			list_add_item(text_get("contextmenucategorycopy", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, icons.COPY_ALL, null, action_category_copy, true)
			list_add_item(text_get("contextmenucategorypaste", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, icons.PASTE_ALL, null, action_category_paste, false)
			list_add_item(text_get("contextmenucategoryreset", text_get("contextmenucategory" + context_menu_copy_category.name)), context_menu_copy_category, "", null, icons.RESET_ALL, null, action_category_reset, false)
		}
		
		break
	}
	
	case "contextmenutextbox":
	{
		var ctrl = text_get("keycontrol") + " + ";
		list_add_item(text_get("contextmenutextboxcut"), null, ctrl + "X", null, icons.CUT, null, action_textbox_cut, true)
		listitem_last.disabled = (textbox_select_startpos = textbox_select_endpos)
		
		list_add_item(text_get("contextmenutextboxcopy"), null, ctrl + "C", null, icons.COPY, null, action_textbox_copy, false)
		listitem_last.disabled = (textbox_select_startpos = textbox_select_endpos)
		
		list_add_item(text_get("contextmenutextboxpaste"), null, ctrl + "V", null, icons.PASTE, null, action_textbox_paste, false)
		listitem_last.disabled = (clipboard_get_text() = "" || !clipboard_has_text())
		
		list_add_item(text_get("contextmenutextboxselectall"), null, ctrl + "A", null, icons.SELECT_ALL, null, action_textbox_select_all, false)
		break
	}
	
	case "contextmenutexture":
	{
		list_add_item(text_get("contextmenutexturesetmain"), null, "", null, icons.STAR, null, action_texture_set_main, true)
		listitem_last.disabled = (context_menu_value = app.res)
		
		list_add_item(text_get("contextmenutextureremove"), null, "", null, icons.DELETE, null, action_texture_remove, false)
		listitem_last.disabled = (context_menu_value = app.res)
		
		list_add_item(text_get("contextmenutexturereplace"), null, "", null, icons.REPLACE, null, action_texture_replace, false)
		
		list_add_item(text_get("contextmenutexturerefresh"), null, "", null, icons.REFRESH, null, action_texture_refresh, false)
		listitem_last.disabled = (context_menu_value.filepath = "")
		
		list_add_item(text_get("contextmenutexturesaveuvmap"), null, "", null, icons.TEXTURE_UVMAP, null, action_texture_save_uv_map, false)
		break
	}
	
	case "contextmenukeycontrol":
	{
		list_add_item(text_get("contextmenukeycontrolreset"), null, "", null, icons.RESET, null, action_keycontrol, true)
		break
	}
	
	case "contextmenuelement":
	{
		list_add_item(text_get("contextmenuelementadd"), null, "", null, icons.ADD, icons.ARROW_RIGHT_SMALL, null, true)
		listitem_last.context_menu_name = "contextmenuaddelement"
		listitem_last.disabled = (context_menu_value.element_type = TYPE_SHAPE)
		
		list_add_item(text_get("contextmenuelementrename"), null, text_control_name(setting_key_rename), null, icons.RENAME, null, action_el_rename_start, false)
		listitem_last.disabled = (el_edit = null)
		
		list_add_item(text_get("contextmenuelementduplicate"), null, text_control_name(setting_key_duplicate), null, icons.DUPLICATE, null, action_el_duplicate, false)
		listitem_last.disabled = (el_edit = null)
		
		list_add_item(text_get("contextmenuelementdelete"), null, text_control_name(setting_key_delete), null, icons.DELETE, null, action_el_remove, false)
		listitem_last.disabled = (el_edit = null)
		
		list_add_item(text_get("contextmenuviewportselectall"), null, text_control_name(setting_key_select_all), null, icons.SELECT_ALL, null, action_el_select_all, true)
		list_add_item(text_get("contextmenuelementexpandall"), null, "", null, icons.EXPAND_ALL, null, action_expand_all, false)
		list_add_item(text_get("contextmenuelementcollapseall"), null, "", null, icons.COLLAPSE_ALL, null, action_collapse_all, false)
		break
	}
	
	case "contextmenuaddelement":
	{
		list_add_item(text_get("contextmenuaddelementpart"), e_element.PART, "", null, icons.PART_ADD, null, action_element_create_menu, true)
		list_add_item(text_get("contextmenuaddelementblock"), e_element.BLOCK, "", null, icons.BLOCK_ADD, null, action_element_create_menu, false)
		list_add_item(text_get("contextmenuaddelementplane"), e_element.PLANE, "", null, icons.PLANE_ADD, null, action_element_create_menu, false)
		list_add_item(text_get("contextmenuaddelement3dplane"), e_element.PLANE_3D, "", null, icons.PLANE3D_ADD, null, action_element_create_menu, false)
		break
	}
	
	case "contextmenuurl":
	{
		list_add_item(text_get("contextmenucopylink"), context_menu_value, "", null, icons.LINK, null, action_copy_text, true)
		break
	}
	
	case "contextmenuviewport":
	{
		if (context_menu_value = view_cam_viewport)
		{
			list_add_item(text_get("contextmenuelementadd"), null, "", null, icons.ADD, icons.ARROW_RIGHT_SMALL, null, true)
			listitem_last.context_menu_name = "contextmenuviewportaddelement"
		
			list_add_item(text_get("contextmenuelementrename"), null, text_control_name(setting_key_rename), null, icons.RENAME, null, action_el_rename_start, false)
			listitem_last.disabled = (el_edit = null)
		
			list_add_item(text_get("contextmenuelementduplicate"), null, text_control_name(setting_key_duplicate), null, icons.DUPLICATE, null, action_el_duplicate, false)
			listitem_last.disabled = (el_edit = null)
		
			list_add_item(text_get("contextmenuelementdelete"), null, text_control_name(setting_key_delete), null, icons.DELETE, null, action_el_remove, false)
			listitem_last.disabled = (el_edit = null)
		
			list_add_item(text_get("contextmenuviewportselectall"), null, text_control_name(setting_key_select_all), null, icons.SELECT_ALL, null, action_el_select_all, true)
		}
		
		list_add_item(text_get("contextmenuresetview"), null, "", null, icons.RESET, null, camera_reset_context_menu)
		
		break
	}
	
	case "contextmenuviewportaddelement":
	{
		list_add_item(text_get("contextmenuaddelementpart"), e_element.PART, "", null, icons.PART_ADD, null, action_element_create, true)
		list_add_item(text_get("contextmenuaddelementblock"), e_element.BLOCK, "", null, icons.BLOCK_ADD, null, action_element_create, false)
		list_add_item(text_get("contextmenuaddelementplane"), e_element.PLANE, "", null, icons.PLANE_ADD, null, action_element_create, false)
		list_add_item(text_get("contextmenuaddelement3dplane"), e_element.PLANE_3D, "", null, icons.PLANE3D_ADD, null, action_element_create, false)
		break
	}
	
	case "toolsetsnapmode":
	{
		list_add_item(text_get("toolsetsnapmodeabsolute"), e_snap_mode.ABSOLUTE, "", null, null, null, null, true)
		list_add_item(text_get("toolsetsnapmodelocal"), e_snap_mode.LOCAL, "", null, null, null, null, false)
		break
	}
	
	case "contextmenuuveditor":
	{
		list_add_item(text_get("contextmenuresetview"), null, "", null, icons.RESET, null, uv_editor_reset_view)
		break
	}
}

list_update_width(list)

if (ds_list_size(list.item) > 0 && list.item[|0].divider)
	list.item[|0].divider = false

list_edit = null

return list