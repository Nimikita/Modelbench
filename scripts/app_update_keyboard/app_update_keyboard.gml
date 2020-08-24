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
	if (app_check_shortcut(setting_key_new))
		model_create()
	
	if (app_check_shortcut(setting_key_new_template))
		model_create_template()
	
	if (app_check_shortcut(setting_key_open))
		model_load()
	
	if (app_check_shortcut(setting_key_save))
		model_save()
	
	if (app_check_shortcut(setting_key_save_as))
		model_save_as()
	
	if (app_check_shortcut(setting_key_import))
		action_model_import()
	
	if (app_check_shortcut(setting_key_undo))
		action_toolbar_undo()
	
	if (app_check_shortcut(setting_key_redo))
		action_toolbar_redo()
	
	if (app_check_shortcut(setting_key_walk_navigation))
	{
		window_focus = string(content_view)
		window_busy = "viewmovecameratoggle"
		view_click_x = display_mouse_get_x()
		view_click_y = display_mouse_get_y()
	}
	
	if (program_mode = e_mode.MODELING)
	{
		if (app_check_shortcut(setting_key_rename))
			action_el_rename_start()
		
		if (app_check_shortcut(setting_key_delete))
			action_el_remove()
	
		if (app_check_shortcut(setting_key_duplicate))
			action_el_duplicate()
	
		if (app_check_shortcut(setting_key_select_all))
		{
			if (el_edit)
				action_el_deselect_all()
			else
				action_el_select_all()
		}
		
		if (app_check_shortcut(setting_key_uv_editor))
			action_toolbar_show_uv_editor(!setting_show_uv_editor)
		
		// Switch tools
		if (app_check_shortcut(setting_key_tool_select))
			tool_selected = e_tool.SELECT
		
		if (app_check_shortcut(setting_key_tool_pivot))
			tool_selected = e_tool.PIVOT
		
		if (app_check_shortcut(setting_key_tool_move))
			tool_selected = e_tool.MOVE
		
		if (app_check_shortcut(setting_key_tool_rotate))
			tool_selected = e_tool.ROTATE
		
		if (app_check_shortcut(setting_key_tool_scale))
			tool_selected = e_tool.SCALE
		
		if (app_check_shortcut(setting_key_tool_transform))
			tool_selected = e_tool.TRANSFORM
		
		if (app_check_shortcut(setting_key_tool_bend))
			tool_selected = e_tool.BEND
		
		if (app_check_shortcut(setting_key_tool_resize))
			tool_selected = e_tool.RESIZE
		
		// Toggle snapping
		if (app_check_shortcut(setting_key_snap))
			action_setting_snap(!setting_snap)
	}
}
else if (textbox_isediting && keyboard_check_pressed(vk_tab) && textbox_lastfocus.next_tbx)
	window_focus = string(textbox_lastfocus.next_tbx)

if (textbox_isediting && !textbox_isediting_respond)
{
	textbox_isediting = false
	if (window_busy = "")
		window_focus = ""
}

textbox_isediting_respond = false

// Dragger changes
dragger_multiplier = keyboard_check(vk_shift) ? .1 : 1
dragger_snap = setting_snap || keyboard_check(vk_control)
