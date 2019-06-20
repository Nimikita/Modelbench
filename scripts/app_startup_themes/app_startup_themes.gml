/// app_startup_themes()

globalvar c_accent, c_accent10, a_accent10, c_accent20, a_accent20, c_accent30, a_accent30, c_accent50, a_accent50, c_accent80, a_accent80;
globalvar c_neutral10, a_neutral10, c_neutral20, a_neutral20, c_neutral40, a_neutral40, c_neutral50, a_neutral50, c_neutral60, a_neutral60, c_neutral100, a_neutral100;
globalvar c_background, c_error, c_axisred, c_axisgreen, c_axisblue, c_origin;
globalvar theme_light, theme_dark;

#region Light theme
theme_light = new(obj_theme);

theme_light.name = "light"
theme_light.pattern = 0
theme_light.accent_list = array()
array_add(theme_light.accent_list, hex_to_color("EE3030"))
array_add(theme_light.accent_list, hex_to_color("E47D31"))
array_add(theme_light.accent_list, hex_to_color("ECAD0C"))
array_add(theme_light.accent_list, hex_to_color("53CD35"))
array_add(theme_light.accent_list, hex_to_color("18B557"))
array_add(theme_light.accent_list, hex_to_color("18B5AB"))
array_add(theme_light.accent_list, hex_to_color("2144F1"))
array_add(theme_light.accent_list, hex_to_color("982BCB"))
array_add(theme_light.accent_list, hex_to_color("E93983"))

theme_light.background = c_white

// Accent alpha
theme_light.accent_10a = .11
theme_light.accent_20a = .28
theme_light.accent_30a = .47
theme_light.accent_50a = 1
theme_light.accent_80a = 1

// Neutral colors
theme_light.neutral = hex_to_color("000000")

theme_light.neutral_10 = theme_light.neutral
theme_light.neutral_10a = .05

theme_light.neutral_20 = theme_light.neutral
theme_light.neutral_20a = .14

theme_light.neutral_40 = theme_light.neutral
theme_light.neutral_40a = .36

theme_light.neutral_50 = theme_light.neutral
theme_light.neutral_50a = .45

theme_light.neutral_60 = theme_light.neutral
theme_light.neutral_60a = .57

theme_light.neutral_100 = theme_light.neutral
theme_light.neutral_100a = .91

// Other colors
theme_light.red_error = hex_to_color("FF2020")
theme_light.red = hex_to_color("FF5656")
theme_light.green = hex_to_color("23FF88")
theme_light.blue = hex_to_color("1370FB")
theme_light.pink = hex_to_color("FF5FFF")
theme_light.origin = hex_to_color("00FFFF")

#endregion

#region Dark theme
theme_dark = new(obj_theme);

theme_dark.name = "dark"
theme_dark.pattern = 0
theme_dark.accent_list = array()
array_add(theme_dark.accent_list, hex_to_color("FF5F55"))
array_add(theme_dark.accent_list, hex_to_color("FA9B56"))
array_add(theme_dark.accent_list, hex_to_color("FFED47"))
array_add(theme_dark.accent_list, hex_to_color("73DF58"))
array_add(theme_dark.accent_list, hex_to_color("35D274"))
array_add(theme_dark.accent_list, hex_to_color("30DDC8"))
array_add(theme_dark.accent_list, hex_to_color("4986FB"))
array_add(theme_dark.accent_list, hex_to_color("BB5DE8"))
array_add(theme_dark.accent_list, hex_to_color("FF6593"))

theme_dark.background = hex_to_color("101010")

// Accent alpha
theme_dark.accent_10a = .11
theme_dark.accent_20a = .28
theme_dark.accent_30a = .47
theme_dark.accent_50a = 1
theme_dark.accent_80a = 1

// Neutral colors
theme_dark.neutral = hex_to_color("FFFFFF")

theme_dark.neutral_10 = theme_dark.neutral
theme_dark.neutral_10a = .05

theme_dark.neutral_20 = theme_dark.neutral
theme_dark.neutral_20a = .14

theme_dark.neutral_40 = theme_dark.neutral
theme_dark.neutral_40a = .36

theme_dark.neutral_50 = theme_dark.neutral
theme_dark.neutral_50a = .45

theme_dark.neutral_60 = theme_dark.neutral
theme_dark.neutral_60a = .57

theme_dark.neutral_100 = theme_dark.neutral
theme_dark.neutral_100a = .91

// Other colors
theme_dark.red_error = hex_to_color("FF2020")
theme_dark.red = hex_to_color("FF5656")
theme_dark.green = hex_to_color("23FF88")
theme_dark.blue = hex_to_color("1370FB")
theme_dark.pink = hex_to_color("FF5FFF")
theme_dark.origin = hex_to_color("00FFFF")

#endregion

interface_update()
