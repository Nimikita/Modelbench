/// app_startup_themes()

globalvar c_accent, c_accent10, a_accent10, c_accent20, a_accent20, c_accent30, a_accent30, c_accent50, a_accent50, c_accent80, a_accent80;
globalvar c_neutral10, a_neutral10, c_neutral20, a_neutral20, c_neutral30, a_neutral30, c_neutral40, a_neutral40, c_neutral50, a_neutral50, c_neutral60, a_neutral60;
globalvar c_background, c_viewport_top, c_viewport_bottom, c_error, c_warning, c_success, c_axisred, c_axisgreen, c_axisblue, c_origin, c_bend;
globalvar theme_light, theme_dark, theme_darker;

var theme_edit;

#region Light theme
theme_light = new(obj_theme);
theme_edit = theme_light

theme_edit.name = "light"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("EE3030"))
array_add(theme_edit.accent_list, hex_to_color("E47D31"))
array_add(theme_edit.accent_list, hex_to_color("ECAD0C"))
array_add(theme_edit.accent_list, hex_to_color("53CD35"))
array_add(theme_edit.accent_list, hex_to_color("18B557"))
array_add(theme_edit.accent_list, hex_to_color("18B5AB"))
array_add(theme_edit.accent_list, hex_to_color("2144F1"))
array_add(theme_edit.accent_list, hex_to_color("982BCB"))
array_add(theme_edit.accent_list, hex_to_color("E93983"))

theme_edit.background = c_white
theme_edit.viewport_top = hex_to_color("F0FFFF")
theme_edit.viewport_bottom = hex_to_color("B5E8F2")

// Accent alpha
theme_edit.accent_10a = .11
theme_edit.accent_20a = .28
theme_edit.accent_30a = .47
theme_edit.accent_50a = 1
theme_edit.accent_80a = 1

// Neutral colors
theme_edit.neutral = hex_to_color("000000")

theme_edit.neutral_10 = theme_edit.neutral
theme_edit.neutral_10a = .05

theme_edit.neutral_20 = theme_edit.neutral
theme_edit.neutral_20a = .14

theme_edit.neutral_30 = theme_edit.neutral
theme_edit.neutral_30a = .36

theme_edit.neutral_40 = theme_edit.neutral
theme_edit.neutral_40a = .45

theme_edit.neutral_50 = theme_edit.neutral
theme_edit.neutral_50a = .57

theme_edit.neutral_60 = theme_edit.neutral
theme_edit.neutral_60a = .91

// Other colors
theme_edit.red_error = hex_to_color("FF1D0F")
theme_edit.yellow_warning = hex_to_color("FFC01E")
theme_edit.green_success = hex_to_color("61C159")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("23FF88")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.origin = hex_to_color("00FFFF")

#endregion

#region Dark theme
theme_dark = new(obj_theme);
theme_edit = theme_dark

theme_edit.name = "dark"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("FF5F55"))
array_add(theme_edit.accent_list, hex_to_color("FA9B56"))
array_add(theme_edit.accent_list, hex_to_color("FFED47"))
array_add(theme_edit.accent_list, hex_to_color("73DF58"))
array_add(theme_edit.accent_list, hex_to_color("35D274"))
array_add(theme_edit.accent_list, hex_to_color("30DDC8"))
array_add(theme_edit.accent_list, hex_to_color("4986FB"))
array_add(theme_edit.accent_list, hex_to_color("BB5DE8"))
array_add(theme_edit.accent_list, hex_to_color("FF6593"))

theme_edit.background = hex_to_color("2B373D")
theme_edit.viewport_top = hex_to_color("2B373D")
theme_edit.viewport_bottom = hex_to_color("839096")

// Accent alpha
theme_edit.accent_10a = .11
theme_edit.accent_20a = .28
theme_edit.accent_30a = .47
theme_edit.accent_50a = 1
theme_edit.accent_80a = 1

// Neutral colors
theme_edit.neutral = hex_to_color("FFFFFF")

theme_edit.neutral_10 = theme_edit.neutral
theme_edit.neutral_10a = .05

theme_edit.neutral_20 = theme_edit.neutral
theme_edit.neutral_20a = .14

theme_edit.neutral_30 = theme_edit.neutral
theme_edit.neutral_30a = .36

theme_edit.neutral_40 = theme_edit.neutral
theme_edit.neutral_40a = .45

theme_edit.neutral_50 = theme_edit.neutral
theme_edit.neutral_50a = .57

theme_edit.neutral_60 = theme_edit.neutral
theme_edit.neutral_60a = .91

// Other colors
theme_edit.red_error = hex_to_color("FC453A")
theme_edit.yellow_warning = hex_to_color("FFEB36")
theme_edit.green_success = hex_to_color("64E879")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("23FF88")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.origin = hex_to_color("00FFFF")

#endregion

#region Darker theme
theme_darker = new(obj_theme);
theme_edit = theme_darker

theme_edit.name = "darker"
theme_edit.pattern = 0
theme_edit.accent_list = array()
array_add(theme_edit.accent_list, hex_to_color("FF5F55"))
array_add(theme_edit.accent_list, hex_to_color("FA9B56"))
array_add(theme_edit.accent_list, hex_to_color("FFED47"))
array_add(theme_edit.accent_list, hex_to_color("73DF58"))
array_add(theme_edit.accent_list, hex_to_color("35D274"))
array_add(theme_edit.accent_list, hex_to_color("30DDC8"))
array_add(theme_edit.accent_list, hex_to_color("4986FB"))
array_add(theme_edit.accent_list, hex_to_color("BB5DE8"))
array_add(theme_edit.accent_list, hex_to_color("FF6593"))

theme_edit.background = hex_to_color("101010")
theme_edit.viewport_top = hex_to_color("484848")
theme_edit.viewport_bottom = hex_to_color("2B2B2B")

// Accent alpha
theme_edit.accent_10a = .11
theme_edit.accent_20a = .28
theme_edit.accent_30a = .47
theme_edit.accent_50a = 1
theme_edit.accent_80a = 1

// Neutral colors
theme_edit.neutral = hex_to_color("FFFFFF")

theme_edit.neutral_10 = theme_edit.neutral
theme_edit.neutral_10a = .05

theme_edit.neutral_20 = theme_edit.neutral
theme_edit.neutral_20a = .14

theme_edit.neutral_30 = theme_edit.neutral
theme_edit.neutral_30a = .36

theme_edit.neutral_40 = theme_edit.neutral
theme_edit.neutral_40a = .45

theme_edit.neutral_50 = theme_edit.neutral
theme_edit.neutral_50a = .57

theme_edit.neutral_60 = theme_edit.neutral
theme_edit.neutral_60a = .91

// Other colors
theme_edit.red_error = hex_to_color("FC453A")
theme_edit.yellow_warning = hex_to_color("FFEB36")
theme_edit.green_success = hex_to_color("64E879")
theme_edit.red = hex_to_color("FF5656")
theme_edit.green = hex_to_color("23FF88")
theme_edit.blue = hex_to_color("1370FB")
theme_edit.pink = hex_to_color("FF5FFF")
theme_edit.origin = hex_to_color("00FFFF")

#endregion
