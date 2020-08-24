/// tab_element_editor_position()

tab_control(28)
textfield_group_add("elementeditorpositionx", el_edit.value[e_value.POS_X], 0, action_el_pos, X, tab.position.tbx_x)

axis_edit = (setting_z_is_up ? Y : Z)
textfield_group_add("elementeditorpositiony", el_edit.value[e_value.POS_X + axis_edit], 0, action_el_pos, axis_edit, tab.position.tbx_y)

axis_edit = (setting_z_is_up ? Z : Y)
textfield_group_add("elementeditorpositionz", el_edit.value[e_value.POS_X + axis_edit], 0, action_el_pos, axis_edit, tab.position.tbx_z)

draw_textfield_group("elementeditorposition", dx, dy, dw, 0.1, -no_limit, no_limit, dragger_snap ? setting_snap_size_position : snap_min)
tab_next()
