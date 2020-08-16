/// file_dialog_import_model()

return file_dialog_open(text_get("filedialogopenmodel") + " (*.mimodel)|*.mimodel|" + text_get("filedialogopenmodelbackup") + " (*.mbbackup*)|*.mbbackup*|" + text_get("filedialogopenmodeltemplate") + " (*.mbtemplate)|*.mbtemplate|", "", models_directory, text_get("filedialogimportmodelcaption"))
