/// header_element_editor()

// Name
var text, placeholder;
text = (el_edit.element_type = TYPE_PART ? "elementeditorpartname" : "elementeditorshapename")
placeholder = (el_edit.element_type = TYPE_SHAPE ? text_get("elementeditornewshape") : text_get("elementeditornewpart"))
tab_control(48)
element_editor.tbx_name.text = el_edit.name
if (draw_textfield(text, dx, dy, dw, string_remove_newline(el_edit.name), element_editor.tbx_name, action_el_name, placeholder, "top", el_edit.name_duplicate || el_edit.name_empty))
	el_edit.name = element_editor.tbx_name.text
tab_next()

if (el_edit.name_duplicate || el_edit.name_empty)
{
	var text = "";
	
	if (el_edit.name_empty)
		text = text_get("elementeditoremptypartname")
	else
		text = text_get("elementeditorsamepartname")
	
	tab_control(8)
	draw_label(text, dx, dy + 8, fa_left, fa_bottom, c_error, 1, font_caption)
	tab_next()
}

// Lock to bent half
if (el_edit.element_type = TYPE_PART)
{
	// Lock to bent half
	tab_control_switch()
	draw_switch("elementeditorbendlock", dx, dy, el_edit.value[e_value.BEND_LOCK], action_el_bend_lock, true)
	tab_next()
}

dy += 8
