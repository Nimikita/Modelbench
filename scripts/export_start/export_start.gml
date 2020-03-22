/// export_start()

export_fn = file_dialog_save_obj()

if (export_fn = "")
	return 0

export_mtl_fn = string_replace(export_fn, ".obj", ".mtl")

for (var i = 0; i < ds_list_size(part_list); i++)
{
	with (part_list[|i])
		el_update_parent_is_selected()
}

with (obj_model_element)
{
	update_vbuffer = false
	
	if (tree_hidden && !app.export_include_hidden)
		continue
	
	if ((selected || parent_is_selected) && app.export_selection_only)
	{
		if (shape_list != null)
		{
			for (var i = 0; i < ds_list_size(shape_list); i++)
			{
				with (shape_list[|i])
					update_vbuffer = true
			}
		}
		
		update_vbuffer = true
	}
	
	if (!app.export_selection_only)
		update_vbuffer = true
}

export_model = true

log(".obj export: Starting", export_fn)
log(".obj export: Generating verticies")
