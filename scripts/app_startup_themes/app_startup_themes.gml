/// app_startup_themes()

// Themes
globalvar theme_light, theme_dark, theme_darker;

// Colors used in interface
globalvar c_accent, a_accent, c_accent_hover, a_accent_hover, c_accent_pressed, a_accent_pressed, c_hover, a_hover, c_accent_overlay, a_accent_overlay;
globalvar c_text_main, a_text_main, c_text_secondary, a_text_secondary, c_text_tertiary, a_text_tertiary;
globalvar c_border, a_border, c_overlay, a_overlay;
globalvar c_background, c_background_secondary, c_button_text, a_button_text;
globalvar c_viewport_top, c_viewport_bottom, c_error, c_warning, c_success, c_axisred, c_axisgreen, c_axisblue, c_axiscyan, c_axisyellow, c_axismagenta, c_bend;

update_interface_wait = false

// Alphas
a_accent = 1
a_accent_hover = 1
a_accent_pressed = 1
a_hover = .47
a_accent_overlay = .11

a_text_main = .91
a_text_secondary = .57
a_text_tertiary = .36

a_border = .14
a_overlay = .05

var theme_edit;

#region Light theme
theme_light = new(obj_theme);
theme_edit = theme_light

theme_edit.name = "light"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("DB3030"))
array_add(theme_edit.accent_list, hex_to_color("E7711B"))
array_add(theme_edit.accent_list, hex_to_color("E5A500"))
array_add(theme_edit.accent_list, hex_to_color("48B82C"))
array_add(theme_edit.accent_list, hex_to_color("2AAF5F"))
array_add(theme_edit.accent_list, hex_to_color("18B5AB"))
array_add(theme_edit.accent_list, hex_to_color("2144F1"))
array_add(theme_edit.accent_list, hex_to_color("982BCB"))
array_add(theme_edit.accent_list, hex_to_color("E93983"))

theme_edit.background = c_white
theme_edit.background_secondary = hex_to_color("E6E6E6")
theme_edit.viewport_top = hex_to_color("F0FFFF")
theme_edit.viewport_bottom = hex_to_color("B5E8F2")

theme_edit.text_main = hex_to_color("000000")
theme_edit.text_secondary = theme_edit.text_main
theme_edit.text_tertiary = theme_edit.text_main
theme_edit.border = theme_edit.text_main
theme_edit.overlay = theme_edit.text_main
theme_edit.button_text = hex_to_color("FFFFFF")
theme_edit.button_text_alpha = .91

// Other colors
theme_edit.red_error = hex_to_color("FF1D0F")
theme_edit.yellow_warning = hex_to_color("FFC01E")
theme_edit.green_success = hex_to_color("61C159")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("4AB758")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.cyan = hex_to_color("51C2FF")
theme_edit.yellow = hex_to_color("FFD969")
theme_edit.magenta = hex_to_color("FF37E8")

#endregion

#region Dark theme
theme_dark = new(obj_theme);
theme_edit = theme_dark

theme_edit.name = "dark"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("FF7E76"))
array_add(theme_edit.accent_list, hex_to_color("FFA360"))
array_add(theme_edit.accent_list, hex_to_color("FFF065"))
array_add(theme_edit.accent_list, hex_to_color("8BFF6D"))
array_add(theme_edit.accent_list, hex_to_color("4EF390"))
array_add(theme_edit.accent_list, hex_to_color("49EED9"))
array_add(theme_edit.accent_list, hex_to_color("98BBFF"))
array_add(theme_edit.accent_list, hex_to_color("DF9CFF"))
array_add(theme_edit.accent_list, hex_to_color("FF9BC5"))

theme_edit.background = hex_to_color("2B373D")
theme_edit.background_secondary = hex_to_color("18242A")
theme_edit.viewport_top = hex_to_color("2B373D")
theme_edit.viewport_bottom = hex_to_color("839096")

theme_edit.text_main = hex_to_color("FFFFFF")
theme_edit.text_secondary = theme_edit.text_main
theme_edit.text_tertiary = theme_edit.text_main
theme_edit.border = theme_edit.text_main
theme_edit.overlay = theme_edit.text_main
theme_edit.button_text = hex_to_color("000000")
theme_edit.button_text_alpha = .91

// Other colors
theme_edit.red_error = hex_to_color("FF7A72")
theme_edit.yellow_warning = hex_to_color("FFEB36")
theme_edit.green_success = hex_to_color("64E879")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("23FF88")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.cyan = hex_to_color("51C2FF")
theme_edit.yellow = hex_to_color("FFD969")
theme_edit.magenta = hex_to_color("FF37E8")

#endregion

#region Darker theme
theme_darker = new(obj_theme);
theme_edit = theme_darker

theme_edit.name = "darker"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("FF7E76"))
array_add(theme_edit.accent_list, hex_to_color("FFA360"))
array_add(theme_edit.accent_list, hex_to_color("FFF065"))
array_add(theme_edit.accent_list, hex_to_color("8BFF6D"))
array_add(theme_edit.accent_list, hex_to_color("4EF390"))
array_add(theme_edit.accent_list, hex_to_color("49EED9"))
array_add(theme_edit.accent_list, hex_to_color("98BBFF"))
array_add(theme_edit.accent_list, hex_to_color("DF9CFF"))
array_add(theme_edit.accent_list, hex_to_color("FF9BC5"))

theme_edit.background = hex_to_color("101010")
theme_edit.background_secondary = hex_to_color("0A0A0A")
theme_edit.viewport_top = hex_to_color("484848")
theme_edit.viewport_bottom = hex_to_color("2B2B2B")

theme_edit.text_main = hex_to_color("FFFFFF")
theme_edit.text_secondary = theme_edit.text_main
theme_edit.text_tertiary = theme_edit.text_main
theme_edit.border = theme_edit.text_main
theme_edit.overlay = theme_edit.text_main
theme_edit.button_text = hex_to_color("000000")
theme_edit.button_text_alpha = .91

// Other colors
theme_edit.red_error = hex_to_color("FF7A72")
theme_edit.yellow_warning = hex_to_color("FFEB36")
theme_edit.green_success = hex_to_color("64E879")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("23FF88")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.cyan = hex_to_color("51C2FF")
theme_edit.yellow = hex_to_color("FFD969")
theme_edit.magenta = hex_to_color("FF37E8")

#endregion
