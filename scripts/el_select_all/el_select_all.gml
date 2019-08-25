/// el_select_all()
/// @desc Selects all parts parented to the model root

for (var i = 0; i < ds_list_size(app.part_list); i++)
{
	with (app.part_list[|i])
	{
		selected = true
		el_update_parent_is_selected()
	}
	
	el_edit_amount++
	if (i = 0)
		el_edit = app.part_list[|0]
}
