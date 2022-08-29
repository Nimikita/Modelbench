/// el_value_clamp_bend(axis)
/// @arg axis

function el_value_clamp_bend(axis)
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
					value[history_data.value[v]] = history_data.set_old_value[e, v]
				
				if (element_type = TYPE_SHAPE)
				{
					update_vbuffer = true
					break
				}
				
				if (shape_list != null)
					for (var i = 0; i < ds_list_size(shape_list); i++)
						shape_list[|i].update_vbuffer = true
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
						value[history_data.value[v]] = history_data.set_new_value[e, v]
					
					if (element_type = TYPE_SHAPE)
					{
						update_vbuffer = true
						break
					}
					
					if (shape_list != null)
						for (var i = 0; i < ds_list_size(shape_list); i++)
							shape_list[|i].update_vbuffer = true
				}
			}
		}
	}
	else
	{
		axis = e_value.BEND_ANGLE_X + axis
		
		with (obj_model_element)
		{
			if (!selected || update_vbuffer)
				continue
			
			if (element_type = TYPE_SHAPE)
			{
				update_vbuffer = true
				break
			}
			
			if (shape_list != null)
				for (var i = 0; i < ds_list_size(shape_list); i++)
					shape_list[|i].update_vbuffer = true
		}
		
		// Save and modify element values
		for (var e = 0; e < history_data.el_set_amount; e++)
		{
			with (save_id_find(history_data.element_save_id[e]))
			{
				if (history_data.par_set_n = history_data.par_set_amount)
					history_data.set_old_value[e, history_data.par_set_n] = value[axis]
				
				// Limit bend angle
				value[axis] = el_value_clamp(axis, value[axis], id)
				
				history_data.set_new_value[e, history_data.par_set_n] = value[axis]
			}
		}
		
		history_data.value[history_data.par_set_n] = axis
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
