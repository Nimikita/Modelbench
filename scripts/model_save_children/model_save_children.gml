/// model_save_children()

if (part_list = null)
	return 0

json_save_array_start("parts")

for (var i = 0; i < ds_list_size(part_list); i++)
{
	with (part_list[|i])
	{
		json_save_object_start()
		model_save_part()
		json_save_object_done()
	}
}

json_save_array_done()