/// tab_settings_render()

// SSAO
tab_control_switch()
draw_button_collapse("settingsrenderssao", !setting_collapse_ssao, action_collapse_ssao, !setting_render_ssao)
draw_switch("settingsrenderssao", dx, dy, setting_render_ssao, action_setting_render_ssao)
tab_next()

if (setting_render_ssao && !setting_collapse_ssao)
{
	tab_control(48)
	draw_meter("settingsrenderssaoradius", dx, dy, dw, setting_render_ssao_radius, 48, 0, 16, 5, 1, tab.render.tbx_ssao_radius, action_setting_render_ssao_radius)
	tab_next()
	
	tab_control(48)
	draw_meter("settingsrenderssaopower", dx, dy, dw, round(setting_render_ssao_power * 100), 48, 0, 500, 100, 1, tab.render.tbx_ssao_power, action_setting_render_ssao_power)
	tab_next()
	
	tab_control(48)
	draw_meter("settingsrenderssaoblurpasses", dx, dy, dw, setting_render_ssao_blur_passes, 48, 0, 8, 2, 1, tab.render.tbx_ssao_blur_passes, action_setting_render_ssao_blur_passes)
	tab_next()
}

// Shadows
tab_control_switch()
draw_button_collapse("settingsrendershadows", !setting_collapse_shadows, action_collapse_shadows, !setting_render_shadows)
draw_switch("settingsrendershadows", dx, dy, setting_render_shadows, action_setting_render_shadows)
tab_next()

if (setting_render_shadows && !setting_collapse_shadows)
{
	tab_control(48)
	draw_meter("settingsrendershadowsblurquality", dx, dy, dw, setting_render_shadows_blur_quality, 48, 1, 128, 64, 1, tab.render.tbx_shadows_blur_quality, action_setting_render_shadows_blur_quality)
	tab_next()
	
	tab_control(48)
	draw_meter("settingsrendershadowsblursize", dx, dy, dw, round(setting_render_shadows_blur_size * 100), 48, 0, 400, 20, 1, tab.render.tbx_shadows_blur_size, action_setting_render_shadows_blur_size)
	tab_next()
}