/// action_element_create([type])

var spawn_type = null;

if (argument_count > 0)
	spawn_type = argument0

if (history_undo)
{
	with (history_data)
		for (var s = 0; s < spawn_amount; s++)
			with (save_id_find(spawn_save_id[s]))
				instance_destroy()
}
else
{
	var hobj, el;
	hobj = null
	
	if (history_redo)
		history_restore_element()
	else
	{
		hobj = history_set(action_element_create)
		hobj.spawn_amount = 0
		
		el = new_element(spawn_type)
		with (hobj)
		{
			spawn_save_id[spawn_amount] = save_id_get(el)
			spawn_save_type[spawn_amount] = spawn_type
			spawn_amount++
		}
	
		if (!history_redo)
			log("Created", el_type_name_list[|spawn_type])
	}
	
}

el_update_part()
