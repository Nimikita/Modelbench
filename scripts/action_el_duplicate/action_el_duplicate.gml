/// action_el_duplicate()

if (history_undo)
{
	with (obj_model_element)
		if (selected)
			instance_destroy()
		
	with (history_data)
		history_restore_el_select()
}
else
{
	if (el_edit = null)
		return 0
		
	with (obj_model_element)
	{
		root_copy = null
		copy = null
	}
		
	if (!history_redo) 
		with (history_set(action_el_duplicate))
			history_save_el_select()
	
	with (obj_model_element)
	{
		if (!selected || copy != null || parent_is_selected)
			continue
		
		el_duplicate()
		
		root_copy = copy
		
		with (root_copy)
			el_set_parent(other.parent)
	}
	
	el_deselect_all()
	
	with (obj_model_element)
	{
		with (root_copy)
		{
			el_select()
			el_set_parent(other.parent, parent_tree_index + 1)
		}
	}
}

el_update_lock_tree(false)
el_update_hidden_tree(false)
app_update_el_edit()
app_update_name_warning()

el_update_part()
