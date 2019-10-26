/// tab_element_editor_size()

tab_control(28)
textfield_group_add("elementeditorsizew", el_edit.value[e_value.WIDTH], 0, action_el_size, X, tab.size.tbx_width)
textfield_group_add("elementeditorsizel", el_edit.value[e_value.LENGTH], 0, action_el_size, Y, tab.size.tbx_length)
textfield_group_add("elementeditorsizeh", el_edit.value[e_value.HEIGHT], 0, action_el_size, Z, tab.size.tbx_height)
draw_textfield_group("elementeditorsize", dx, dy, dw, 0.1, -no_limit, no_limit, snap_min)
tab_next()
