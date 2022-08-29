/// el_value_set(valueid, value, add)
/// @arg valueid
/// @arg value
/// @arg add
/// @desc Adds the given value to all selected elements.

function el_value_set(vid, val, add)
{
	if (history_undo)
	{	
		// Restore values
		for (var e = 0; e < history_data.el_set_amount; e++)
		{
			var element = save_id_find(history_data.element_save_id[e]);
		
			with (element)
			{
				for (var v = 0; v < history_data.par_set_amount; v++)
				{
					value[history_data.value[v]] = el_value_find_save_id(history_data.value[v], history_data.set_new_value[e, v], history_data.set_old_value[e, v])
				
					if (el_value_update_vbuffer(v))
						element_tree_update_vbuffer(id)
				}
			}
		}
	}
	else if (history_redo)
	{
		// Restore values
		for (var e = 0; e < history_data.el_set_amount; e++)
		{
			var element = save_id_find(history_data.element_save_id[e]);
			if (element != undefined)
			{
				with (element)
				{
					for (var v = 0; v < history_data.par_set_amount; v++)
					{
						value[history_data.value[v]] = el_value_find_save_id(history_data.value[v], history_data.set_old_value[e, v], history_data.set_new_value[e, v])
			
						if (el_value_update_vbuffer(v))
							element_tree_update_vbuffer(id)
					}
				}
			}
		}
	}
	else
	{
		// Update vbuffer
		if (el_value_update_vbuffer(vid))
		{
			with (obj_model_element)
			{
				if (!selected || update_vbuffer)
					continue
				
				element_tree_update_vbuffer(id)
			}
		}
		
		// Save and modify element values
		for (var e = 0; e < history_data.el_set_amount; e++)
		{
			with (save_id_find(history_data.element_save_id[e]))
			{
				if (!el_value_set_check(id, vid))
				{
					if (history_data.par_set_n = history_data.par_set_amount)
						history_data.set_old_value[e, history_data.par_set_n] = el_value_get_save_id(vid, value[vid])
					
					history_data.set_new_value[e, history_data.par_set_n] = el_value_get_save_id(vid, value[vid])
					continue
				}
				
				if (history_data.par_set_n = history_data.par_set_amount)
					history_data.set_old_value[e, history_data.par_set_n] = el_value_get_save_id(vid, value[vid])
				
				var nval;
				
				if (vid = e_value.TEXTURE_OBJ)
					nval = val
				else
					nval = value[vid] * add + val
				
				value[vid] = el_value_clamp(vid, nval, id)
				
				history_data.set_new_value[e, history_data.par_set_n] = el_value_get_save_id(vid, value[vid])
			}
		}
		
		history_data.value[history_data.par_set_n] = vid
		history_data.par_set_n++
		history_data.par_set_amount = max(history_data.par_set_amount, history_data.par_set_n)
		
		return 0
	}
	
	with (app)
	{
		el_update_part()
		app_update_el_edit()
	}
}
