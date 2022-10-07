/// action_el_rename_start()

function action_el_rename_start()
{
	if (el_edit = null)
		return 0
	
	assets.elements.name_edit_element_single = false
	window_focus = string(assets.elements.tbx_name)
	assets.elements.tbx_name.text = el_edit_list[|0].name
	assets.elements.name_edit_element = el_edit_list[|0]
}
