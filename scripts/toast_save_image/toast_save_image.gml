/// toast_save_image(fn)
/// @arg fn

function toast_save_image(fn)
{
	var sb = toast_new(e_toast.POSITIVE, text_get("snackbarsaveimage"));
	sb.actions[|0] = "snackbaropenimage"
	sb.actions[|1] = open_url
	sb.actions[|2] = fn
	
	return sb
}
