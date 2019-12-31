/// popup_about_draw()

// Header
draw_box(dx, dy, dw, 128, false, c_overlay, a_overlay)

// Close
if (draw_button_icon("aboutclose", dx + dw - 12 - 28, dy + 8, 28, 28, false, e_icon.close, null, false))
	popup_close()

// Logo
gpu_set_tex_filter(true)
draw_sprite_ext(spr_logo, 0, dx + dw / 2, dy + 54, .75, .75, 0, c_white, draw_get_alpha())
gpu_set_tex_filter(false)

// Program info
var text, width, textx;
text = text_get("aboutversion", modelbench_version_full) + text_get("aboutreleasedate", modelbench_version_date)
width = string_width_font(text, font_value)
textx = dx + dw/2 - width/2

draw_button_text(text_get("aboutversion", modelbench_version_full), textx, dy + 98, open_url, "https://www.mineimator.com/modelbench", "https://www.mineimator.com/modelbench")
textx += string_width_font(text_get("aboutversion", modelbench_version_full), font_value)

draw_label(text_get("aboutreleasedate", modelbench_version_date), textx, dy + 98, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_value)
draw_label(text_get("aboutforversion", "Mine-imator 1.2.6"), content_x + dw/2, dy + 98 + 19, fa_middle, fa_bottom, c_text_secondary, a_text_secondary, font_value)

dy += 128 + 48
dx = content_x + 64

// Development
dy += 12
draw_label(text_get("aboutdevelopment"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 26
draw_label("Nimi", dx, dy, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 19
draw_button_text("@NimiKitamura", dx, dy, open_url, "https://twitter.com/NimiKitamura", "https://twitter.com/NimiKitamura")

// UI/Branding
dy += 54
draw_label(text_get("aboutuibranding"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 26
draw_label("Voxy", dx, dy, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 19
draw_button_text("@voxybuns", dx, dy, open_url, "https://twitter.com/voxybuns", "https://twitter.com/voxybuns")

// Beta testing
dx += 130 + 24
dy = content_y + 188

draw_label(text_get("aboutbetatesting"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 22

for (var i = 0; i < ds_list_size(beta_testers_list); i++)
{
	draw_label(beta_testers_list[|i], dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
	dy += 19
	
	// Next row
	if (i = 8)
	{
		dx += 130 + 24
		dy = content_y + 210
	}
}

// Special thanks
dx += 130 + 24
dy = content_y + 188

draw_label(text_get("aboutspecialthanks"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 26
draw_label("David", dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 19
draw_button_text("@stuffbydavidn", dx, dy, open_url, "https://twitter.com/stuffbydavidn", "https://twitter.com/stuffbydavidn")
dy += 54
