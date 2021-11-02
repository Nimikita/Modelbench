/// export_start()

export_fn = file_dialog_save_obj()

if (export_fn = "")
	return 0


log("Starting .obj export", export_fn)


// Get material filename
export_mtl_fn = string_replace(export_fn, ".obj", ".mtl")


// Update meshes for shapes that will be exported
with (obj_model_element)
{
	update_vbuffer = false
	
	if (tree_hidden && !app.export_include_hidden)
		continue
	
	// Change appearance values (To prevent possible mesh issues)
	invert = false
	hide_back = false
	hide_front = false
	
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
	
	if (update_vbuffer)
	{
		ds_list_add(app.export_shapes, id)
		
		if (shape_vbuffer != null)
		{
			vbuffer_destroy(shape_vbuffer)
			shape_vbuffer = null
		}
	}
}

// Flatten hierarchy into list
for (var i = 0; i < ds_list_size(part_list); i++)
{
	with (part_list[|i])
		export_add_part()
}


/* 
	Open file for writing, data is written throughout the export process instead of saved
	in a large string due to memory issues with YYC.
*/

export_file = file_text_open_write(export_fn)


// Comments
file_text_write_string(export_file, "# Made with Modelbench" + "\n")
file_text_write_string(export_file, "# www.mineimator.com/modelbench" + "\n")

// Set material file
if (export_mtl_fn != "")
	file_text_write_string(export_file, "mtllib " + filename_name(export_mtl_fn) + "\n")

// Set model name
if (export_mode = e_export.COMBINE_ALL)
{
	file_text_write_string(export_file, "\n")
	file_text_write_string(export_file, "o " + (model_name = "" ? text_get("assetsmodelname") : model_name) + "\n")
	file_text_write_string(export_file, "\n")
}


// Reset progress
export_generation_done = 0
export_generation_max = ds_list_size(export_shapes)

export_compile_done = 0
export_compile_max = ds_list_size(export_shapes)

export_face_done = 0
export_face_max = ds_list_size(export_elements)

// Set to first stage
export_stage = "generation"


// Show popup
popup_show(popup_export)
