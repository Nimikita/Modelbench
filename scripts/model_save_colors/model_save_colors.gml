/// model_save_colors()

if (!value[e_value.INHERIT_COLOR])
	json_save_var("color_inherit", false)

if (value[e_value.BLEND_COLOR] != c_white)
	json_save_var_color("color_blend", value[e_value.BLEND_COLOR])

if (value[e_value.OPACITY] < 1)
	json_save_var("color_alpha", value[e_value.OPACITY])

if (value[e_value.BRIGHTNESS] > 0)
	json_save_var("color_brightness", value[e_value.BRIGHTNESS])

if (value[e_value.MIX_COLOR] != c_black)
	json_save_var_color("color_mix", value[e_value.MIX_COLOR])

if (value[e_value.MIX_AMOUNT] > 0)
	json_save_var("color_mix_percent", value[e_value.MIX_AMOUNT])
