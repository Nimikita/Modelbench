/// tab_element_editor_size()

function tab_element_editor_size()
{
	context_menu_group_temp = e_context_group.SIZE
	tab_element_editor_buttons()
	draw_label(text_get("elementeditorsize"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	dy += 26
	
	var snapval = (dragger_snap ? setting_snap_size_uv : snap_min);
	
	textfield_group_add("elementeditorsizew", el_edit.value[e_value.WIDTH], 0, action_el_size, X, tab.transform.tbx_width)
	
	if (setting_z_is_up)
	{
		if (el_edit != null && el_edit.element_type = TYPE_SHAPE && el_edit.type = "block")
			textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.transform.tbx_length)
		
		textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.transform.tbx_height)
	}
	else
	{
		textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.transform.tbx_height)
		
		if (el_edit != null && el_edit.element_type = TYPE_SHAPE && el_edit.type = "block")
			textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.transform.tbx_length)
	}
	
	tab_control_textfield_group(false)
	draw_textfield_group("elementeditorsize", dx, dy, dw, dragger_snap ? snapval * .5 : .25, -no_limit, no_limit, snapval, false, true, 1)
	tab_next()
}
