/// action_element_create([type])

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
	var hobj, el, select;
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
		hobj = history_set(action_element_create)
		hobj.spawn_amount = 0
		
		with (hobj)
			history_save_el_select()
		
		// Create part if shape doesn't have a home
		if (spawn_type = e_element.PART || (spawn_type > e_element.PART && el_edit = null))
		{
			el = new_element(e_element.PART)
			with (hobj)
			{
				spawn_save_id[spawn_amount] = save_id_get(el)
				spawn_save_type[spawn_amount] = e_element.PART
				spawn_save_par[spawn_amount] = ((el_edit = null || el_edit.element_type != TYPE_PART) ? save_id_get(app) : save_id_get(el_edit))
				spawn_save_extend[spawn_amount] = true
				spawn_parent_extend = save_id_find(spawn_save_par[spawn_amount]).extend
				
				spawn_amount++
			}
			
			select = el
		}
		else
			el = el_edit
		
		if (el_edit != null && el_edit.element_type = TYPE_SHAPE)
			el = el_edit.parent
		
		if (spawn_type > e_element.PART)
		{
			var shape;
			shape = new_element(spawn_type)
			
			with (hobj)
			{
				spawn_save_id[spawn_amount] = save_id_get(shape)
				spawn_save_type[spawn_amount] = spawn_type
				spawn_save_par[spawn_amount] = save_id_get(el)
				spawn_save_extend[spawn_amount] = false
				spawn_amount++
			}
			
			// Extrude 3D planes
			if (spawn_type = e_element.PLANE_3D)
			{
				shape.value[e_value.EXTRUDE] = true
				shape.value[e_value.OFFSET_Y] = -0.5
			}
			
			// Fix Y offset on planes
			if (spawn_type = e_element.PLANE)
				shape.value[e_value.OFFSET_Y] = 0
			
			with (shape)
				el_set_parent(el)
			hobj.spawn_parent_extend = shape.parent.extend
			
			select = shape
			setting_hide_shapes = false
		}
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
