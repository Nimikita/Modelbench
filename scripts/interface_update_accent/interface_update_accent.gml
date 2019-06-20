/// interface_update_accent()
/// @desc Updates accent variant colors

var theme = test(setting_dark_theme, theme_dark, theme_light);

if (theme = theme_light)
{
	c_accent10 = c_accent
	c_accent20 = c_accent
	c_accent30 = c_accent
	c_accent50 = merge_color(c_accent, c_white, .17)
	c_accent80 = merge_color(c_accent, c_black, .2)
}
else
{
	c_accent10 = c_accent
	c_accent20 = c_accent
	c_accent30 = c_accent
	c_accent50 = merge_color(c_accent, c_white, .17)
	c_accent80 = merge_color(c_accent, c_black, .2)
}
