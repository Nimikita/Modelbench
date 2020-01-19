/// action_el_offset_center()

axis_edit = context_menu_copy_axis_edit

el_value_set_start(action_el_offset, true)
el_value_set(e_value.OFFSET_X + axis_edit, -el_edit.value[e_value.WIDTH + axis_edit] / 2, false)
el_value_set_done()
