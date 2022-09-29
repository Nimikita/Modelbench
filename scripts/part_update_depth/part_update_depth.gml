/// part_update_depth()

function part_update_depth()
{
	ds_list_delete_value(render_list, id)
	
	var pos;
	for (pos = 0; pos < ds_list_size(render_list); pos++)
		if (render_list[|pos].value[e_value.DEPTH] > value[e_value.DEPTH])
			break
	
	ds_list_insert(render_list, pos, id)
}
