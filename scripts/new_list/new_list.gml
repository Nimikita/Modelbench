/// new_list()

function new_list()
{
	var list = new_obj(obj_list);
	list.item = ds_list_create()
	list.width = 0 // Update using list_update_width
	list.update = false
	list.get_name = false
	
	return list
}
