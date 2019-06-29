/// tab_element_editor_position()

tab_control(28)
textfield_group_add("elementeditorposx", el_edit.value[e_value.POS_X], 0, action_el_pos, X, tab.position.tbx_x)

axis_edit = test(setting_z_is_up, Y, Z)
textfield_group_add("elementeditorposy", el_edit.value[e_value.POS_X + axis_edit], 0, action_el_pos, axis_edit, tab.position.tbx_y)

axis_edit = test(setting_z_is_up, Z, Y)
textfield_group_add("elementeditorposz", el_edit.value[e_value.POS_X + axis_edit], 0, action_el_pos, axis_edit, tab.position.tbx_z)

draw_textfield_group("elementeditorpos", dx, dy, dw, 0.1, -no_limit, no_limit)
tab_next()
