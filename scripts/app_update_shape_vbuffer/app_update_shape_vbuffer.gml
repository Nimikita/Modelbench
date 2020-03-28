/// app_update_shape_vbuffer()
/// @desc Updates shape vertex buffers if needed

// Fill list
with (obj_model_element)
{
	if (element_type = TYPE_SHAPE && update_vbuffer)
	{
		if (ds_list_find_index(app.update_vbuffer_list, id) = -1)
			ds_list_add(app.update_vbuffer_list, id)
	}
	
	update_vbuffer = false
}

for (var i = 0; i < ds_list_size(app.update_vbuffer_list); i++)
{
	if (export_stage != "")
	{
		export_shape = app.update_vbuffer_list[|i]
		export_generation_done++
	}
	
	with (app.update_vbuffer_list[|i])
		shape_update_vbuffer()
	
	ds_list_delete(app.update_vbuffer_list, i)
	i--
	
	if (app.setting_slow_generation || export_stage != "")
		break
}

