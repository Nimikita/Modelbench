/// action_element_create_menu([type])

var spawn_type = null;

if (argument_count > 0)
	spawn_type = argument0

if (history_undo)
{
	with (history_data)
	{
		for (var s = spawn_amount - 1; s >= 0; s--)
		{
			var parent = save_id_find(spawn_save_id[s]).parent;
			parent.extend = spawn_parent_extend
			
			with (save_id_find(spawn_save_id[s]))
				instance_destroy()
		}
		
		history_restore_el_select()
	}
}
else
{
	var hobj, select;
	hobj = null
	
	if (history_redo)
	{
		history_restore_element()
		
		with (history_data)
		{
			for (var s = 0; s < spawn_amount; s++)
			{
				var parent = save_id_find(spawn_save_id[s]).parent;
				parent.extend = true	
			}
			
			history_restore_el_select_new()
		}
	}
	else
	{
		hobj = history_set(action_element_create_menu)
		hobj.spawn_amount = 0
		
		with (hobj)
			history_save_el_select()
		
		var element;
		element = new_element(spawn_type)
			
		with (hobj)
		{
			spawn_save_id[spawn_amount] = save_id_get(element)
			spawn_save_type[spawn_amount] = spawn_type
			spawn_save_par[spawn_amount] = save_id_get(app.context_menu_value)
			spawn_save_extend[spawn_amount] = false
			spawn_parent_extend = save_id_find(spawn_save_par[spawn_amount]).extend
				
			spawn_amount++
		}
			
		// Extrude 3D planes
		if (spawn_type = e_element.PLANE_3D)
			element.value[e_value.EXTRUDE] = true
			
		with (element)
			el_set_parent(app.context_menu_value)
		hobj.spawn_parent_extend = element.parent.extend
			
		select = element
		
		// Extrude 3D planes
		if (spawn_type = e_element.PLANE_3D)
		{
			shape.value[e_value.EXTRUDE] = true
			shape.value[e_value.OFFSET_Y] = -0.5
		}
			
		// Fix Y offset on planes
		if (spawn_type = e_element.PLANE)
			shape.value[e_value.OFFSET_Y] = 0

		assets.elements.show = true
		select.parent.extend = true
		
		// Select created element
		with (select)
			el_select_single()
			
		with (hobj)
			history_save_el_select_new()
		
		if (!history_redo)
			log("Created", el_type_name_list[|spawn_type])
	}
	
}

el_update_lock_tree(false)
el_update_hidden_tree(false)
app_update_name_warning()
el_update_part()

app_update_el_edit()
