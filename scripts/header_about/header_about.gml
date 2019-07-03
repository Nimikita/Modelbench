/// header_about()

header_menu_panel()

draw_image(spr_icon, 0, dx + dw/2, dy + 64)
dy += 128 + 32

// Modelbench version
draw_label("Modelbench " + modelbench_version_full, dx + dw/2, dy, fa_center, fa_bottom, c_accent, 1, font_heading)
dy += 16
draw_label(text_get("aboutforversion", "MINE-IMATOR 1.2.5"), dx + dw/2, dy, fa_center, fa_bottom, c_neutral30, a_neutral30, font_subheading)
dy += 32

// Credits
draw_label(text_get("aboutcredits"), dx, dy, fa_left, fa_bottom, c_neutral30, a_neutral30, font_subheading)
dy += 42

draw_label(text_get("aboutleaddeveloper"), dx, dy - 16, fa_left, fa_bottom, c_neutral50, a_neutral50, font_emphasis)
draw_label("Nimi", dx, dy - 16 + 4, fa_left, fa_top, c_neutral60, a_neutral60, font_value)
dy += 32 + 16

draw_label(text_get("aboutleaduidesigner"), dx, dy - 16, fa_left, fa_bottom, c_neutral50, a_neutral50, font_emphasis)
draw_label("Voxy", dx, dy - 16 + 4, fa_left, fa_top, c_neutral60, a_neutral60, font_value)
dy += 32 + 16

draw_label(text_get("aboutspecialthanks"), dx, dy - 16, fa_left, fa_bottom, c_neutral50, a_neutral50, font_emphasis)
draw_label("David", dx, dy - 16 + 4, fa_left, fa_top, c_neutral60, a_neutral60, font_value)
