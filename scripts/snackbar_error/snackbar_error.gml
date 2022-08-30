/// snackbar_error(str)
/// @arg str

function snackbar_error(str)
{
	return new_snackbar(icons.WARNING_DIAMOND, "snackbarwarningsavemodel", str, e_snackbar.WARNING)
}
