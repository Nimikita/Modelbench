/// history_destroy_loaded()
/// @desc Destroy the loaded objects.

function history_destroy_loaded()
{
	for (var i = 0; i < loaded_amount; i++)
	{
		with (save_id_find(loaded_save_id[i]))
		{
			if (object_index = obj_texture && copied)
				file_delete_lib(app.model_folder + "\\" + filename)
			instance_destroy()
		}
	}
}
