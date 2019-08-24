/// history_save_el(element)
/// @arg element
/// @desc Saves an element in memory.

var el, save;
el = argument0
save = new(obj_history_save)
save.hobj = id

with (el)
	el_copy(save)

with (save)
{
	save_id = el.save_id
	el_get_save_ids()
	
	// Save values
	for (var v = 0; v < e_value.amount; v++)
		value[v] = el_value_get_save_id(v, el.value[v])
	
	// Save shapes
	if (el.shape_list != null)
	{
		shape_amount = ds_list_size(el.shape_list)
		for (var s = 0; s < shape_amount; s++)
			shape_save_obj[s] = history_save_el(el.shape_list[|s])
	}
	else
		shape_amount = 0
	
	// Save tree recursively
	if (el.part_list != null)
	{
		part_amount = ds_list_size(el.part_list)
		for (var p = 0; p < part_amount; p++)
			part_save_obj[p] = history_save_el(el.part_list[|p])
	}
	else
		part_amount = 0
}

return save
