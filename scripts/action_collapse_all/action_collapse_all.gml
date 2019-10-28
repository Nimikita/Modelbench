/// action_collapse_all()

if (history_undo)
{
	with (history_data)
	{
		for (var i = 0; i < save_var_amount; i++)
		{
			var element = save_id_find(save_var_save_id[i]);
			element.extend = save_var_old_value[i]
		}
	}
}
else if (history_redo)
{
	with (history_data) 
	{
		for (var i = 0; i < save_var_amount; i++)
		{
			var element = save_id_find(save_var_save_id[i]);
			element.extend = save_var_new_value[i]
		}
	}
}
else
{
	var hobj;
	hobj = history_save_var_start(action_collapse_all, true);
	
	with (hobj)
	{
		with (obj_model_element)
		{
			element = id
			if (element_type = TYPE_PART && element.extend)
			{
				with (other)
					history_save_var(element, element.extend, false)
				
				element.extend = false
			}
		}
	}
}
