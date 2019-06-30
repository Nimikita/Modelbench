/// tab_element_editor_appearance()

tab.appearance.tbx_inflate.text = string(el_edit.value[e_value.INFLATE])

tab_control(28)
draw_textfield_num("elementeditorinflate", dx, dy, 86, el_edit.value[e_value.INFLATE], 0.1, -no_limit, no_limit, 0, 0.01, tab.appearance.tbx_inflate, action_el_inflate)
tab_next()

tab_control_checkbox()
draw_checkbox("elementeditormirrortexture", dx, dy, el_edit.value[e_value.TEX_MIRROR], action_el_mirror_texture)
tab_next()

tab_control_checkbox()
draw_checkbox("elementeditorinvert", dx, dy, el_edit.value[e_value.INVERT], action_el_invert)
tab_next()

tab_control_checkbox()
draw_checkbox("elementeditorfacecamera", dx, dy, el_edit.value[e_value.FACE_CAMERA], action_el_face_camera)
tab_next()

tab_control_checkbox()
draw_checkbox("elementeditorhover", dx, dy, el_edit.value[e_value.HOVER], action_el_hover)
tab_next()

if (el_edit.element_type = TYPE_SHAPE && el_edit.type = "plane")
{
	tab_control_checkbox()
	draw_checkbox("elementeditor3d", dx, dy, el_edit.value[e_value.PLANE_3D], action_el_plane3d)
	tab_next()
}

if (el_edit.element_type = TYPE_SHAPE && el_edit.type = "plane" && !el_edit.value[e_value.PLANE_3D])
{
	tab_control_checkbox()
	draw_checkbox("elementeditorhidebackface", dx, dy, el_edit.value[e_value.HIDE_BACKFACE], action_el_hide_backface)
	tab_next()
}