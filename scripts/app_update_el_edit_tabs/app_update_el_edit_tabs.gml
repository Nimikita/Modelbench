/// app_update_tl_edit_tabs()

function app_update_el_edit_tabs()
{
	if (el_edit_amount > 0)
		tab_show(app.element_editor)
	else
		tab_close(app.element_editor)
}
