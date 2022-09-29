/// header_element_editor()

function header_element_editor()
{
	dy += 8
	
	// Name
	var text, placeholder;
	text = (el_edit.element_type = TYPE_PART ? "elementeditorpartname" : "elementeditorshapename")
	placeholder = (el_edit.element_type = TYPE_SHAPE ? text_get("elementeditornewshape") : text_get("elementeditornewpart"))
	
	tab_control_textfield()
	element_editor.tbx_name.text = el_edit.name
	if (draw_textfield(text, dx, dy, dw, 24, element_editor.tbx_name, action_el_name, placeholder, "top"))
		el_edit.name = element_editor.tbx_name.text
	tab_next()
	
	dy += 8
}
