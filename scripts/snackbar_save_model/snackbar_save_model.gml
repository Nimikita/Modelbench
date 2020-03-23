/// snackbar_save_model()

var sb, errorsb, time;

snackbar_delete("snackbarsavemodel")
snackbar_delete("snackbarwarningsavemodel")

sb = new_snackbar(icons.CHECKMARK, "snackbarsavemodel", "", e_snackbar.SUCCESS, 2)
time = sb.dismiss_time

var errorstr, errors;
errorstr = ""
errors = (model_name = "") + warning_empty_part_names + warning_same_part_names
time += errors

if (model_name = "")
{
	errors--
	errorstr += "• " + text_get("snackbarwarningemptymodelname") + (errors > 0 ? "\n" : "")
}

if (warning_empty_part_names)
{
	errors--
	errorstr += "• " + text_get("snackbarwarningemptypartname") + (errors > 0 ? "\n" : "")
}

if (warning_same_part_names)
{
	errors--
	errorstr += "• " + text_get("snackbarwarningsamepartname") + (errors > 0 ? "\n" : "")
}

if (errorstr != "")
{
	errorsb = snackbar_error(errorstr)
	errorsb.dismiss_time = time
}
