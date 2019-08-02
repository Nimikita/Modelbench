/// action_el_move_start_tree(root)
/// @arg root

var root = argument0;

// Shapes
if (root.object_index != app)
{
	for (var i = 0; i < ds_list_size(root.shape_list); i++)
	{
		with (root.shape_list[|i])
		{
			if (selected)
			{
				app.element_move_shapes++
	
				ds_list_add(app.element_move_obj.elements_list, id)
				ds_list_add(app.element_move_obj.save_id_list, parent.save_id)
				ds_list_add(app.element_move_obj.index_list, ds_list_find_index(parent.shape_list, id))
				app.element_move_obj.elements++
			}
		}
	}
}

// Parts
for (var i = 0; i < ds_list_size(root.part_list); i++)
{
	with (root.part_list[|i])
	{
		if (selected)
		{
			app.element_move_parts++
	
			ds_list_add(app.element_move_obj.elements_list, id)
			ds_list_add(app.element_move_obj.save_id_list, parent.save_id)
			ds_list_add(app.element_move_obj.index_list, ds_list_find_index(parent.part_list, id))
			app.element_move_obj.elements++
		}
	
		action_el_move_start_tree(id)
	}
}