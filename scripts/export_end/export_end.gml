/// export_end()

function export_end()
{
	file_text_write_string(export_file, "\n")
	file_text_write_string(export_file, "# " + string(export_verticies) + " verticies, " + string(export_quads) + " quads, " + string(export_triangles) + " triangles")
		
	export_verticies = 0
	export_quads = 0
	export_triangles = 0
	
	ds_list_clear(export_position_list)
	ds_list_clear(export_uv_list)
	ds_list_clear(export_normal_list)
	ds_list_clear(export_shapes)
	ds_list_clear(export_elements)
	
	log(".obj export: Writing to file")
	
	file_text_close(export_file)
	
	export_save_mtl()
	
	log(".obj export: Done")
	
	with (obj_model_element)
	{
		if (element_type = TYPE_PART)
			continue
		
		if (invert != value[e_value.INVERT])
			update_vbuffer = true
		
		if (hide_back != value[e_value.HIDE_BACK])
			update_vbuffer = true
		
		if (hide_front != value[e_value.HIDE_FRONT])
			update_vbuffer = true
		
		invert = value[e_value.INVERT]
		hide_back = value[e_value.HIDE_BACK]
		hide_front = value[e_value.HIDE_FRONT]
	}
	
	export_fn = ""
	export_stage = ""
	popup_close()
}
