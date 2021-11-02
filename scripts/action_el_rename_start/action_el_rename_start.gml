/// action_el_rename_start()

assets.elements.name_edit_element_single = false
//window_busy = string(assets.elements.tbx_name)
window_focus = string(assets.elements.tbx_name)
assets.elements.tbx_name.text = el_edit_list[|0].name
assets.elements.name_edit_element = el_edit_list[|0]
