/// history_restore_el_select_new()
/// @desc Restores the previously selected elements.

el_deselect_all()

for (var t = 0; t < el_sel_new_amount; t++)
{
	with (save_id_find(el_sel_new_save_id[t]))
		el_select()
}
