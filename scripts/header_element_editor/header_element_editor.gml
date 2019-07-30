/// header_element_editor()

// Name
var text, placeholder;
text = test(el_edit.element_type = TYPE_PART, "elementeditorpartname", "elementeditorshapename")
placeholder =  test(el_edit.element_type = TYPE_SHAPE, text_get("elementeditornewshape"), text_get("elementeditornewpart"))
tab_control(48)
element_editor.tbx_name.text = el_edit.name
if (draw_textfield(text, dx, dy, dw, string_remove_newline(el_edit.name), element_editor.tbx_name, null, placeholder))
	el_edit.name = element_editor.tbx_name.text
tab_next()

// Lock to bent half
if (el_edit.element_type = TYPE_PART)
{
	// Lock to bent half
	tab_control_switch()
	draw_switch("elementeditorbendlock", dx, dy, el_edit.value[e_value.BEND_LOCK], action_el_bend_lock)
	tab_next()
}

dy += 8
