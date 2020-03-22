/// export_save_part(str)
/// @arg str

var str = argument0;

// Skip this part's shapes, move onto children
if (app.export_selection_only)
{
	if (!((selected || parent_is_selected) && app.export_selection_only))
	{
		for (var i = 0; i < ds_list_size(part_list); i++)
		{	
			with (part_list[|i])
				str = export_save_part(str)
		}

		return str
	}
}

var definepart = true;

if (app.export_mode = e_export.SEPERATE_PARTS)
{
	if (parent.object_index != app && (parent.locked || parent.tree_locked) && app.export_combine_locked)
		definepart = false
	else
		definepart = true
	
	if (definepart)
	{
		str += "\n"
		str += "o " + (name = "" ? text_get("assetsnewpart") : name) + "\n"
		str += "\n"
	}
}
	
// Change material
if (app.export_material != filename_change_ext(res.filename, "") && definepart)
{
	app.export_material = filename_change_ext(res.filename, "")
	res.export_save_tex = true
	
	str += "usemtl " + app.export_material + "\n"
	str += "\n"
}
	
for (var i = 0; i < ds_list_size(shape_list); i++)
{
	with (shape_list[|i])
	{
		// Vertex data not tracked
		if (shape_export_vertex_list = null)
			continue
		
		if (app.export_mode = e_export.SEPERATE_SHAPES)
		{
			str += "\n"
			str += "o " + (name = "" ? text_get("assetsnewshape") : name) + "\n"
			str += "\n"
		}
			
		// Change material
		if (value[e_value.TEXTURE_OBJ] != null || (app.export_material != filename_change_ext(res.filename, "")))
		{
			// Seperate polygon group
			if (app.export_mode != e_export.SEPERATE_SHAPES)
			{
				str += "\n"
				str += "g " + (name = "" ? text_get("assetsnewshape") : name) + "\n"
			}
				
			app.export_material = filename_change_ext(res.filename, "")
			res.export_save_tex = true
			
			str += "usemtl " + app.export_material + "\n"
			str += "\n"
		}
			
		for (var j = 0; j < ds_list_size(shape_export_vertex_list); j += 3)
		{
			str += "f "
				
			for (var k = 0; k < 3; k++)
			{
				vertex = shape_export_vertex_list[|j + k]
				str += string(vertex[X]) + "/" + string(vertex[Y])
					
				if (debug_export_normals)
					str += "/" + string(vertex[Z]) + (k = 2 ? "\n" : " ")
				else
					str += (k = 2 ? "\n" : " ")
			}
		}
	
		app.export_verticies += ds_list_size(shape_export_vertex_list)
	
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
}

for (var i = 0; i < ds_list_size(part_list); i++)
{	
	with (part_list[|i])
		str = export_save_part(str)
}

return str
