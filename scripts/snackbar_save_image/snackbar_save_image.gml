/// snackbar_save_image(fn)
/// @arg fn

var sb = new_snackbar(icons.CHECKMARK, "snackbarsaveimage", "", e_snackbar.SUCCESS, 5);

sb.snackbar_action1_name = "snackbaropenimage"
sb.snackbar_action1 = open_url
sb.snackbar_action1_value = argument0

return sb
