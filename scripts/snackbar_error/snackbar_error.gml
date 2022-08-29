/// snackbar_error(str)
/// @arg str

function snackbar_error(str)
{
	return new_snackbar(icons.WARNING, "snackbarwarningsavemodel", str, e_snackbar.WARNING)
}
