/// model_save_children()

// Don't write "parts" array if this is a part
if (ds_list_empty(part_list) && object_index = obj_model_element && element_type = TYPE_PART)
	return 0

json_save_array_start("parts")

// Model root needs "parts" array, even if it's empty
if (!ds_list_empty(part_list))
{
	for (var i = 0; i < ds_list_size(part_list); i++)
	{
		with (part_list[|i])
		{
			json_save_object_start()
			model_save_part()
			json_save_object_done()
		}
	}
}

json_save_array_done()