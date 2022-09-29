/// tab_settings_controls()

function tab_settings_controls()
{
	tab_control(20)
	draw_label(text_get("settingscontrolskeybinds") + ":", dx, dy + 10, fa_left, fa_middle, c_text_tertiary, a_text_tertiary, font_label) 
	tab_next()
	
	tab_control_switch()
	draw_button_collapse("file", collapse_map[?"file"], null, true, "settingscontrolsfile")
	tab_next()
	
	if (collapse_map[?"file"])
	{
		tab_collapse_start()
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeynew", dx, dy, dw, setting_key_new, new_shortcut(ord("N"), true, false), action_setting_key_new)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeynewtemplate", dx, dy, dw, setting_key_new_template, new_shortcut(ord("N"), true, true), action_setting_key_new_template)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyopen", dx, dy, dw, setting_key_open, new_shortcut(ord("O"), true, false), action_setting_key_open)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeysave", dx, dy, dw, setting_key_save, new_shortcut(ord("S"), true, false), action_setting_key_save)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeysaveas", dx, dy, dw, setting_key_save_as, new_shortcut(ord("S"), true, true), action_setting_key_save_as)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyimport", dx, dy, dw, setting_key_import, new_shortcut(ord("I"), true, false), action_setting_key_import)
		tab_next()
		
		tab_collapse_end(true)
	}
	
	tab_control_switch()
	draw_button_collapse("edit", collapse_map[?"edit"], null, true, "settingscontrolsediting")
	tab_next()
	
	if (collapse_map[?"edit"])
	{
		tab_collapse_start()
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyundo", dx, dy, dw, setting_key_undo, new_shortcut(ord("Z"), true, false), action_setting_key_undo)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyredo", dx, dy, dw, setting_key_redo, new_shortcut(ord("Y"), true, false), action_setting_key_redo)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyrename", dx, dy, dw, setting_key_rename, new_shortcut(vk_f2, false, false), action_setting_key_rename)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeydelete", dx, dy, dw, setting_key_delete, new_shortcut(vk_delete, false, false), action_setting_key_delete)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyduplicate", dx, dy, dw, setting_key_duplicate, new_shortcut(ord("D"), true, false), action_setting_key_duplicate)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyselectall", dx, dy, dw, setting_key_select_all, new_shortcut(ord("A"), true, false), action_setting_key_select_all)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyuveditor", dx, dy, dw, setting_key_uv_editor, new_shortcut(ord("E"), true, false), action_setting_key_uv_editor)
		tab_next()
		
		tab_collapse_end(true)
	}
	
	tab_control_switch()
	draw_button_collapse("tools", collapse_map[?"tools"], null, true, "settingscontrolstools")
	tab_next()
	
	if (collapse_map[?"tools"])
	{
		tab_collapse_start()
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolselect", dx, dy, dw, setting_key_tool_select, new_shortcut(ord("W"), false, false), action_setting_key_tool_select)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolpivot", dx, dy, dw, setting_key_tool_pivot, new_shortcut(ord("Q"), false, false), action_setting_key_tool_pivot)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolmove", dx, dy, dw, setting_key_tool_move, new_shortcut(ord("G"), false, false), action_setting_key_tool_move)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolrotate", dx, dy, dw, setting_key_tool_rotate, new_shortcut(ord("R"), false, false), action_setting_key_tool_rotate)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolresize", dx, dy, dw, setting_key_tool_resize, new_shortcut(ord("Z"), false, false), action_setting_key_tool_resize)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolscale", dx, dy, dw, setting_key_tool_scale, new_shortcut(ord("S"), false, false), action_setting_key_tool_scale)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytoolbend", dx, dy, dw, setting_key_tool_bend, new_shortcut(ord("B"), false, false), action_setting_key_tool_bend)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeytooltransform", dx, dy, dw, setting_key_tool_transform, new_shortcut(ord("T"), false, false), action_setting_key_tool_transform)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeysnap", dx, dy, dw, setting_key_snap, new_shortcut(ord("F"), false, false), action_setting_key_snap)
		tab_next()
		
		tab_collapse_end(true)
	}
	
	tab_control_switch()
	draw_button_collapse("camera", collapse_map[?"camera"], null, true, "settingscontrolscamera")
	tab_next()
	
	if (collapse_map[?"camera"])
	{
		tab_collapse_start()
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeywalknavigation", dx, dy, dw, setting_key_walk_navigation, new_shortcut(ord("F"), false, true), action_setting_key_walk_navigation)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyforward", dx, dy, dw, setting_key_forward, new_shortcut(ord("W"), false, false), action_setting_key_forward, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyback", dx, dy, dw, setting_key_back, new_shortcut(ord("S"), false, false), action_setting_key_back, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyleft", dx, dy, dw, setting_key_left, new_shortcut(ord("A"), false, false), action_setting_key_left, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyright", dx, dy, dw, setting_key_right, new_shortcut(ord("D"), false, false), action_setting_key_right, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyascend", dx, dy, dw, setting_key_ascend, new_shortcut(ord("E"), false, false), action_setting_key_ascend, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeydescend", dx, dy, dw, setting_key_descend, new_shortcut(ord("Q"), false, false), action_setting_key_descend, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyreset", dx, dy, dw, setting_key_reset, new_shortcut(ord("R"), false, false), action_setting_key_reset, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyfast", dx, dy, dw, setting_key_fast, new_shortcut(vk_space, false, false), action_setting_key_fast, true)
		tab_next(false)
		
		tab_control_keycontrol()
		draw_keycontrol("settingskeyslow", dx, dy, dw, setting_key_slow, new_shortcut(vk_lshift, false, false), action_setting_key_slow, true)
		tab_next()
		
		tab_collapse_end(true)
	}
	
	// Look sensitivity
	tab_control_dragger()
	draw_dragger("settingslooksensitivity", dx, dy, dragger_width, setting_look_sensitivity, 0.01, 0, no_limit, 1, 0, tab.controls.tbx_look_sensitivity, action_setting_look_sensitivity)
	tab_next()
	
	// Restore controls
	tab_control_button_label()
	if (draw_button_label("settingsrestoredefaults", floor(dx + dw/2), dy, null, icons.RESET, e_button.PRIMARY, null, e_anchor.CENTER))
	{
		if (question(text_get("questionrestoredefaults")))
			action_controls_reset()
	}
	tab_next()
	
	// Smooth camera
	tab_control_switch()
	draw_switch("settingssmoothcamera", dx, dy, setting_smooth_camera, action_setting_smooth_camera)
	tab_next()
	
	tab_control_togglebutton()
	togglebutton_add("settingsviewportmousecontrolsleft", null, false, setting_viewport_controls_middle = false, action_setting_viewport_controls_middle)
	togglebutton_add("settingsviewportmousecontrolsmiddle", null, true, setting_viewport_controls_middle = true, action_setting_viewport_controls_middle)
	draw_togglebutton("settingsviewportmousecontrols", dx, dy)
	tab_next()
}
