/// app_update_program_mode()
/// @desc Hides and shows tabs depending on current program mode

if (program_mode = e_mode.MODELING)
{
	tab_show(assets)
	tab_show(element_editor)
	tab_close(preview)
	app_update_el_edit_tabs()
}
else if (program_mode = e_mode.PREVIEW)
{
	tab_close(assets)
	tab_close(element_editor)
	tab_show(preview)
}


