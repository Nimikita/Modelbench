/// history_save_el_select()
/// @desc Saves the selected elements in the history object.

element_sel_amount = 0

with (obj_model_element)
{
	if (!selected)
		continue
	
	other.element_sel_save_id[other.element_sel_amount] = save_id
	
	other.element_sel_amount++
}
