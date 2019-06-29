/// tab_element_editor_rotation()

tab_control(60)

axis_edit = X
draw_wheel("elementeditorrotx", dx + dw/6, dy + 24, c_axisred, el_edit.value[e_value.ROT_X], -no_limit, no_limit, 0, 1, false, tab.rotation.tbx_x, action_el_rot)

axis_edit = test(setting_z_is_up, Y, Z)
draw_wheel("elementeditorroty", dx + dw/2, dy + 24, c_axisblue, el_edit.value[e_value.ROT_X + axis_edit], -no_limit, no_limit, 0, 1, false, tab.rotation.tbx_y, action_el_rot)

axis_edit = test(setting_z_is_up, Z, Y)
draw_wheel("elementeditorrotz", dx + dw - dw/6, dy + 24, c_axisgreen, el_edit.value[e_value.ROT_X + axis_edit], -no_limit, no_limit, 0, 1, false, tab.rotation.tbx_z, action_el_rot)

tab_next()
