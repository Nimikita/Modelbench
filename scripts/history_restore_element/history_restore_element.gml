/// history_restore_element()

function history_restore_element()
{
	var el;
	
	for (var i = 0; i < history_data.spawn_amount; i++)
	{
		el = new_element(history_data.spawn_save_type[i])
		el.save_id = history_data.spawn_save_id[i]
		el.extend = history_data.spawn_save_extend[i]
		
		if (history_data.spawn_save_type[i] = e_element.PLANE_3D)
			el.value[e_value.EXTRUDE] = true
		
		with (el)
			el_set_parent(save_id_find(history_data.spawn_save_par[i]))
	}
}
