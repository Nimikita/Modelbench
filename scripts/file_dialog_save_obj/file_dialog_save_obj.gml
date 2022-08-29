/// file_dialog_save_obj()

function file_dialog_save_obj()
{
	return file_dialog_save(text_get("filedialogsaveobj") + " (*.obj)|*.obj|", "", "", text_get("filedialogsaveobjcaption"))
}
