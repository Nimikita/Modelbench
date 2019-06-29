/// tab_element_editor_scale()

tab_control(28)
textfield_group_add("elementeditorscalex", el_edit.value[e_value.SCA_X], 1, action_el_sca, X, tab.scale.tbx_x)

axis_edit = test(setting_z_is_up, Y, Z)
textfield_group_add("elementeditorscaley", el_edit.value[e_value.SCA_X + axis_edit], 1, action_el_sca, axis_edit, tab.scale.tbx_y)

axis_edit = test(setting_z_is_up, Z, Y)
textfield_group_add("elementeditorscalez", el_edit.value[e_value.SCA_X + axis_edit], 1, action_el_sca, axis_edit, tab.scale.tbx_z)

draw_textfield_group("elementeditorscale", dx, dy, dw, 0.1, 0.001, no_limit)
tab_next()
