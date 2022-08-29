/// el_deselect_all()
/// @desc Deselects all timelines and keyframes.

function el_deselect_all()
{
	with (obj_model_element)
	{
		if (selected)
			selected = false
		
		parent_is_selected = false
	}
	
	el_edit_amount = 0
	el_edit = null
}
