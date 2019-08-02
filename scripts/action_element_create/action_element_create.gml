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
		
		// Create part if shape doesn't have a home
		if (spawn_type = e_element.PART || (spawn_type > e_element.PART && (el_edit = null || el_edit.element_type != TYPE_PART)))
		{
			el = new_element(e_element.PART)
			with (hobj)
			{
				spawn_save_id[spawn_amount] = save_id_get(el)
				spawn_save_type[spawn_amount] = e_element.PART
				spawn_save_par[spawn_amount] = test((el_edit = null || el_edit.element_type != TYPE_PART), save_id_get(app), save_id_get(el_edit))
				spawn_amount++
			}
		}
		else
			el = el_edit
		
		if (spawn_type > e_element.PART)
		{
			var shape;
			shape = new_element(spawn_type)
			with (hobj)
			{
				spawn_save_id[spawn_amount] = save_id_get(shape)
				spawn_save_type[spawn_amount] = spawn_type
				spawn_save_par[spawn_amount] = save_id_get(el)
				spawn_amount++
			}
			
			// Extrude 3D planes
			if (spawn_type = e_element.PLANE_3D)
				shape.value[e_value.EXTRUDE] = true
			
			with (shape)
			{
				el_set_parent(el)
				parent.extend = true
			}
			
			setting_hide_shapes = false
		}
		assets.elements.show = true
		
		if (!history_redo)
			log("Created", el_type_name_list[|spawn_type])
	}
	
}

el_update_lock_tree(false)
el_update_hidden_tree(false)
el_update_part()
