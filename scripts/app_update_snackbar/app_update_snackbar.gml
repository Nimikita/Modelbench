/// app_update_snackbar()
/// @desc Updates all snackbars

var descheight;

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
	
	// Calculate additional height
	if (description != "")
	{
		draw_set_font(app.font_value)
		
		descheight = string_height_ext(text_get(description), 22, 480)
		
		// Adjust line spacing of last line
		snackbar_height += (descheight < 22 ? descheight + 8 : descheight - 4)
		
		if (snackbar_action1 || snackbar_action2)
			snackbar_height += 34
	}
	else
	{
		if (snackbar_action1 && snackbar_action2)
			snackbar_height += 34
	}
}

snackbar_amount = ds_list_size(snackbar_list)

// Calculate y position of snackbars(Starting from bottom)
var snackbary = window_height;
for (var i = 0; i < snackbar_amount; i++)
{
	var snackbar = snackbar_list[|i];
	
	with (snackbar)
	{
		// Delay just a tad so ensure smooth entry animation
		if (current_time - time_created < 100)
			continue
		
		snackbary -= (26 + snackbar_height)
		snackbar_goal_y = snackbary
		
		snackbar_y += (snackbar_goal_y - snackbar_y) / max(1, 3 / delta)
	}
}
