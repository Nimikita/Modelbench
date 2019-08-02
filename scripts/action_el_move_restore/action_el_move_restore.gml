/// action_el_move_restore()
/// Restores elements to their original positions

for (var i = 0; i < element_move_obj.elements; i++)
{
	var element = element_move_obj.elements_list[|i];
	element.parent = save_id_find(element_move_obj.save_id_list[|i])
	ds_list_insert(element_get_list(element.parent, element), element_move_obj.index_list[|i], element)
}
