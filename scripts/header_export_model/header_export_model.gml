/// header_export_model()

header_menu_panel()

draw_image(spr_icons, icons.WARNING, dx + dw/2, dy, 1, 1, c_warning, 1)
dy += 12 + 8

var disclaimer = text_get("exportdisclaimer");

if (model_planes3d > 0)
	disclaimer += "\n\n" + text_get("exportdisclaimer3dplanes")

draw_label(disclaimer, dx, dy, fa_left, fa_top, c_text_secondary, a_text_secondary, font_value, -1, dw)
dy += (string_height_ext(disclaimer, -1, dw) + 32)

var text = "";

if (export_mode = e_export.COMBINE_ALL)
	text = "exportmodecombineall"
else if (export_mode = e_export.SEPERATE_PARTS)
	text = "exportmodeseperateparts"
else if (export_mode = e_export.SEPERATE_SHAPES)
	text = "exportmodeseperateshapes"

tab_control_menu()
draw_button_menu("exportmode", e_menu.LIST, dx, dy, dw, 28, export_mode, text_get(text), action_export_mode)
tab_next()

tab_control_checkbox()
draw_switch("exportselectiononly", dx, dy, export_selection_only, action_export_selection_only, false)
tab_next()

tab_control_checkbox()
draw_switch("exportincludehidden", dx, dy, export_include_hidden, action_export_include_hidden, false)
tab_next()

tab_control_switch()
draw_switch("exportunparentparts", dx, dy, export_unparent_parts, action_export_unparent_parts, false, "exportunparentpartshelp")
tab_next()

tab_control_switch()
draw_switch("exportcombinelocked", dx, dy, export_combine_locked, action_export_combine_locked, false, "", export_mode != e_export.SEPERATE_PARTS)
tab_next()

tab_control(28)
draw_button_primary("exportobj", dx, dy, dw, export_start, null, fa_center)
tab_next()
