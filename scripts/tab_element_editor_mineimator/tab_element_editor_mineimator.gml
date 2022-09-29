/// tab_element_editor_mineimator()

function tab_element_editor_mineimator()
{
	context_menu_group_temp = e_context_group.MINEIMATOR
	
	/// (Render) depth
	tab_control_dragger()
	draw_dragger("elementeditordepth", dx, dy, dragger_width, el_edit.value[e_value.DEPTH], 0.1, -no_limit, no_limit, 0, 1, element_editor.tbx_depth, action_el_depth)
	tab_next()
	
	// Open position tab
	tab_control_switch()
	draw_switch("elementeditoropenpositiontab", dx, dy, el_edit.value[e_value.OPEN_POSITION_TAB], action_el_open_position_tab, "elementeditoropenpositiontabhelp")
	tab_next()
}
