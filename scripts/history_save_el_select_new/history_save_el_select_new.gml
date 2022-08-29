/// history_save_el_select_new_obj()
/// @desc Saves the newly selected elements in the history object.

function history_save_el_select_new_obj()
{
	el_sel_new_amount = 0
	with (obj_model_element)
	{
		if (!selected)
			continue
		
		other.el_sel_new_save_id[other.el_sel_new_amount] = save_id
		other.el_sel_new_amount++
	}
}
