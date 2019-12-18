/// tab_preview_render()

// SSAO
tab_control_switch()
//draw_button_collapse("previewssao", !setting_collapse_ssao, action_collapse_ssao, !setting_render_ssao)
draw_switch("previewssao", dx, dy, setting_render_ssao, action_setting_render_ssao, true)
tab_next()

/*
if (setting_render_ssao && !setting_collapse_ssao)
{
	tab_control(48)
	draw_meter("previewssaoradius", dx, dy, dw, setting_render_ssao_radius, 48, 0, 16, 5, 1, tab.render.tbx_ssao_radius, action_setting_render_ssao_radius)
	tab_next()
	
	tab_control(48)
	draw_meter("previewssaopower", dx, dy, dw, round(setting_render_ssao_power * 100), 48, 0, 500, 100, 1, tab.render.tbx_ssao_power, action_setting_render_ssao_power)
	tab_next()
	
	tab_control(48)
	draw_meter("previewssaoblurpasses", dx, dy, dw, setting_render_ssao_blur_passes, 48, 0, 8, 2, 1, tab.render.tbx_ssao_blur_passes, action_setting_render_ssao_blur_passes)
	tab_next()
}
*/

// Shadows
tab_control_switch()
//draw_button_collapse("previewshadows", !setting_collapse_shadows, action_collapse_shadows, !setting_render_shadows)
draw_switch("previewshadows", dx, dy, setting_render_shadows, action_setting_render_shadows, false)
tab_next()

/*
if (setting_render_shadows && !setting_collapse_shadows)
{
	tab_control(48)
	draw_meter("previewshadowsblurquality", dx, dy, dw, setting_render_shadows_blur_quality, 48, 1, 128, 64, 1, tab.render.tbx_shadows_blur_quality, action_setting_render_shadows_blur_quality)
	tab_next()
	
	tab_control(48)
	draw_meter("previewshadowsblursize", dx, dy, dw, round(setting_render_shadows_blur_size * 100), 48, 0, 400, 10, 1, tab.render.tbx_shadows_blur_size, action_setting_render_shadows_blur_size)
	tab_next()
}
*/

// AA
tab_control_switch()
draw_switch("previewaa", dx, dy, setting_render_aa, action_setting_render_aa, false)
tab_next()
