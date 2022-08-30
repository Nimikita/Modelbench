/// snackbar_save_image(fn)
/// @arg fn

function snackbar_save_image(fn)
{
	var sb = new_snackbar(icons.TICK, "snackbarsaveimage", "", e_snackbar.SUCCESS, 5);
	sb.snackbar_action1_name = "snackbaropenimage"
	sb.snackbar_action1 = open_url
	sb.snackbar_action1_value = fn
	
	return sb
}
