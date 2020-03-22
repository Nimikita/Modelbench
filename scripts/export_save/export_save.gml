/// export_save()
/// @desc Exports shape mesh data to .obj file

if (!(export_model && ds_list_size(app.update_vbuffer_list) = 0))
	return 0

log(".obj export: Compiling vertex data")

var str, postr, uvstr, facestr;
str = ""
postr = ""
uvstr = ""
facestr = ""

// Comments
str += "# Made with Modelbench" + "\n"
str += "# www.mineimator.com/modelbench" + "\n"

// Set material file
if (export_mtl_fn != "")
	str += "mtllib " + filename_name(export_mtl_fn) + "\n"

if (export_mode = e_export.COMBINE_ALL)
{
	str += "\n"
	str += "o " + (model_name = "" ? text_get("assetsmodelname") : model_name) + "\n"
	str += "\n"
}

// Compile all unique position and UV data into lists
var pos, uv, normal, vertex, duplicate;
var possize, uvsize, normalsize;
possize = 0
uvsize = 0
normalsize = 0

with (obj_model_element)
{
	if (element_type = TYPE_PART)
		continue
	
	// Vertex data not tracked
	if (shape_export_vertex_list = null)
		continue
	
	for (var i = 0; i < ds_list_size(shape_export_vertex_list); i++)
	{
		vertex = shape_export_vertex_list[|i]
		
		#region Position
		
		duplicate = false
		
		for (var j = 0; j < ds_list_size(shape_unique_position_list); j++)
		{
			pos = shape_unique_position_list[|j]
			
			if (array_equals(pos, shape_export_position_list[|i]))
			{
				duplicate = true
				break
			}
		}
		
		if (!duplicate)
		{
			ds_list_add(shape_unique_position_list, shape_export_position_list[|i])
			
			pos = shape_export_position_list[|i]
			postr += "v " + string_format(pos[X], 1, 6) + " " + string_format(pos[Y], 1, 6) + " " + string_format(pos[Z], 1, 6) + "\n"
			
			possize++
		}
		
		vertex[X] = ds_list_size(app.export_position_list) + j + 1
		
		#endregion
			
		#region UVs
		
		duplicate = false
		
	    for (var j = 0; j < ds_list_size(shape_unique_uv_list); j++)
	    {
	        uv = shape_unique_uv_list[|j]
        
	        if (array_equals(uv, shape_export_uv_list[|i]))
	        {
	            duplicate = true
	            break
	        }
	    }
    
	    if (!duplicate)
	    {
	        ds_list_add(shape_unique_uv_list, shape_export_uv_list[|i])
			
			uv = shape_export_uv_list[|i]
			uvstr += "vt " + string_format(uv[X], 1, 6) + " " + string_format(uv[Y], 1, 6) + "\n"
			
	        uvsize++
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
        
		        if (array_equals(normal, shape_export_normal_list[|i]))
		        {
		            duplicate = true
		            break
		        }
		    }
    
		    if (!duplicate)
		    {
		        ds_list_add(shape_unique_normal_list, shape_export_normal_list[|i])
		        normalsize++
		    }
		
			vertex[Z] = ds_list_size(app.export_normal_list) + j + 1
		}
		
		#endregion
		
		shape_export_vertex_list[|i] = vertex
	}
	
	for (var i = 0; i < ds_list_size(shape_unique_position_list); i++)
		ds_list_add(app.export_position_list, shape_unique_position_list[|i])
	
	for (var i = 0; i < ds_list_size(shape_unique_uv_list); i++)
		ds_list_add(app.export_uv_list, shape_unique_uv_list[|i])
	
	if (debug_export_normals)
	{
		for (var i = 0; i < ds_list_size(shape_unique_normal_list); i++)
			ds_list_add(app.export_normal_list, shape_unique_normal_list[|i])
	}
}

// Write face data
log(".obj export: Building face data")

export_material = ""

for (var i = 0; i < ds_list_size(part_list); i++)
{
	with (part_list[|i])
		facestr = export_save_part(facestr)
}

show_debug_message(facestr)

str += postr + "\n" + uvstr + "\n" + facestr + "\n"
str += "# " + string(export_verticies) + " verticies, " + string(export_verticies/3) + " triangles"

export_verticies = 0
ds_list_clear(export_position_list)
ds_list_clear(export_uv_list)
ds_list_clear(export_normal_list)

log(".obj export: Writing to file")

var file = file_text_open_write(export_fn)
file_text_write_string(file, str)
file_text_close(file)

export_save_mtl()

log(".obj export: Done")

export_fn = ""
export_model = false
