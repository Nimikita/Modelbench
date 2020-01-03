/// header_menu_panel()
/// @desc Draws a header for panels apart of the menu panel

dy += 2

tab_control(50)

draw_label(tab_get_title(content_tab), dx, dy + 14, fa_left, fa_center, c_accent, 1, font_heading)

if (draw_button_icon("menupanelclose", dx + dw - 28 + icon_button_offset, dy, 28, 28, false, icons.CLOSE, null, false, "tooltipclose"))
	menu_panel_ext_ani_type = "hide"

tab_next(false)
