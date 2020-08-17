/// tab_settings_controls()

dy += 20 
draw_label(text_get("settingsshortcuts") + ":", dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label) 
dy += 8

tab_control(28)
draw_button_collapse("settingscontrolsfile", !setting_collapse_controls_file, action_collapse_controls_file, false)
draw_label(text_get("settingscontrolsfile"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
tab_next()

if (!setting_collapse_controls_file)
{
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
	draw_keycontrol("settingskeysaveas", dx, dy, dw, setting_key_save_as, new_shortcut(ord("S"), true, true), action_setting_key_save_as)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyimport", dx, dy, dw, setting_key_import, new_shortcut(ord("I"), true, false), action_setting_key_import)
	tab_next()
	
	draw_divide(dx, dy, dw)
	dy += 8
}

tab_control(28)
draw_button_collapse("settingscontrolsediting", !setting_collapse_controls_editing, action_collapse_controls_editing, false)
draw_label(text_get("settingscontrolsediting"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
tab_next()

if (!setting_collapse_controls_editing)
{
	tab_control_keycontrol()
	draw_keycontrol("settingskeyundo", dx, dy, dw, setting_key_undo, new_shortcut(ord("Z"), true, false), action_setting_key_undo)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyredo", dx, dy, dw, setting_key_redo, new_shortcut(ord("Y"), true, false), action_setting_key_redo)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyremoveselection", dx, dy, dw, setting_key_remove_selection, new_shortcut(vk_delete, false, false), action_setting_key_remove_selection)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyduplicateselection", dx, dy, dw, setting_key_duplicate_selection, new_shortcut(ord("D"), true, false), action_setting_key_duplicate_selection)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyselectelements", dx, dy, dw, setting_key_select_elements, new_shortcut(ord("A"), true, false), action_setting_key_select_elements)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeyuveditor", dx, dy, dw, setting_key_uv_editor, new_shortcut(ord("E"), true, false), action_setting_key_uv_editor)
	tab_next()
	
	draw_divide(dx, dy, dw)
	dy += 8
}

tab_control(28)
draw_button_collapse("settingscontrolstools", !setting_collapse_controls_tools, action_collapse_controls_tools, false)
draw_label(text_get("settingscontrolstools"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
tab_next()

if (!setting_collapse_controls_tools)
{
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
	draw_keycontrol("settingskeytoolscale", dx, dy, dw, setting_key_tool_scale, new_shortcut(ord("S"), false, false), action_setting_key_tool_scale)
	tab_next(false)
	
	tab_control_keycontrol()
	draw_keycontrol("settingskeytoolbend", dx, dy, dw, setting_key_tool_bend, new_shortcut(ord("G"), false, false), action_setting_key_tool_bend)
	tab_next(false)
	
	tab_control_keycontrol()
	draw_keycontrol("settingskeytooltransform", dx, dy, dw, setting_key_tool_transform, new_shortcut(ord("T"), false, false), action_setting_key_tool_transform)
	tab_next(false)

	tab_control_keycontrol()
	draw_keycontrol("settingskeysnap", dx, dy, dw, setting_key_snap, new_shortcut(ord("F"), false, false), action_setting_key_snap)
	tab_next()
	
	draw_divide(dx, dy, dw)
	dy += 8
}

tab_control(28)
draw_button_collapse("settingscontrolsnavigation", !setting_collapse_controls_navigation, action_collapse_controls_navigation, false)
draw_label(text_get("settingscontrolsnavigation"), dx, dy + 14, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_emphasis)
tab_next()

if (!setting_collapse_controls_navigation)
{
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
	
	draw_divide(dx, dy, dw)
	dy += 8
}
dy += 8

tab_control(36)
if (draw_button_primary("settingsrestoredefaults", dx, dy, dw, null, icons.RESET, fa_center))
{
	if (question(text_get("questionrestoredefaults")))
		action_controls_reset()
}
tab_next()
dy += 8

// Look sensitivity
tab_control_meter()
draw_meter("settingslooksensitivity", dx, dy, dw, setting_look_sensitivity, 48, 0.25, 3, .75, .25, tab.controls.tbx_look_sensitivity, action_setting_look_sensitivity)
tab_next()

dy += 8

// Smooth camera
tab_control_switch()
draw_switch("settingssmoothcamera", dx, dy, setting_smooth_camera, action_setting_smooth_camera, false)
tab_next()

tab_control_switch()
draw_switch("settingslegacycontrols", dx, dy, setting_legacy_controls, action_setting_legacy_controls, false, "settingslegacycontrolscaption")
tab_next()
