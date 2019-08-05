/// app_update_snackbar()
/// @desc Updates all snackbars

// Execute any scripts
if (snackbar_script != null)
{
	if (snackbar_script_value != null)
		script_execute(snackbar_script, snackbar_script_value)
	else
		script_execute(snackbar_script)
}
snackbar_script = null
snackbar_script_value = null

// Update
with (obj_snackbar)
{
	if (remove)
		ds_list_delete_value(app.snackbar_list, id)
	
	snackbar_height = 44
	
	if (description != "")
		snackbar_height += 22
	
	if (snackbar_action1 || snackbar_action2)
		snackbar_height += 22
}

snackbar_amount = ds_list_size(snackbar_list)

// Calculate y position of snackbars(Starting from bottom)
var snackbary = window_height;
for (var i = 0; i < snackbar_amount; i++)
{
	var snackbar = snackbar_list[|i];
	
	with (snackbar)
	{
		snackbary -= (26 + snackbar_height)
		snackbar_goal_y = snackbary
		
		snackbar_y += (snackbar_goal_y - snackbar_y) / max(1, 3 / delta)
	}
}
