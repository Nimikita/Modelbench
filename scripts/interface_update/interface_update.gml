/// interface_update()
/// @desc Updates interface colors based on selected theme

var theme = setting_theme;

// Accent color(s)

if (setting_accent = 9)
	c_accent = setting_accent_custom
else
	c_accent = theme.accent_list[setting_accent]

a_accent10 = theme.accent_10a
a_accent20 = theme.accent_20a
a_accent30 = theme.accent_30a
a_accent50 = theme.accent_50a
a_accent80 = theme.accent_80a

interface_update_accent()

// Neutral colors
c_neutral10 = theme.neutral_10
a_neutral10 = theme.neutral_10a

c_neutral20 = theme.neutral_20
a_neutral20 = theme.neutral_20a

c_neutral30 = theme.neutral_30
a_neutral30 = theme.neutral_30a

c_neutral40 = theme.neutral_40
a_neutral40 = theme.neutral_40a

c_neutral50 = theme.neutral_50
a_neutral50 = theme.neutral_50a

c_neutral60 = theme.neutral_60
a_neutral60 = theme.neutral_60a

c_background = theme.background
c_viewport_top = theme.viewport_top
c_viewport_bottom = theme.viewport_bottom
c_error = theme.red_error
c_warning = theme.yellow_warning
c_success = theme.green_success
c_axisred = theme.red
c_axisgreen = theme.green
c_axisblue = theme.blue
c_origin = theme.origin
c_bend = theme.pink