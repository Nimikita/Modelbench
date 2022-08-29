/// history_restore_el(save)
/// @arg save
/// @desc Restores a saved element from memory.

function history_restore_el(save)
{
	var el;
	el = new_obj(obj_model_element)
	
	with (save)
		el_copy(el)
	
	with (el)
	{
		save_id = save.save_id
		el_find_save_ids()
		
		// Restore default values
		for (var v = 0; v < e_value.amount; v++)
			value[v] = el_value_find_save_id(v, null, save.value[v])
		
		ds_list_insert(element_get_list(parent, id), parent_tree_index, id)
		
		if (element_type = TYPE_PART)
		{
			shape_list = ds_list_create()
			part_list = ds_list_create()
			part_update_depth()
		}
		else
			update_vbuffer = true
		
		// Restore shapes
		for (var s = 0; s < save.shape_amount; s++)
			history_restore_el(save.shape_save_obj[s])
		
		// Restore tree recursively
		for (var p = 0; p < save.part_amount; p++)
			history_restore_el(save.part_save_obj[p])
	}
	
	return el
}
