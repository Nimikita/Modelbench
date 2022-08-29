/// history_save_el_tree(treeobj)
/// @arg treeobj

function history_save_el_tree(treeobj)
{
	if (treeobj.shape_list != null)
	{
		for (var s = 0; s < ds_list_size(treeobj.shape_list); s++)
		{
			var shape = treeobj.shape_list[|s];
			if (shape.selected)
			{
				el_save_obj[el_save_amount] = history_save_el(shape)
				el_save_amount++
			}
		}
	}
	
	for (var p = 0; p < ds_list_size(treeobj.part_list); p++)
	{
		var part = treeobj.part_list[|p];
		if (part.selected)
		{
			el_save_obj[el_save_amount] = history_save_el(part)
			el_save_amount++
		}
		else
			history_save_el_tree(part)
	}
}
