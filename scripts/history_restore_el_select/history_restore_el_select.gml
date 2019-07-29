/// history_restore_el_select()
/// @desc Restores the previously selected elements

el_deselect_all()

for (var t = 0; t < element_sel_amount; t++)
{
	with (save_id_find(element_sel_save_id[t]))
		el_select()
}
