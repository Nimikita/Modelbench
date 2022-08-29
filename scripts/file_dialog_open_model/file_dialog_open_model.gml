/// file_dialog_open_model()

function file_dialog_open_model()
{
	return file_dialog_open(text_get("filedialogopenmodel") + " (*.mimodel)|*.mimodel|" + text_get("filedialogopenmodelbackup") + " (*.mbbackup*)|*.mbbackup*|", "", models_directory, text_get("filedialogopenmodelcaption"))
}
