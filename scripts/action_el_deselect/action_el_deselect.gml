/// action_el_deselect(element)
/// @arg element

if (history_undo)
{
	with (history_data)
	{
		history_restore_el_select()
		for (var t = 0; t < extend_amount; t++)
			with (save_id_find(extend_save_id[t]))
				extend = other.extend_value[t]
	}
}
else
{
	var element, par, hobj;
	hobj = null
	
	if (history_redo)
	{
		element = save_id_find(history_data.element_save_id)
	}
	else
	{
		element = argument0
		hobj = history_set(action_el_deselect)
		with (hobj)
		{
			id.element_save_id = save_id_get(element)
			history_save_el_select()
			extend_amount = 0
		}
	}
	
	// Extend parents
	par = element.parent
	while (par.object_index != app)
	{
		with (hobj)
		{
			extend_save_id[extend_amount] = par.save_id
			extend_value[extend_amount] = par.extend
			extend_amount++
		}
		par.extend = true
		par = par.parent
	}
	
	// Deselect
	with (element)
		el_deselect()
}

app_update_el_edit()