/// file_dialog_open_model_template()

return file_dialog_open(text_get("filedialogopenmodeltemplate") + " (*.mbtemplate)|*.mbtemplate|" + text_get("filedialogopenmodel") + " (*.mimodel)|*.mimodel|" + text_get("filedialogopenmodelbackup") + " (*.mbbackup*)|*.mbbackup*|", "", templates_directory, text_get("filedialogopenmodeltemplatecaption"))
