/// tab_element_editor_rotation()

function tab_element_editor_rotation()
{
	context_menu_group_temp = e_context_group.ROTATION
	tab_element_editor_buttons()
	draw_label(text_get("elementeditorrotation"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	dy += 26
	
	var snapval = (dragger_snap ? setting_snap_size_rotation : 0.1);
	
	tab_control_wheel()
	
	axis_edit = X
	draw_wheel("elementeditorrotationx", floor(dx + dw/6), dy + 24, c_axisred, el_edit.value[e_value.ROT_X], -no_limit, no_limit, 0, snapval, tab.transform.tbx_rot_x, action_el_rot)
	
	axis_edit = (setting_z_is_up ? Y : Z)
	draw_wheel("elementeditorrotationy", floor(dx + dw/2), dy + 24, c_axisgreen, el_edit.value[e_value.ROT_X + axis_edit], -no_limit, no_limit, 0, snapval, tab.transform.tbx_rot_y, action_el_rot)
	
	axis_edit = (setting_z_is_up ? Z : Y)
	draw_wheel("elementeditorrotationz", floor(dx + dw - dw/6), dy + 24, c_axisblue, el_edit.value[e_value.ROT_X + axis_edit], -no_limit, no_limit, 0, snapval, tab.transform.tbx_rot_z, action_el_rot)
	
	tab_next()
	
	// Textboxes
	axis_edit = X
	textfield_group_add("elementeditorrotationx", el_edit.value[e_value.ROT_X], 0, action_el_rot, axis_edit, tab.transform.tbx_rot_x)
	
	axis_edit = (setting_z_is_up ? Y : Z)
	textfield_group_add("elementeditorrotationy", el_edit.value[e_value.ROT_X + axis_edit], 0, action_el_rot, axis_edit, tab.transform.tbx_rot_y)
	
	axis_edit = (setting_z_is_up ? Z : Y)
	textfield_group_add("elementeditorrotationz", el_edit.value[e_value.ROT_X + axis_edit], 0, action_el_rot, axis_edit, tab.transform.tbx_rot_z)
	
	tab_control_textfield_group(false)
	draw_textfield_group("elementeditorrotation", dx, dy, dw, 0.1, -no_limit, no_limit, snapval, false, true, 1)
	tab_next()
}
