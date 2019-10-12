/// header_about()

header_menu_panel()

draw_image(spr_icon, 0, dx + dw/2, dy + 64)
dy += 128 + 32

// Modelbench version
draw_label("Modelbench " + modelbench_version_full, dx + dw/2, dy, fa_center, fa_bottom, c_accent, 1, font_heading)
dy += 16
draw_label(text_get("aboutforversion", "MINE-IMATOR 1.2.6"), dx + dw/2, dy, fa_center, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 32 + 8


// Credits
//draw_label(text_get("aboutcredits"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
//dy += 16 + 8

draw_label(text_get("aboutdevelopment"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16
draw_label("Nimi", dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 20
draw_url("@NimiKitamura", "https://twitter.com/NimiKitamura", dx, dy + 4)
dy += 40

draw_label(text_get("aboutuibranding"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16
draw_label("Voxy", dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 20
draw_url("@voxybuns", "https://twitter.com/voxybuns", dx, dy + 4)
dy += 40

draw_label(text_get("aboutspecialthanks"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16
draw_label("David", dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 20
draw_url("@stuffbydavidn", "https://twitter.com/stuffbydavidn", dx, dy + 4)
dy += 40

draw_label(text_get("aboutbetatesting"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16

for (var i = 0; i < ds_list_size(beta_testers_list); i++)
{
	draw_label(beta_testers_list[|i], dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
	dy += 20
}
dy += 16

// Other
//draw_label("OTHER", dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
//dy += 16 + 8

draw_label(text_get("aboutgmruntime"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16
draw_label(text_get("aboutgmruntimeprefix", gm_runtime), dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 32

draw_label(text_get("aboutcompileoutput"), dx, dy, fa_left, fa_bottom, c_text_tertiary, a_text_tertiary, font_subheading)
dy += 16
draw_label(test(code_is_compiled(), text_get("aboutcompileoutputyyc"), text_get("aboutcompileoutputvm")), dx, dy + 4, fa_left, fa_bottom, c_text_secondary, a_text_secondary, font_emphasis)
dy += 32
