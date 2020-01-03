/// snackbar_save_model()

var sb, errorsb, time;

snackbar_delete("snackbarsavemodel")
snackbar_delete("snackbarwarningemptymodelname")
snackbar_delete("snackbarwarningemptypartname")
snackbar_delete("snackbarwarningsamepartname")

sb = new_snackbar(icons.CHECKMARK, "snackbarsavemodel", "", e_snackbar.SUCCESS, 2)
time = sb.dismiss_time + 2

if (model_name = "")
{
	errorsb = snackbar_empty_model_name()
	errorsb.dismiss_time = time
	time += 2
}

if (warning_empty_part_names)
{
	errorsb = snackbar_empty_part_name()
	errorsb.dismiss_time = time
	time += 2
}

if (warning_same_part_names)
{
	errorsb = snackbar_same_part_name()
	errorsb.dismiss_time = time
}
