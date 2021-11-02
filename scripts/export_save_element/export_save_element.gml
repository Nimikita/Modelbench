/// export_save_element()

if (element_type = TYPE_PART)
{
	var definepart = true;

	if (app.export_mode = e_export.SEPERATE_PARTS)
	{
		if (parent.object_index != app && (parent.locked || parent.tree_locked) && app.export_combine_locked)
			definepart = false
		else
			definepart = true
	
		if (definepart)
		{
			file_text_write_string(app.export_file, "\n")
			file_text_write_string(app.export_file, "o " + (name = "" ? text_get("assetsnewpart") : name) + "\n")
			file_text_write_string(app.export_file, "\n")
		}
	}
	
	// Change material
	if (app.export_material != filename_change_ext(res.filename, "") && definepart && false)
	{
		app.export_material = filename_change_ext(res.filename, "")
		res.export_save_tex = true
	
		file_text_write_string(app.export_file, "usemtl " + app.export_material + "\n")
		file_text_write_string(app.export_file, "\n")
	}
}

if (element_type = TYPE_SHAPE)
{
	// Vertex data not tracked
	if (shape_export_vertex_list = null)
		return 0
		
	if (app.export_mode = e_export.SEPERATE_SHAPES)
	{
		file_text_write_string(app.export_file, "\n")
		file_text_write_string(app.export_file, "o " + (name = "" ? text_get("assetsnewshape") : name) + "\n")
		file_text_write_string(app.export_file, "\n")
	}
			
	// Change material
	var fnfilter = string_replace_all(filename_change_ext(res.filename, ""), " ", "_");
	if (app.export_material != fnfilter)
	{
		// Seperate polygon group
		if (app.export_mode != e_export.SEPERATE_SHAPES)
		{
			file_text_write_string(app.export_file, "\n")
			file_text_write_string(app.export_file, "g " + (name = "" ? text_get("assetsnewshape") : name) + "\n")
		}
		
		app.export_material = fnfilter
		res.export_save_tex = true
		
		file_text_write_string(app.export_file, "usemtl " + app.export_material + "\n")
		file_text_write_string(app.export_file, "\n")
	}
	
	var isbent = !vec3_equals(parent.bend_default_angle, vec3(0)) && bend_shape;
	
	// Triangles
	if (isbent)
	{
		for (var j = 3; j < ds_list_size(shape_export_vertex_list); j += 3)
		{
			file_text_write_string(app.export_file, "f ")
				
			for (var k = 0; k < 3; k++)
			{
				vertex = shape_export_vertex_list[|j + k]
				file_text_write_string(app.export_file, string(vertex[X]) + "/" + string(vertex[Y]))
					
				if (debug_export_normals)
					file_text_write_string(app.export_file, "/" + string(vertex[Z]) + (k = 2 ? "\n" : " "))
				else
					file_text_write_string(app.export_file, (k = 2 ? "\n" : " "))
			}
			
			app.export_triangles++
		}
	}
	else // Quads
	{
		var v = 0;
	
		for (var j = 3; j < ds_list_size(shape_export_vertex_list); j += 6)
		{
			file_text_write_string(app.export_file, "f ")
				
			for (var k = 0; k < 4; k++)
			{
				v = k
			
				if (k = 3)
					v = 4
			
				vertex = shape_export_vertex_list[|j + v]
				file_text_write_string(app.export_file, string(vertex[X]) + "/" + string(vertex[Y]))
					
				if (debug_export_normals)
					file_text_write_string(app.export_file, "/" + string(vertex[Z]) + (k = 3 ? "\n" : " "))
				else
					file_text_write_string(app.export_file, (k = 3 ? "\n" : " "))
			}
			
			app.export_quads++
		}
	}
	
	app.export_verticies += ds_list_size(shape_export_vertex_list) - 3
	
	// Delete lists
	ds_list_destroy(shape_export_position_list)
	ds_list_destroy(shape_export_uv_list)
	ds_list_destroy(shape_export_vertex_list)
	ds_list_destroy(shape_unique_position_list)
	ds_list_destroy(shape_unique_uv_list)
			
	shape_export_position_list = null
	shape_export_uv_list = null
	shape_export_vertex_list = null
	shape_unique_position_list = null
	shape_unique_uv_list = null
			
	if (debug_export_normals)
	{
		ds_list_destroy(shape_export_normal_list)
		ds_list_destroy(shape_unique_normal_list)
		shape_export_normal_list = null
		shape_unique_normal_list = null
	}
}
