/// tab_settings_controls()

// Interface shortcuts
dy += 20
draw_label(text_get("settingsinterfaceshortcuts"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label)

tab_control_keycontrol()
draw_keycontrol("settingskeyopen", dx, dy, dw, setting_key_open, setting_key_open_control, ord("O"), true, action_setting_key_open)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeysave", dx, dy, dw, setting_key_save, setting_key_save_control, ord("S"), true, action_setting_key_save)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyundo", dx, dy, dw, setting_key_undo, setting_key_undo_control, ord("Z"), true, action_setting_key_undo)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyredo", dx, dy, dw, setting_key_redo, setting_key_redo_control, ord("Y"), true, action_setting_key_redo)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyremoveelements", dx, dy, dw, setting_key_remove_elements, setting_key_remove_elements_control, ord("R"), true, action_setting_key_remove_elements)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyduplicateelements", dx, dy, dw, setting_key_duplicate_elements, setting_key_duplicate_elements_control, ord("D"), true, action_setting_key_duplicate_elements)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyselectelements", dx, dy, dw, setting_key_select_elements, setting_key_select_elements_control, ord("A"), true, action_setting_key_select_elements)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyuveditor", dx, dy, dw, setting_key_uv_editor, setting_key_uv_editor_control, ord("E"), true, action_setting_key_uv_editor)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolselect", dx, dy, dw, setting_key_tool_select, setting_key_tool_select_control, ord("W"), false, action_setting_key_tool_select)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolmove", dx, dy, dw, setting_key_tool_move, setting_key_tool_move_control, ord("G"), false, action_setting_key_tool_move)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolrotate", dx, dy, dw, setting_key_tool_rotate, setting_key_tool_rotate_control, ord("R"), false, action_setting_key_tool_rotate)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolscale", dx, dy, dw, setting_key_tool_scale, setting_key_tool_scale_control, ord("S"), false, action_setting_key_tool_scale)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytooltransform", dx, dy, dw, setting_key_tool_transform, setting_key_tool_transform_control, ord("T"), false, action_setting_key_tool_transform)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeysnap", dx, dy, dw, setting_key_snap, setting_key_snap_control, ord("F"), false, action_setting_key_snap)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyeditsnap", dx, dy, dw, setting_key_edit_snap, setting_key_edit_snap_control, ord("F"), true, action_setting_key_edit_snap)
tab_next(false)

// Camera shortcuts
dy += 20
draw_label(text_get("settingscamerashortcuts"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label)

tab_control_keycontrol()
draw_keycontrol("settingskeyforward", dx, dy, dw, setting_key_forward, null, ord("W"), false, action_setting_key_forward)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyback", dx, dy, dw, setting_key_back, null, ord("S"), false, action_setting_key_back)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyleft", dx, dy, dw, setting_key_left, null, ord("A"), false, action_setting_key_left)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyright", dx, dy, dw, setting_key_right, null, ord("D"), false, action_setting_key_right)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyascend", dx, dy, dw, setting_key_ascend, null, ord("E"), false, action_setting_key_ascend)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeydescend", dx, dy, dw, setting_key_descend, null, ord("Q"), false, action_setting_key_descend)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyreset", dx, dy, dw, setting_key_reset, null, ord("R"), false, action_setting_key_reset)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyfast", dx, dy, dw, setting_key_fast, null, vk_space, false, action_setting_key_fast)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyslow", dx, dy, dw, setting_key_slow, null, vk_lshift, false, action_setting_key_slow)
tab_next()

// Look sensitivity
tab_control_meter()
draw_meter("settingslooksensitivity", dx, dy, dw, setting_look_sensitivity, 48, 0.25, 3, .75, .25, tab.controls.tbx_look_sensitivity, action_setting_look_sensitivity)
tab_next()

// Smooth camera
tab_control_keycontrol()
draw_switch("settingssmoothcamera", dx, dy, setting_smooth_camera, action_setting_smooth_camera, true)
tab_next()
