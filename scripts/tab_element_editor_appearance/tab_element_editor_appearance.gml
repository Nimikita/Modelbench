/// tab_element_editor_appearance()

function tab_element_editor_appearance()
{
	context_menu_group_temp = e_context_group.APPEARANCE
	
	tab_control_dragger()
	draw_dragger("elementeditorinflate", dx, dy, dragger_width, el_edit.value[e_value.INFLATE], 0.1, -no_limit, no_limit, 0, dragger_snap ? setting_snap_size_scale : snap_min, tab.appearance.tbx_inflate, action_el_inflate)
	tab_next()
	
	tab_control_checkbox()
	draw_checkbox("elementeditorbend", dx, dy, el_edit.value[e_value.BEND_SHAPE], action_el_bend)
	tab_next()
	
	tab_control_checkbox()
	draw_checkbox("elementeditormirrortexture", dx, dy, el_edit.value[e_value.TEX_MIRROR], action_el_mirror_texture)
	tab_next()
	
	if (setting_feature_set = e_features.MIMODEL)
	{
		tab_control_checkbox()
		draw_checkbox("elementeditorinvert", dx, dy, el_edit.value[e_value.INVERT], action_el_invert)
		tab_next()
		
		tab_control_checkbox()
		draw_checkbox("elementeditorfacecamera", dx, dy, el_edit.value[e_value.FACE_CAMERA], action_el_face_camera)
		tab_next()
		
		tab_control_checkbox()
		draw_checkbox("elementeditorhover", dx, dy, el_edit.value[e_value.HOVER], action_el_hover)
		tab_next()
	}
	
	if (el_edit.element_type = TYPE_SHAPE && el_edit.type = "plane")
	{
		tab_control_checkbox()
		draw_checkbox("elementeditorextrude", dx, dy, el_edit.value[e_value.EXTRUDE], action_el_extrude)
		tab_next()
	}
	
	if (setting_feature_set = e_features.MIMODEL)
	{
		if (el_edit.element_type = TYPE_SHAPE && el_edit.type = "plane")
		{
			tab_control_checkbox()
			draw_checkbox("elementeditorhidefront", dx, dy, el_edit.value[e_value.HIDE_FRONT], action_el_hide_front)
			tab_next()
			
			tab_control_checkbox()
			draw_checkbox("elementeditorhideback", dx, dy, el_edit.value[e_value.HIDE_BACK], action_el_hide_back)
			tab_next()
		}
	}
}
