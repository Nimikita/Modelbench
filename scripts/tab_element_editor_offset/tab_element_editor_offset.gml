/// tab_element_editor_offset()

tab_control(28)
axis_edit = X
textfield_group_add("elementeditoroffsetx", el_edit.value[e_value.OFFSET_X], 0, action_el_offset, X, tab.pivot_offset.tbx_x)

axis_edit = (setting_z_is_up ? Y : Z)
textfield_group_add("elementeditoroffsety", el_edit.value[e_value.OFFSET_X + axis_edit], 0, action_el_offset, axis_edit, tab.pivot_offset.tbx_y)

axis_edit = (setting_z_is_up ? Z : Y)
textfield_group_add("elementeditoroffsetz", el_edit.value[e_value.OFFSET_X + axis_edit], 0, action_el_offset, axis_edit, tab.pivot_offset.tbx_z)

draw_textfield_group("elementeditoroffset", dx, dy, dw, 0.1, -no_limit, no_limit, setting_snap ? setting_snap_size_position : snap_min)
tab_next()
