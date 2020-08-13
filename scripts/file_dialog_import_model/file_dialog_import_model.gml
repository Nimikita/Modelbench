/// file_dialog_import_model()

return file_dialog_open(text_get("filedialogopenmodeltemplate") + " (*.mbtemplate)|*.mbtemplate|" + text_get("filedialogopenmodel") + " (*.mimodel)|*.mimodel|" + text_get("filedialogopenmodelbackup") + " (*.mbbackup*)|*.mbbackup*|", "", templates_directory, text_get("filedialogimportmodelcaption"))
