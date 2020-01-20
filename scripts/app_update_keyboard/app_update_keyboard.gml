/// app_update_keyboard()
/// @desc Handle keyboard shortcuts.

// Refresh scenery
if (keyboard_check_pressed(vk_f7))
{
	preview_scenery_load()
	
	if (ds_list_size(scenery_list) > 0)
		setting_preview_scenery = scenery_list[|0]
}

if (keyboard_check_pressed(vk_f8))
{
	with (obj_model_element)
	{
		if (element_type = TYPE_SHAPE)
			shape_update_vbuffer()
	}
}

if (keyboard_check_pressed(vk_f9))
	open_url(file_directory)

if (keyboard_check_pressed(vk_f10))
	open_url(working_directory)

if (keyboard_check_pressed(vk_f11))
	open_url(log_file)

if (keyboard_check_pressed(vk_f12))
	debug_info = !debug_info

if (window_busy = "" && !textbox_isediting)
{
	//if (keyboard_check_pressed(setting_key_new) && app_check_control(setting_key_new_control))
	//	action_toolbar_new()
	
	//if (keyboard_check_pressed(setting_key_import_asset) && app_check_control(setting_key_import_asset_control))
	//	action_toolbar_import_asset()
	
	if (keyboard_check_pressed(setting_key_open) && app_check_control(setting_key_open_control))
		model_load()
	
	if (keyboard_check_pressed(setting_key_save) && app_check_control(setting_key_save_control))
		model_save()
	
	if (keyboard_check_pressed(setting_key_undo) && app_check_control(setting_key_undo_control))
		action_toolbar_undo()
	
	if (keyboard_check_pressed(setting_key_redo) && app_check_control(setting_key_redo_control))
		action_toolbar_redo()
	
	if (program_mode = e_mode.MODELING)
	{
		if (keyboard_check_pressed(setting_key_remove_selection) && app_check_control(setting_key_remove_selection_control))
			action_el_remove()
	
		if (keyboard_check_pressed(setting_key_duplicate_selection) && app_check_control(setting_key_duplicate_selection_control))
			action_el_duplicate()
	
		if (keyboard_check_pressed(setting_key_select_elements) && app_check_control(setting_key_select_elements_control)) 
		{
			if (el_edit)
				action_el_deselect_all()
			else
				action_el_select_all()
		}
	
		if (keyboard_check_pressed(setting_key_uv_editor) && app_check_control(setting_key_uv_editor_control))
			action_toolbar_show_uv_editor(!setting_show_uv_editor)
	
		// Switch tools
		if (keyboard_check_pressed(setting_key_tool_select) && app_check_control(setting_key_tool_select_control))
			tool_selected = e_tool.SELECT
		
		if (keyboard_check_pressed(setting_key_tool_pivot) && app_check_control(setting_key_tool_pivot_control))
			tool_selected = e_tool.PIVOT
		
		if (keyboard_check_pressed(setting_key_tool_move) && app_check_control(setting_key_tool_move_control))
			tool_selected = e_tool.MOVE
	
		if (keyboard_check_pressed(setting_key_tool_rotate) && app_check_control(setting_key_tool_rotate_control))
			tool_selected = e_tool.ROTATE
	
		if (keyboard_check_pressed(setting_key_tool_scale) && app_check_control(setting_key_tool_scale_control))
			tool_selected = e_tool.SCALE
	
		if (keyboard_check_pressed(setting_key_tool_transform) && app_check_control(setting_key_tool_transform_control))
			tool_selected = e_tool.TRANSFORM
	
		// Toggle snapping
		if (keyboard_check_pressed(setting_key_snap) && app_check_control(setting_key_snap_control))
			action_setting_snap(!setting_snap)
	}
}
else if (textbox_isediting && keyboard_check_pressed(vk_tab) && textbox_lastfocus.next_tbx)
	window_focus = string(textbox_lastfocus.next_tbx)

// Edit snapping
if (keyboard_check_pressed(setting_key_edit_snap) && app_check_control(setting_key_edit_snap_control) && program_mode = e_mode.MODELING && (setting_snap && window_busy = ""))
{
	if (window_focus = string(tbx_snap_size))
	{
		window_focus = ""
		textbox_lastfocus = -1
	}
	else
		window_focus = string(tbx_snap_size)
}

if (textbox_isediting && !textbox_isediting_respond)
{
	textbox_isediting = false
	if (window_busy = "")
		window_focus = ""
}

textbox_isediting_respond = false
