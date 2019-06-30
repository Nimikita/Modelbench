/// tab_element_editor_mineimator()

/// (Render) depth
tab_control(28)
draw_textfield_num("elementeditordepth", dx, dy, 86, el_edit.depth, 0.1, -no_limit, no_limit, 0, 1, element_editor.tbx_depth, action_el_depth)
tab_next()

// Open position tab
tab_control_switch()
draw_switch("elementeditoropenpositiontab", dx, dy, el_edit.value[e_value.OPEN_POSITION_TAB], action_el_open_position_tab, "elementeditoropenpositiontabhelp")
tab_next()

// Open rotation tab
tab_control_switch()
draw_switch("elementeditoropenrotationtab", dx, dy, el_edit.value[e_value.OPEN_ROTATION_TAB], action_el_open_rotation_tab, "elementeditoropenrotationtabhelp")
tab_next()

// Open scale tab
tab_control_switch()
draw_switch("elementeditoropenscaletab", dx, dy, el_edit.value[e_value.OPEN_SCALE_TAB], action_el_open_scale_tab, "elementeditoropenscaletabhelp")
tab_next()
