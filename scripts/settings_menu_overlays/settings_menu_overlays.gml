/// settings_menu_overlays()

var capwid = text_caption_width("settingsmenuoverlaysgrid", "settingsmenuoverlaysgizmos", "settingsmenuoverlayshighlights", "settingsmenuoverlaysoutlines", "settingsmenuoverlaysoutlineopacity");
capwid = max(180, capwid + 32)

dx = content_x + 10
dy = content_y + 8
dw = content_width - 20
dh = content_height - 16

tab_control_switch()
draw_switch("settingsmenuoverlaysgrid", dx, dy, setting_overlays_grid, action_setting_overlays_grid, true)
tab_next()

tab_control_switch()
draw_switch("settingsmenuoverlaysgizmos", dx, dy, setting_overlays_gizmos, action_setting_overlays_gizmos, true)
tab_next()

tab_control_switch()
draw_switch("settingsmenuoverlayshighlights", dx, dy, setting_overlays_highlights, action_setting_overlays_highlights, true)
tab_next()

tab_control_switch()
draw_switch("settingsmenuoverlaysoutlines", dx, dy, setting_overlays_outlines, action_setting_overlays_outlines, true)
tab_next()

tab_control_meter()
draw_meter("settingsmenuoverlaysoutlineopacity", dx, dy, dw, round(setting_overlays_outline_opacity * 100), 48, 0, 100, 15, 1, tbx_overlays_outline_opacity, action_setting_overlays_outline_opacity)
tab_next()

settings_menu_w = capwid
settings_menu_h = dy - content_y 
toolbar_viewport_alpha_goal = 1
