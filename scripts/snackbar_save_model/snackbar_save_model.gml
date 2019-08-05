/// snackbar_save_model()

new_snackbar(e_icon.checkmark, text_get("snackbarsavemodel"), "", e_snackbar.SUCCESS)

if (model_name = "")
	snackbar_empty_model_name()
	
if (warning_empty_part_names)
	snackbar_empty_part_name()
	
if (warning_same_part_names)
	snackbar_same_part_name()
