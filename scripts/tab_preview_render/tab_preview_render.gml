/// tab_preview_render()

// Ambient occlusion
tab_control_switch()
draw_switch("previewao", dx, dy, setting_render_ao, action_setting_render_ao, true)
tab_next()

// Shadows
tab_control_switch()
draw_switch("previewshadows", dx, dy, setting_render_shadows, action_setting_render_shadows, false)
tab_next()

// Anti-Aliasing
tab_control_switch()
draw_switch("previewaa", dx, dy, setting_render_aa, action_setting_render_aa, false)
tab_next()
