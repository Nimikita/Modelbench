/// tab_element_editor_offset()

function tab_element_editor_offset()
{
	context_menu_group_temp = e_context_group.PIVOT_OFFSET
	tab_element_editor_buttons()
	draw_label(text_get("elementeditoroffset"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	dy += 26
	
	axis_edit = X
	textfield_group_add("elementeditoroffsetx", el_edit.value[e_value.OFFSET_X], 0, action_el_offset, X, tab.transform.tbx_off_x)
	
	axis_edit = (setting_z_is_up ? Y : Z)
	textfield_group_add("elementeditoroffsety", el_edit.value[e_value.OFFSET_X + axis_edit], 0, action_el_offset, axis_edit, tab.transform.tbx_off_y)
	
	axis_edit = (setting_z_is_up ? Z : Y)
	textfield_group_add("elementeditoroffsetz", el_edit.value[e_value.OFFSET_X + axis_edit], 0, action_el_offset, axis_edit, tab.transform.tbx_off_z)
	
	tab_control_textfield_group(false)
	draw_textfield_group("elementeditoroffset", dx, dy, dw, 0.1, -no_limit, no_limit, setting_snap ? setting_snap_size_position : snap_min, false, true, 1)
	tab_next()
}
