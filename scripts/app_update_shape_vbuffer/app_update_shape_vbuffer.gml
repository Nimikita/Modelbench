/// app_update_shape_vbuffer()
/// @desc Updates shape vertex buffers if needed

function app_update_shape_vbuffer()
{
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
	
	var curtime, time = 0;
	
	for (var i = 0; i < ds_list_size(app.update_vbuffer_list); i++)
	{
		curtime = current_time
		
		if (export_stage != "")
		{
			export_shape = app.update_vbuffer_list[|i]
			export_generation_done++
		}
		
		vbuffer_freeze = false
		
		with (app.update_vbuffer_list[|i])
			shape_update_vbuffer()
		
		// Read vbuffer for export
		if (export_stage != "")
		{
			with (app.update_vbuffer_list[|i])
				export_read_vbuffer()
		}
		
		vertex_freeze(app.update_vbuffer_list[|i].shape_vbuffer)
		vbuffer_freeze = true
		
		ds_list_delete(app.update_vbuffer_list, i)
		i--
		
		time += (current_time - curtime)
		
		if ((app.setting_slow_generation || export_stage != "") && time > 16)
			break
	}
}
