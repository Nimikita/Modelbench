/// tab_settings_controls()

// Interface shortcuts
dy += 20
draw_label(text_get("settingsinterfaceshortcuts"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label)

tab_control_keycontrol()
draw_keycontrol("settingskeyopen", dx, dy, dw, setting_key_open, setting_key_open_control, ord("O"), action_setting_key_open)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeysave", dx, dy, dw, setting_key_save, setting_key_save_control, ord("S"), action_setting_key_save)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyundo", dx, dy, dw, setting_key_undo, setting_key_undo_control, ord("Z"), action_setting_key_undo)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyredo", dx, dy, dw, setting_key_redo, setting_key_redo_control, ord("Y"), action_setting_key_redo)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolselect", dx, dy, dw, setting_key_tool_select, setting_key_tool_select_control, ord("W"), action_setting_key_tool_select)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolmove", dx, dy, dw, setting_key_tool_move, setting_key_tool_move_control, ord("G"), action_setting_key_tool_move)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolrotate", dx, dy, dw, setting_key_tool_rotate, setting_key_tool_rotate_control, ord("R"), action_setting_key_tool_rotate)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytoolscale", dx, dy, dw, setting_key_tool_scale, setting_key_tool_scale_control, ord("S"), action_setting_key_tool_scale)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeytooltransform", dx, dy, dw, setting_key_tool_transform, setting_key_tool_transform_control, ord("T"), action_setting_key_tool_transform)
tab_next(false)

// Camera shortcuts
dy += 20
draw_label(text_get("settingscamerashortcuts"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_label)

tab_control_keycontrol()
draw_keycontrol("settingskeyforward", dx, dy, dw, setting_key_forward, null, ord("W"), action_setting_key_foward)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyback", dx, dy, dw, setting_key_back, null, ord("S"), action_setting_key_back)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyleft", dx, dy, dw, setting_key_left, null, ord("A"), action_setting_key_left)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyright", dx, dy, dw, setting_key_right, null, ord("D"), action_setting_key_right)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyascend", dx, dy, dw, setting_key_ascend, null, ord("E"), action_setting_key_ascend)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeydescend", dx, dy, dw, setting_key_descend, null, ord("Q"), action_setting_key_descend)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyreset", dx, dy, dw, setting_key_reset, null, ord("R"), action_setting_key_reset)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyfast", dx, dy, dw, setting_key_fast, null, vk_space, action_setting_key_fast)
tab_next(false)

tab_control_keycontrol()
draw_keycontrol("settingskeyslow", dx, dy, dw, setting_key_slow, null, vk_shift, action_setting_key_slow)
tab_next()

// Smooth camera
tab_control_keycontrol()
draw_switch("settingssmoothcamera", dx, dy, setting_smooth_camera, action_setting_smooth_camera)
tab_next()

// Smooth camera amount
if (setting_smooth_camera)
{
	tab_control_meter()
	draw_meter("settingssmoothcameraamount", dx, dy, dw, setting_smooth_camera_amount, 48, 0, 10, 2, 1, tab.controls.tbx_smooth_camera_amount, action_setting_smooth_camera_amount)
	tab_next()
}
