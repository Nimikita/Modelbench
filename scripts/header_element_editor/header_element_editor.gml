/// header_element_editor()

// Name
var text = test(el_edit.element_type = TYPE_PART, "elementeditorpartname", "elementeditorshapename");
tab_control(48)
element_editor.tbx_name.text = el_edit.name
if (draw_textfield(text, dx, dy, dw, string_remove_newline(el_edit.name), element_editor.tbx_name, null, test(el_edit.element_type = TYPE_SHAPE, "New shape", "New part")))
	el_edit.name = element_editor.tbx_name.text
tab_next()

// Render depth
if (el_edit.element_type = TYPE_PART)
{
	tab_control(28)
	element_editor.tbx_depth.text = string(el_edit.depth)
	if (draw_textfield("elementeditordepth", dx, dy, 136, 0, element_editor.tbx_depth, null, "", "left"))
		el_edit.depth = string_get_real(element_editor.tbx_depth.text, 0)
	tab_next()
}

dy += 8
