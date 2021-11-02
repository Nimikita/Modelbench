/// export_save()
/// @desc Exports shape mesh data to .obj file

if (export_stage = "")
	return 0

if (export_stage = "generation" && ds_list_size(update_vbuffer_list) = 0)
	export_stage = "compile"

// Compile all unique position and UV data into lists
if (export_stage = "compile")
{
	var pos, uv, normal, vertex, duplicate;
	
	repeat (1)
	{
		with (export_shapes[|export_compile_done])
		{
			// Vertex data not tracked
			if (shape_export_vertex_list = null)
				continue
			
			shape_position_string = ""
			shape_uv_string = ""
			
			for (var v = 3; v < ds_list_size(shape_export_vertex_list); v++)
			{
				vertex = shape_export_vertex_list[|v]
				
				#region Position
				
				duplicate = false
				
				for (var j = 0; j < ds_list_size(shape_unique_position_list); j++)
				{
					pos = shape_unique_position_list[|j]
					
					if (array_equals(pos, shape_export_position_list[|v]))
					{
						duplicate = true
						break
					}
				}
				
				if (!duplicate)
				{
					ds_list_add(shape_unique_position_list, shape_export_position_list[|v])
					pos = shape_export_position_list[|v]
					shape_position_string += "v " + string_format(pos[X], 1, 6) + " " + string_format(pos[Y], 1, 6) + " " + string_format(pos[Z], 1, 6) + "\n"
				}
				
				vertex[X] = ds_list_size(app.export_position_list) + j + 1
				
				#endregion
				
				#region UVs
				
				duplicate = false
				
			    for (var j = 0; j < ds_list_size(shape_unique_uv_list); j++)
			    {
			        uv = shape_unique_uv_list[|j]
        
			        if (array_equals(uv, shape_export_uv_list[|v]))
			        {
			            duplicate = true
			            break
			        }
			    }
				
			    if (!duplicate)
			    {
			        ds_list_add(shape_unique_uv_list, shape_export_uv_list[|v])
			
					uv = shape_export_uv_list[|v]
					shape_uv_string += "vt " + string_format(uv[X], 1, 6) + " " + string_format(uv[Y], 1, 6) + "\n"
			    }
		
				vertex[Y] = ds_list_size(app.export_uv_list) + j + 1
		
				#endregion
				
				#region Normals
		
				if (debug_export_normals)
				{
					duplicate = false
		
				    for (var j = 0; j < ds_list_size(shape_unique_normal_list); j++)
				    {
				        normal = shape_unique_normal_list[|j]
        
				        if (array_equals(normal, shape_export_normal_list[|v]))
				        {
				            duplicate = true
				            break
				        }
				    }
    
				    if (!duplicate)
				    {
				        ds_list_add(shape_unique_normal_list, shape_export_normal_list[|v])
				    }
		
					vertex[Z] = ds_list_size(app.export_normal_list) + j + 1
				}
		
				#endregion
				
				shape_export_vertex_list[|v] = vertex
			}
	
			for (var p = 0; p < ds_list_size(shape_unique_position_list); p++)
				ds_list_add(app.export_position_list, shape_unique_position_list[|p])
	
			for (var u = 0; u < ds_list_size(shape_unique_uv_list); u++)
				ds_list_add(app.export_uv_list, shape_unique_uv_list[|u])
	
			if (debug_export_normals)
			{
				for (var n = 0; n < ds_list_size(shape_unique_normal_list); n++)
					ds_list_add(app.export_normal_list, shape_unique_normal_list[|n])
			}
		}
		
		export_compile_done++
		
		if (export_compile_done = ds_list_size(export_shapes))
		{
			export_stage = "face"
			export_material = ""
			
			// Add position strings
			for (var i = 0; i < ds_list_size(export_shapes); i++)
			{
				var shape = export_shapes[|i];
				
				if (shape.shape_export_vertex_list = null)
					continue
				
				file_text_write_string(export_file, shape.shape_position_string)
			}

			// Add UV strings
			for (var i = 0; i < ds_list_size(export_shapes); i++)
			{
				var shape = export_shapes[|i];
				
				if (shape.shape_export_vertex_list = null)
					continue
				
				file_text_write_string(export_file, shape.shape_uv_string)
			}
			
			return 0
		}
	}
}

// Write face data
if (export_stage = "face")
{
	repeat (1)
	{
		var element = export_elements[|export_face_done];
		
		with (element)
			export_save_element()
		
		export_face_done++
	}
	
	if (export_face_done = ds_list_size(export_elements))
		export_stage = "finish"
}

if (export_stage = "finish")
	export_end()
