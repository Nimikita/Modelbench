/// tab_element_editor_size()

var snapval = (dragger_snap ? setting_snap_size_uv : snap_min);

tab_control(28)
textfield_group_add("elementeditorsizew", el_edit.value[e_value.WIDTH], 0, action_el_size, X, tab.size.tbx_width)

if (setting_z_is_up)
{
	if (el_edit != null && el_edit.element_type = TYPE_SHAPE && el_edit.type = "block")
		textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.size.tbx_length)
	
	textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.size.tbx_height)
}
else
{
	textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.size.tbx_height)
	
	if (el_edit != null && el_edit.element_type = TYPE_SHAPE && el_edit.type = "block")
		textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.size.tbx_length)
}

draw_textfield_group("elementeditorsize", dx, dy, dw, dragger_snap ? snapval * .5 : .25, -no_limit, no_limit, snapval)
tab_next()
