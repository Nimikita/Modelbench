/// action_el_move_start()

function action_el_move_start()
{
	element_move_extend = 0
	element_move_extend_amount = 0
	
	element_move_parts = 0
	element_move_shapes = 0
	
	element_move_obj = new_obj(obj_data)
	element_move_obj.elements_list = ds_list_create()
	element_move_obj.save_id_list = ds_list_create()
	element_move_obj.index_list = ds_list_create()
	element_move_obj.elements = 0
	
	action_el_move_start_tree(app)
	
	// Remove from parents & calculate box width
	for (var e = 0; e < app.element_move_obj.elements; e++)
	{
		var el = element_move_obj.elements_list[|e];
		
		ds_list_delete_value(element_get_list(el.parent, el), el)
		el.parent = null
		
		element_move_width = max(element_move_width, string_width_font(element_name_get(el), font_value))
	}
}
