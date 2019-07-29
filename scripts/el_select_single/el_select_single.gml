/// el_select_single()
/// @desc Deselects all but the given element.

// Deselect all other timelines
with (obj_model_element)
{
	if (id = other.id)
		continue
		
	selected = false
	parent_is_selected = false
}

el_edit_amount = 1
el_edit = id

selected = true
el_update_parent_is_selected()

with (app)
	app_update_el_edit()