/// file_dialog_save_model()

function file_dialog_save_model()
{
	return file_dialog_save(text_get("filedialogsavemodel") + " (*.mimodel)|*.mimodel|", "", models_directory, text_get("filedialogsavemodelcaption"))
}
