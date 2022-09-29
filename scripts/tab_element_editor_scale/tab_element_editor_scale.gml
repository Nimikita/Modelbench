/// tab_element_editor_scale()

function tab_element_editor_scale()
{
	context_menu_group_temp = e_context_group.SCALE
	tab_element_editor_buttons()
	draw_label(text_get("elementeditorscale"), dx, dy + 12, fa_left, fa_middle, c_text_secondary, a_text_secondary, font_label)
	dy += 26
	
	var snapval = (dragger_snap ? setting_snap_size_scale : snap_min);
	
	if (element_editor.transform.scale_all)
	{
		tab_control_dragger()
		draw_dragger("elementeditorscalexyz", dx, dy, dragger_width, el_edit.value[e_value.SCA_X], 0.1, snap_min, no_limit, 1, snapval, tab.transform.tbx_sca_x, action_el_sca_xyz)
		tab_next()
	}
	else
	{
		textfield_group_add("elementeditorscalex", el_edit.value[e_value.SCA_X], 1, action_el_sca, X, tab.transform.tbx_sca_x)
		
		axis_edit = (setting_z_is_up ? Y : Z)
		textfield_group_add("elementeditorscaley", el_edit.value[e_value.SCA_X + axis_edit], 1, action_el_sca, axis_edit, tab.transform.tbx_sca_y)
		
		axis_edit = (setting_z_is_up ? Z : Y)
		textfield_group_add("elementeditorscalez", el_edit.value[e_value.SCA_X + axis_edit], 1, action_el_sca, axis_edit, tab.transform.tbx_sca_z)
		
		tab_control_textfield_group(false)
		draw_textfield_group("elementeditorscale", dx, dy, dw, 0.1, snap_min, no_limit, snapval, false, true, 1)
		tab_next()
	}
}
