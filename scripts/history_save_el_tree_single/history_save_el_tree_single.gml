/// history_save_el_tree_single(treeobj)
/// @arg treeobj

function history_save_el_tree_single(treeobj)
{
	if (treeobj.shape_list != null)
	{
		for (var s = 0; s < ds_list_size(treeobj.shape_list); s++)
		{
			var shape = treeobj.shape_list[|s];
			if (shape = app.context_menu_value)
			{
				el_save_obj[el_save_amount] = history_save_el(shape)
				el_save_amount++
			}
		}
	}
	
	for (var p = 0; p < ds_list_size(treeobj.part_list); p++)
	{
		var part = treeobj.part_list[|p];
		if (part = app.context_menu_value)
		{
			el_save_obj[el_save_amount] = history_save_el(part)
			el_save_amount++
		}
		else
			history_save_el_tree_single(part)
	}
}
