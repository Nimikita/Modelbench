/// header_open_model()

header_menu_panel()

var recentsize = 28 + (48 * min(recent_list_amount, 6));
tab_control(recentsize)
draw_recent(dx, dy, dw, recentsize)
tab_next()

draw_button_primary("openmodelbrowse", dx, dy, null, model_load, e_icon.open_file, fa_center)
