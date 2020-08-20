/// app_update_el_edit_list()
/// @desc Updates el_edit_list, mainly used for actions to be done in respect for the hierarchy

ds_list_clear(el_edit_list)

with (app)
{
	for (var i = 0; i < ds_list_size(part_list); i++)
	{
		with (part_list[|i])
			app_update_el_edit_list_part()
	}
}