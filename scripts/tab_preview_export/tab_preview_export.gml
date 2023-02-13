/// tab_preview_export()

function tab_preview_export()
{
	togglebutton_add("previewexportsize256", null, 256, setting_preview_export_size = 256, action_setting_export_size)
	togglebutton_add("previewexportsize512", null, 512, setting_preview_export_size = 512, action_setting_export_size)
	togglebutton_add("previewexportsize1024", null, 1024, setting_preview_export_size = 1024, action_setting_export_size)
	
	tab_control_togglebutton()
	draw_togglebutton("previewexportsize", dx, dy)
	tab_next()
	
	tab_control_switch()
	draw_switch("previewincludebackground", dx, dy, setting_preview_background, action_setting_background)
	tab_next()
	
	tab_control_button_label()
	draw_button_label("previewexportimage", floor(dx + dw/2), dy, null, icons.IMAGE_EXPORT, e_button.PRIMARY, action_preview_exportimage_save, e_anchor.CENTER)
	tab_next()
}
