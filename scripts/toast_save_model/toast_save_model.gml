/// toast_save_model()

function toast_save_model()
{
	toast_delete("snackbarsavemodel")
	toast_new(e_toast.POSITIVE, text_get("snackbarsavemodel"))
}
