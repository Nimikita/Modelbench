/// action_el_move()

function action_el_move()
{
	if (history_undo)
	{
		with (history_data)
		{
			// Remove from current parents
			for (var e = 0; e < element_amount; e++)
			{
				var el = save_id_find(element_save_id[e]);
				
				ds_list_delete_value(element_get_list(el.parent, el), el)
				el.parent = null
			}
			
			// Reparent to old parents
			for (var i = 0; i < element_amount; i++)
			{
				var el = save_id_find(element_save_id[i]);
				el.parent = save_id_find(element_old_par_save_id[i])
				ds_list_insert(element_get_list(el.parent, el), element_old_index[i], el)
			}
			
			// Undo parent extend
			var newparent = save_id_find(parent_new_save_id);
			newparent.extend = parent_new_extend
			
			// Undo object extend
			for (var i = 0; i < element_extend_amount; i++)
			{
				var element = save_id_find(element_extend[i]);
				element.extend = false
			}
		}
	}
	else
	{
		var elementlist, parentlist, indexlist, amount, hobj, newparent;
		if (history_redo)
		{
			elementlist = history_data.element_save_id
			parentlist = history_data.element_new_par_save_id
			indexlist = history_data.element_new_index
			amount = history_data.element_amount
			
			for (var i = 0; i < history_data.element_extend_amount; i++)
			{
				var element = save_id_find(history_data.element_extend[i]);
				element.extend = true
			}
			
			newparent = save_id_find(history_data.parent_new_save_id)
		}
		else
		{
			hobj = history_set(action_el_move)
			with (hobj)
			{
				element_amount = app.element_move_obj.elements
				for (var i = 0; i < element_amount; i++)
				{
					element_save_id[i] = save_id_get(app.element_move_obj.elements_list[|i])
					element_old_par_save_id[i] = app.element_move_obj.save_id_list[|i]
					element_old_index[i] = app.element_move_obj.index_list[|i]
				}
				
				element_extend = array_copy_1d(app.element_move_extend)
				element_extend_amount = app.element_move_extend_amount
				
				parent_new_save_id = app.element_move_parent.save_id
				parent_new_extend = app.element_move_parent.extend
			}
			
			var partindex, shapeindex;
			partindex = 0
			shapeindex = 0
			amount = hobj.element_amount
			elementlist = hobj.element_save_id
			newparent = save_id_find(hobj.parent_new_save_id)
			
			if (element_move_index = null)
			{
				// No index given, put elements at the end of list(s)
				for (var i = 0; i < amount; i++)
				{
					var el = save_id_find(elementlist[i]);
					hobj.element_new_par_save_id[i] = element_move_parent.save_id
					hobj.element_new_index[i] = ds_list_size(element_get_list(element_move_parent, el)) + (el.element_type = TYPE_PART ? partindex : shapeindex)
					
					if (el.element_type = TYPE_PART)
						partindex++
					else
						shapeindex++
				}
			}
			else
			{
				// Index given, put elements in new parent in a given position(With exceptions)
				for (var i = 0; i < amount; i++)
				{
					var el = save_id_find(elementlist[i]);
					hobj.element_new_par_save_id[i] = element_move_parent.save_id
					
					// Moving parts and shapes(Parts move to index, shapes get *added* to parent's list)
					if (element_move_parts > 0 && element_move_shapes > 0)
					{
						if (el.element_type = TYPE_PART)
							hobj.element_new_index[i] = element_move_index + partindex
						else
							hobj.element_new_index[i] = ds_list_size(element_move_parent.shape_list) + shapeindex
					}
					else
						hobj.element_new_index[i] = element_move_index + (el.element_type = TYPE_PART ? partindex : shapeindex)
					
					if (el.element_type = TYPE_PART)
						partindex++
					else
						shapeindex++
				}
			}
			
			parentlist = hobj.element_new_par_save_id
			indexlist = hobj.element_new_index
		}
		
		// Remove from current parents
		for (var i = 0; i < amount; i++)
		{
			var el = save_id_find(elementlist[i]);
			
			if (el.parent = null)
				continue
			
			ds_list_delete_value(element_get_list(el.parent, el), el)
			el.parent = null
		}
		
		// Parent to new parents and indexes
		for (var i = 0; i < amount; i++)
		{
			var el = save_id_find(elementlist[i]);
			el.parent = save_id_find(parentlist[i])
			
			var list = element_get_list(el.parent, el);
			ds_list_insert(list, indexlist[i], el)
		}
		
		// Extend new parent
		newparent.extend = true
	}
	
	el_update_lock_tree(false)
	el_update_hidden_tree(false)
	el_update_part()
}
