/// history_save_tl_select()
/// @desc Saves the selected timelines in the history object.

element_sel_amount = 0

with (obj_model_element)
{
	if (!selected)
		continue
	
	other.element_sel_save_id[other.element_sel_amount] = id
	
	other.element_sel_amount++
}
