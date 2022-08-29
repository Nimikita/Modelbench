/// el_deselect()

function el_deselect()
{
	if (!selected)
		return 0
	
	selected = false
	
	el_edit_amount--
	el_edit = null
	with (obj_model_element)
		if (selected)
			el_edit = id
	
	el_update_parent_is_selected()
}
