/// action_el_select(element)
/// @arg element

function action_el_select(argument0)
{
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
		var element, shift, par, hobj;
		hobj = null
		
		if (history_redo)
		{
			element = save_id_find(history_data.element_save_id)
			shift = history_data.shift
		}
		else
		{
			element = argument0
			shift = keyboard_check(vk_shift)
			hobj = history_set(action_el_select)
			with (hobj)
			{
				id.element_save_id = save_id_get(element)
				id.shift = shift
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
		
		// Select
		if (!shift)
			el_deselect_all()
		
		with (element)
			el_select()
	}
	
	app_update_el_edit()
}
